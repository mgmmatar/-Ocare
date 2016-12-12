/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.service.imp;

import com.obird.utility.ODate;
import com.ocare.obook.dao.ExamineTypeDao;
import com.ocare.obook.dao.PatientDao;
import com.ocare.obook.dao.ReservationDao;
import com.ocare.obook.dao.ReservationWayDao;
import com.ocare.obook.dao.WorkingTimeDao;
import com.ocare.obook.domain.AvailableRange;
import com.ocare.obook.domain.ExamineType;
import com.ocare.obook.domain.Patient;
import com.ocare.obook.domain.Reservation;
import com.ocare.obook.domain.ReservationWay;
import com.ocare.obook.domain.WeekDay;
import com.ocare.obook.domain.WorkingTime;
import com.ocare.obook.holder.ReportReservationStatus;
import com.ocare.obook.holder.ReservationHolder;
import com.ocare.obook.holder.ShiftReservation;
import com.ocare.obook.holder.ShiftSlice;
import com.ocare.obook.holder.StatisticReportModule;
import com.ocare.obook.holder.TimeSlice;
import com.ocare.obook.service.ExamineTypeService;
import com.ocare.obook.service.ReservationService;
import com.ocare.obook.service.WeekDayService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author khaledeng
 */
@Service("reservationService")
public class ReservationServiceImpl implements ReservationService{

    @Autowired
    private ReservationDao reservationDao;
   
    @Autowired
    private PatientDao patientDao;
    
    @Autowired
    private ReservationWayDao reservationWayDao;
    
    @Autowired
    private WeekDayService weekDayService;
    
    @Autowired
    private ExamineTypeService  examineTypeService;
   
    @Autowired
    private WorkingTimeDao workingTimeDao;
    
    @Autowired
    private ExamineTypeDao examineTypeDao;
    
   
    
    @Override
    public List<Reservation> getAllReservations() {
        return reservationDao.getAllReservations();
    }

    
    @Override
    public Reservation getReservation(Integer reservationId) {
        return reservationDao.get(reservationId);
    }

    
    @Override
    public Reservation reservePatient(ReservationHolder reservationHolder) {
        // filling the reservationProcesses
        Reservation reservation = fillReservation(reservationHolder);
        /// Saving Reservation 
        reservationDao.save(reservation);
        // return result 
        return reservation;
    }
      
    private Reservation fillReservation(ReservationHolder reservationHolder){
       // Creating New Reservation Object 
        Reservation reservation  = new Reservation();
        /////////////////////////////////////////////////////////////////////
        // Filling Patient Information
        Patient patient=patientDao.get(reservationHolder.getPatientId());
        reservation.setPatient(patient);
        // Filling ExamineType Information
        ExamineType examineType=examineTypeDao.get(reservationHolder.getExamineTypeId());
        reservation.setExamineType(examineType);
        // Filling ReservationWay Information
        if(reservationHolder.getReservationWayId()!=null){
        ReservationWay reservationWay=reservationWayDao.get(reservationHolder.getReservationWayId());
        reservation.setReservationWay(reservationWay);
        }//end if condition 
        // Filling WorkingTime Information 
        WorkingTime workingTime=workingTimeDao.get(reservationHolder.getWorkingTimeId());
        reservation.setWorkingTime(workingTime);
        // Assign the Reservation Status 
        reservation.setStatus("WAITING");
        ///////////////////////////////////////////////////////////
        // Filling registerationDate
        reservation.setReservationDate(ODate.getDateFromString(reservationHolder.getReservationDate()));
        // Filling the Attendece Time infotmation
        Date attendenceTimeFrom = ODate.get24HourTimeFromString(reservationHolder.getAttendenceTime());
        reservation.setAttendenceTimeFrom(attendenceTimeFrom);
        reservation.setAttendenceTimeTo(ODate.addMinutesToDate(attendenceTimeFrom, examineType.getEstimatedPeriod()));
        /// Register Payment 
        Float paidValue = Float.parseFloat(reservationHolder.getPaidCost());
        Float totalValue= Float.parseFloat(reservationHolder.getTotalCost());
        
        reservation.setPaid(paidValue);
        reservation.setRemain(totalValue-paidValue);
       // return reservation 
        return reservation;
     }   

