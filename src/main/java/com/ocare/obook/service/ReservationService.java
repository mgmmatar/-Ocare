/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.service;

import com.ocare.obook.domain.AvailableRange;
import com.ocare.obook.domain.Reservation;
import com.ocare.obook.holder.ReservationHolder;
import com.ocare.obook.holder.ShiftReservation;
import com.ocare.obook.holder.ShiftSlice;
import com.ocare.obook.holder.ReportReservationStatus;
import com.ocare.obook.holder.StatisticReportModule;
import java.util.Date;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface ReservationService {
    
    public Reservation getReservation(Integer reservationId);
    
    public List<Reservation> getAllReservations();
    
    public Reservation reservePatient(ReservationHolder reservationHolder);
    
    public Reservation getLastReservation(Date day);
   
    public List<Reservation> getReservationsForShift(Date day,Integer shift);
   
    public List<AvailableRange> getAllAvailableTimes(String reservationDate,String dayShortName, String examineTypeId);
            
    public List<ShiftSlice> getTimeSlices(Date date,Integer slicingFactor);
    
    public List<ShiftReservation> getAllShiftReservations(Date day);
    
    public boolean cancelReservation(Integer reservationId);
    
    public boolean confirmReservation(Integer reservationId);
    
    public List<Reservation> getReservationsForPatient(Integer patientId);
    
    public List<Reservation> getReservationsForPatientByDates(Integer patientId,Date fromDate,Date toDate);
    
    public List<ReportReservationStatus> getReservationStatus(Integer patientId);  
    
    public List<ReportReservationStatus> getReservationStatusByDates(Integer patientId,Date fromDate,Date toDate);
     
    public List<StatisticReportModule> getReservationExamineTypeMoneyStatistic(Date fromDate,Date toDate);
    
    public List<StatisticReportModule> getReservationExamineTypePatientsStatistic(Date fromDate,Date toDate);
    
}
