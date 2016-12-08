/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.controller;

import com.obird.utility.ODate;
import com.ocare.obook.domain.ExamineType;
import com.ocare.obook.domain.InsuranceProfile;
import com.ocare.obook.domain.Patient;
import com.ocare.obook.domain.Reservation;
import com.ocare.obook.domain.ReservationWay;
import com.ocare.obook.domain.WeekDay;
import com.ocare.obook.holder.ReservationCost;
import com.ocare.obook.holder.ReservationHolder;
import com.ocare.obook.holder.ShiftReservation;
import com.ocare.obook.holder.ShiftSlice;
import com.ocare.obook.service.ExamineTypeService;
import com.ocare.obook.service.InsuranceProfileService;
import com.ocare.obook.service.PatientService;
import com.ocare.obook.service.ReservationService;
import com.ocare.obook.service.ReservationWayService;
import com.ocare.obook.service.WeekDayService;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author khaledeng
 */

@Controller("reservationController")
@RequestMapping("/reservation")
public class ReservationController {

    private final String MODULE_ROOT = "/OBook/reservation/";

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private WeekDayService weekDayService;

    @Autowired
    private PatientService patientService;

    @Autowired
    private ReservationWayService reservationWayService;

    @Autowired
    private ExamineTypeService examineTypeService;
    
    @Autowired
    private InsuranceProfileService insuranceProfileService;

    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN","ROLE_RESERVATION_USER"})
    @RequestMapping("/process/{id}")
    public String processReservation(@PathVariable("id") Integer patientId, Model model) {
        // Get patient
        Patient patient = patientService.getPatientById(patientId);
        /// Load For Today
        Date currentDate = new Date();
        String dayShortName = ODate.getWeekDay(currentDate);
        WeekDay weekDay = weekDayService.getWeekDay(dayShortName);
        /// Preparing List of data 
        List<ExamineType> examineTypes=examineTypeService.getAllExamineTypes();
        List<ReservationWay> reservationWays = reservationWayService.getAllReservationWays();
        /// Retrieve defaultExamineType
        ExamineType defaultExamineType = examineTypeService.getDefaultExamineType();
        // Choose First ExamineType as the Default One
        if(defaultExamineType==null){
             defaultExamineType = examineTypes.get(0);
        }//end if Condition 
       /// Model Data to View
        model.addAttribute("patient", patient);
        model.addAttribute("defaultExamineType", defaultExamineType);
        model.addAttribute("reservationWays", reservationWays);
        model.addAttribute("examineTypes", examineTypes);
        model.addAttribute("currentDate", ODate.getStringDateForCalendar(currentDate));
        model.addAttribute("weekDay", weekDay);
        // Send View 
        return MODULE_ROOT + "reservationProcess";
    }//end registerPatient

    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN","ROLE_RESERVATION_USER","ROLE_INQUIRY_USER"})
    @RequestMapping("/preview")
    public String reservationPreviewProcess(Model model) {
        // Get Important Information for Preview 
        Date currentDate = new Date();
        String dayShortName = ODate.getWeekDay(currentDate);
        WeekDay weekDay = weekDayService.getWeekDay(dayShortName);
        /// Preparing List of data 
        List<ExamineType> examineTypes=examineTypeService.getAllExamineTypes();
        /// Getting All Time Slices
        List<ShiftSlice> shifts = reservationService.getTimeSlices(currentDate,examineTypes.get(0).getEstimatedPeriod());
        /// Model Data to View
        model.addAttribute("examineTypes", examineTypes);
        model.addAttribute("currentDate", ODate.getStringDateForCalendar(currentDate));
        model.addAttribute("weekDay", weekDay);
        model.addAttribute("shifts", shifts);
        //model.addAttribute("", model)
        return MODULE_ROOT + "reservationPreview";
    }//end registerPatient
    