    @Override
    public Reservation getLastReservation(Date day) {
       return reservationDao.getLastReservation(day);
    }

    @Override
    public List<Reservation> getReservationsForShift(Date day,Integer shift){
     
        return reservationDao.getReservationsForShift(day, shift);
      
    }
    
    
    private List<Reservation> getDoneReservationsForShift(Date day,Integer shift){
     
        return reservationDao.getDoneReservationsForShift(day, shift);
      
    }
    
    
    @Override
    public List<AvailableRange> getAllAvailableTimes(String reservationDate,String dayShortName, String examineTypeId) {
        //// Getting Working WeekDay
        WeekDay  weekDay=weekDayService.getWeekDay(dayShortName);
        ///// Getting Examine Type Object
        ExamineType examineType=examineTypeService.get(Integer.parseInt(examineTypeId));
        // Preparing List of All Available Times
        List<AvailableRange> availableTimeRanges= new  ArrayList<AvailableRange>();
        // Loop For Shifts on That Day    
        for(WorkingTime workingTime:weekDay.getWorkingTimes()){
            // Getting All Resercation within that Date 
            List<Reservation> reservations= getReservationsForShift(ODate.getDateFromString(reservationDate),workingTime.getId());
            if(reservations!=null){
                //// Getting All information
                Date startTime= workingTime.getTimeFrom();
                Date endTime= workingTime.getTimeTo();
                // For loop    
                for(int i=0;i<reservations.size();i++){
                       Reservation reservation = reservations.get(i);   
                       AvailableRange availableRange= new AvailableRange();
                       int timeDiff =ODate.getMinutesBetweenTimes(reservations.get(i).getAttendenceTimeFrom(), startTime);
                            if((timeDiff!=0)&&(timeDiff>=examineType.getEstimatedPeriod())){
                              // Set Available Times
                                 availableRange.setShift(reservations.get(i).getWorkingTime().getId());
                                 availableRange.setTimeFrom(startTime);
                                 availableRange.setTimeTo(reservations.get(i).getAttendenceTimeFrom());
                                 availableTimeRanges.add(availableRange);
                                 System.out.println(">> "+availableRange);
                                 startTime=reservations.get(i).getAttendenceTimeTo();
                              }//end Outer If     
                            if(i==reservations.size()-1){
                                 availableRange.setShift(reservations.get(i).getWorkingTime().getId());
                                 availableRange.setTimeFrom(startTime);
                                 availableRange.setTimeTo(endTime);
                                 availableTimeRanges.add(availableRange);   
                                 System.out.println(">> "+availableRange);
                            }//end if condition 
                }//end for Loop                 
            }else{
                  
            }//end Else   
             
        }//end ForEach 
         
        return availableTimeRanges;
        
    }//end Method  

    @Override
    public List<ShiftSlice> getTimeSlices(Date date,Integer slicingFactor) {      
/////////////////////////////////////////////////////////////
       ///////////////////////////////////////////////////////////////////////////////////////////////
       List<ShiftSlice> shiftReservations=new ArrayList<ShiftSlice>();
        // Getting ShortName for CurrrentDate
        String dayShortName=ODate.getWeekDay(date);
        WeekDay weekDay=weekDayService.getWeekDay(dayShortName);
        /// Get Day Shifts Reservations
        for(WorkingTime workingTime:weekDay.getWorkingTimes()){
            ////////////////////////////////////////////////////////////////////////////////////////////////
            /// Creating new Shift 
            ShiftSlice shiftReservation=new ShiftSlice();
            shiftReservation.setShiftId(workingTime.getId());
            List<TimeSlice> slices= new ArrayList<TimeSlice>();
            /// Getting all Resrvations within that Shift 
            List<Reservation> reservations=getReservationsForShift(date,workingTime.getId());
            /// Getting Shift Start , End Times 
            Date startTime =ODate.getDateTimeFormat(date, workingTime.getTimeFrom());   
            Date endTime = ODate.getDateTimeFormat(date,workingTime.getTimeTo());         
            ////////////////////////////////////////////////////////////////////////////////////////////////
            //// Time Slicing Process 
            ///////////////////////////
            // intialize Iterator
            int iterator=0;
            ///////////////////////////////////////////
            for(;startTime.before(endTime);){
            // Creating new Time Slice  
            //////////////////////// 
            if(iterator<reservations.size()){
                /// Getting Current Iterated Date   
                Date iteratedDate=(ODate.getDateTimeFormat(date, reservations.get(iterator).getAttendenceTimeFrom())); 
                /// Getting Differnce    
                int diff=ODate.getMinutesBetweenTimes(iteratedDate,startTime);
                //// Checking Difference Status             
                if(diff>=slicingFactor){
                        TimeSlice slice=new TimeSlice();
                        slice.setStatus("Available");
                        slice.setTimeFrom(startTime);
                        slice.setVisitPeriod(slicingFactor);
                        ///// Modfying the EndPoint 
                        startTime=ODate.addMinutesToDate(startTime, slicingFactor);
                        slice.setTimeTo(startTime);
                        /// Adding Slice To Slices List
                        slices.add(slice);
                   }else{
                       if(diff!=0){
                        // Create New Slice    
                        TimeSlice slice=new TimeSlice();   
                        slice.setStatus("Less");
                        slice.setTimeFrom(startTime);
                        slice.setVisitPeriod(diff);
                        /// Update StartTime for Next 
                        startTime=ODate.getDateTimeFormat(date, reservations.get(iterator).getAttendenceTimeFrom());
                        slice.setTimeTo(startTime);
                        //// Adding Slice To List 
                        slices.add(slice);
                       }//end if
                        //// Create New Slice
                        TimeSlice slice=new TimeSlice();    
                        slice.setStatus("Busy");
                        
                        slice.setTimeFrom(startTime);
                        slice.setVisitPeriod(reservations.get(iterator).getExamineType().getEstimatedPeriod());
                        slice.setTimeTo(reservations.get(iterator).getAttendenceTimeTo());
                        /// Update StartTime 
                        startTime=ODate.getDateTimeFormat(date, reservations.get(iterator).getAttendenceTimeTo());
                        /// Adding Slice TO List 
                        slices.add(slice);
                        iterator++;
                   }//end if Else   
                   
                }else{
                        TimeSlice slice=new TimeSlice();   
                        slice.setStatus("Avaiable");
                        slice.setTimeFrom(startTime);
                        slice.setVisitPeriod(slicingFactor);
                        startTime=ODate.addMinutesToDate(startTime, slicingFactor);
                        slice.setTimeTo(startTime);
                        /// Adding Slice to Slice List 
                        slices.add(slice);
                }//end Else
            }//end For Loop
            /////////////////////////////////////////////////////////////////////////////////////////////////
            /////////////////////////////////////////////////////////////////////////////////////////////////
            /// Adding Slices to ShiftReservation Time Slices
            shiftReservation.setSlices(slices);
            /// Adding ShiftReservation to List 
            shiftReservations.add(shiftReservation);
        }//end for Loop 
        ////////////////////////////////////////////////////
        /// View Result 
        ///////////////////////
        for(ShiftSlice shift:shiftReservations){
        
            System.out.println("shift "+shift.getShiftId());
              for(TimeSlice slice:shift.getSlices()){
                  System.out.println("SLICE "+slice.toString());   
              } 
        }//end for Loop 
       ///////////////////////////////////////////////////////////////////////////////////////////////
      /// return List of Reservation Shift 
        return shiftReservations;
    }//end Method getTimeSlices