    @RequestMapping("/list")
    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN","ROLE_RESERVATION_USER"})
    public String reservationProcess2(Model model) {
        // Get patient
        Date currentDate = new Date();
        String dayShortName = ODate.getWeekDay(currentDate);
        WeekDay weekDay = weekDayService.getWeekDay(dayShortName);
        /// Model Data to View
        model.addAttribute("currentDate", ODate.getStringDateForCalendar(currentDate));
        model.addAttribute("weekDay", weekDay);
        // Return result 
        return MODULE_ROOT + "reservationList";
    }//end registerPatient

    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN","ROLE_RESERVATION_USER"})
    @RequestMapping(value = "/processReservation", method = RequestMethod.POST)
    public String registerationProcess(@ModelAttribute ReservationHolder reservationHolder, BindingResult result, Model model, HttpServletRequest request) {
        // TODO Validate PatientHolder
        Reservation reservation = reservationService.reservePatient(reservationHolder);
        // redirect to Patient List
        return MODULE_ROOT + "reservationList";
    }//end registerPatient
///////////////////////////////////////////////////////////////////////////////////////////
///          TimeSlicing Loader
//////////////////////////////////////////////////////////////////////////////////////////
    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN","ROLE_RESERVATION_USER","ROLE_INQUIRY_USER"})
    @RequestMapping(value = "/timeSlice/{date},{examineType}", method = RequestMethod.GET, produces = "application/json")
    public String slicingTimeForDate(@PathVariable("date") String dateString, @PathVariable("examineType") Integer examineTypeId, Model model) {
        ////////////////////////////////////////////////////////////        
        Date currentDate = ODate.getDateFromString(dateString);
        ExamineType examineType = examineTypeService.get(examineTypeId);
        // Getting Day Shifts 
        String dayShortName = ODate.getWeekDay(currentDate);
        WeekDay weekDay = weekDayService.getWeekDay(dayShortName);
        /// Getting All Time Slices
        List<ShiftSlice> shifts = reservationService.getTimeSlices(currentDate, examineType.getEstimatedPeriod());
        // Sent Data tO View
        model.addAttribute("currentDate", ODate.getStringDateForCalendar(currentDate));
        model.addAttribute("weekDay", weekDay);
        model.addAttribute("shifts", shifts);
        //////////////////////////////////////////////////////////////
        // returning Wanted Page
        return MODULE_ROOT + "timeSlices";
    }
    
    ////////////////////////////////////////////////////////
    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN","ROLE_RESERVATION_USER","ROLE_INQUIRY_USER"})
    @RequestMapping(value = "/examineCost/{patient},{examineType}", method = RequestMethod.GET, produces = "application/json")
    public String costForExamine(@PathVariable("patient") Integer patientId, @PathVariable("examineType") Integer examineTypeId, Model model) {
        ////////////////////////////////////////////////////////////
        /// Getting PatientInfo
        Patient patient=patientService.getPatientById(patientId);
        ExamineType examineType=examineTypeService.get(examineTypeId);
        //check if He is Insurred
        boolean insurred = false;
        ReservationCost cost=null;
        float totalCost = examineType.getCost();
        if(patient.getInsuranceCompany()!=null){
            
            InsuranceProfile insuranceProfile=insuranceProfileService.getProfileForCompanyAndExamine(patient.getInsuranceCompany().getId(),examineType.getId());
            
            insurred = true; 
            if(insuranceProfile!=null){
                cost=new ReservationCost(totalCost,insuranceProfile.getPercentage());
            }else{
                cost=new ReservationCost(totalCost,0);
            }//end else 
            
        }else{
            cost=new ReservationCost(totalCost,0);
        }//end else
        // Sent Data tO View
        model.addAttribute("totalCost", cost.getTotalCost());
        model.addAttribute("integerCost", cost.getIntegerString());
        model.addAttribute("fractionCost", cost.getFractionString());
        //////////////////////////////////////////////////////////////
        // returning Wanted Page
        return MODULE_ROOT + "examineCost";
    }
    
/////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/reservationElement/{date}", method = RequestMethod.GET, produces = "application/json")
    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN","ROLE_RESERVATION_USER","ROLE_INQUIRY_USER"})
    public String reservationListForDate(@PathVariable("date") String dateString, Model model) {
        ////////////////////////////////////////////////////////////
        Date currentDate = ODate.getDateFromString(dateString);
        // Getting All Reservations Per Shift 
        List<ShiftReservation> shifts=reservationService.getAllShiftReservations(currentDate);
        // Getting Reservation Shifts
        String dayShortName = ODate.getWeekDay(currentDate);
        WeekDay weekDay = weekDayService.getWeekDay(dayShortName);
        ///////////////////////
        // Sent Data to View
        model.addAttribute("currentDate", ODate.getStringDateForCalendar(currentDate));
        model.addAttribute("weekDay", weekDay);
        model.addAttribute("shifts", shifts);
        // returning Wanted Page
        return MODULE_ROOT + "reservationElement";
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/cancelReservation/{reservationId}", method = RequestMethod.GET)
    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN","ROLE_RESERVATION_USER"})
    public void cancelPatientReservation(@PathVariable("reservationId") Integer reservationId, Model model,HttpServletResponse response) throws IOException {
        /// Getting Reservation 
        boolean cancelled=reservationService.cancelReservation(reservationId);
        String done="true";
        if(!cancelled){
             done="false";
        }
        ////////////////////////////////////////////////////////////
        response.getWriter().write(done);
    }//cancelReservation process 
        /////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/confirmReservation/{reservationId}", method = RequestMethod.GET)
    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN","ROLE_RESERVATION_USER"})
    public void confirmPatientReservation(@PathVariable("reservationId") Integer reservationId, Model model,HttpServletResponse response) throws IOException {
        /// Getting Reservation 
        boolean confirmed=reservationService.confirmReservation(reservationId);
        ////////////////////////////////////////////////////////////
        String done="true";
        if(!confirmed){
             done="false";
        }//end if 
        ////////////////////////////////////////////////////////////
        response.getWriter().write(done);
    }//cancelReservation process 
    
    
}