    @Override
    public List<ShiftReservation> getAllShiftReservations(Date day) {
        // Create New List of Shift Reservation 
        List<ShiftReservation> shiftReservations=new ArrayList<ShiftReservation>();
        // Getting Day Shifts 
        String dayShortName=ODate.getWeekDay(day);
        WeekDay weekDay=weekDayService.getWeekDay(dayShortName);
            /// Get Day Shifts Reservations
            for(WorkingTime workingTime:weekDay.getWorkingTimes()){
                // Creating New Shift Reservation
                ShiftReservation shiftReservation=new ShiftReservation();
                /// Getting Shift ID
                Integer shiftId=workingTime.getId();
                // Assign Shift Reservation
                shiftReservation.setShiftId(shiftId);
                List<Reservation> reservations=getReservationsForShift(day,shiftId);
                if(!reservations.isEmpty()){
                     shiftReservation.setReservations(reservations);
                }//end If Condition 
                shiftReservations.add(shiftReservation);
            }//end for Loop     
        // return result List 
        return shiftReservations;
    }//end getAllShiftReservations 

    @Override
    @Transactional
    public boolean cancelReservation(Integer reservationId) {
        /// Boolean to be returned
        boolean canceled=false;
        // Getting Reservation Object 
        Reservation reservation = getReservation(reservationId);
        // Check if Reservation is Found 
        if(reservation!=null){
             reservation.setStatus("CANCELLED");
             reservationDao.update(reservation);
             canceled=true;
        }//end if 
        // return result 
        return canceled;
    }

    @Override
    public boolean confirmReservation(Integer reservationId) {
        /// Boolean to be returned
        boolean confirmed=false;
        // Getting Reservation Object 
        Reservation reservation = getReservation(reservationId);
        // Check if Reservation is Found 
        if(reservation!=null){
             reservation.setStatus("CONFIRMED");
             reservationDao.update(reservation);
             confirmed=true;
        }//end if 
        // return result 
        return confirmed;   
    }

    @Override
    public List<Reservation> getReservationsForPatient(Integer patientId) {
      return reservationDao.getReservationsForPatient(patientId);
    }

    @Override
    public List<Reservation> getReservationsForPatientByDates(Integer patientId, Date fromDate, Date toDate) {
        return reservationDao.getReservationsForPatientByDates(patientId, fromDate, toDate);
    }

    @Override
    public List<ReportReservationStatus> getReservationStatus(Integer patientId) {
        return reservationDao.getReservationStatus(patientId);
    }

    @Override
    public List<ReportReservationStatus> getReservationStatusByDates(Integer patientId, Date fromDate, Date toDate) {
        return reservationDao.getReservationStatusByDates(patientId, fromDate, toDate);
    }

    @Override
    public List<StatisticReportModule> getTodayReservationReport(Date today) {
        return reservationDao.getTodayReservationReport(today);
    }

    @Override
    public List<StatisticReportModule> getTodayInsurranceReport(Date today) {
        return reservationDao.getTodayInsurranceReport(today);
    }

    @Override
    public List<StatisticReportModule> getReservationReportWithRange(Date fromDate, Date toDate) {
        return reservationDao.getReservationReportWithRange(fromDate, toDate);
    }

    @Override
    public List<StatisticReportModule> getInsuranceReportWithRange(Date fromDate, Date toDate) {
        return reservationDao.getInsuranceReportWithRange(fromDate, toDate);
    }

    @Override
    public List<ShiftReservation> getAllDoneReservations(Date day) {
         // Create New List of Shift Reservation 
        List<ShiftReservation> shiftReservations=new ArrayList<ShiftReservation>();
        // Getting Day Shifts 
        String dayShortName=ODate.getWeekDay(day);
        WeekDay weekDay=weekDayService.getWeekDay(dayShortName);
            /// Get Day Shifts Reservations
            for(WorkingTime workingTime:weekDay.getWorkingTimes()){
                // Creating New Shift Reservation
                ShiftReservation shiftReservation=new ShiftReservation();
                /// Getting Shift ID
                Integer shiftId=workingTime.getId();
                // Assign Shift Reservation
                shiftReservation.setShiftId(shiftId);
                List<Reservation> reservations=getDoneReservationsForShift(day,shiftId);
                if(!reservations.isEmpty()){
                     shiftReservation.setReservations(reservations);
                }//end If Condition 
                shiftReservations.add(shiftReservation);
            }//end for Loop     
        // return result List 
        return shiftReservations;
    }


}//end Service 