/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.controller;

import com.obird.utility.ODate;
import com.ocare.obook.domain.Patient;
import com.ocare.obook.domain.Reservation;
import com.ocare.obook.service.PatientService;
import java.io.OutputStream;
import com.ocare.obook.holder.ReportReservationStatus;
import com.ocare.obook.holder.StatisticReportModule;
import com.ocare.obook.service.ReservationService;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperPrint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author khaledeng
 */
@Controller("reportsController")
@RequestMapping("/report")
@Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN"})
public class ReportsController {
    
    private final String MODULE_PATH="/OBook/reports/";
    
    @Autowired
    private ReservationService reservationService;
    
    @Autowired
    private PatientService patientService;
    
    @RequestMapping("/reservation/download")
    @ResponseBody
    public void reservationReport(HttpServletResponse response,Model model) {
        
        JasperPrint jasperPrint=patientService.patientReport();
   
        try {
            if (response != null) {
                 response=responseBy(response, "pdf","Patient-Report");
                 final OutputStream outStream = response.getOutputStream();
                 JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
            }//end if 
        } catch (Exception e) {
           e.printStackTrace();
        }
    }//end registerPatient
    ///////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////
    private HttpServletResponse responseBy(HttpServletResponse response ,String fileType,String fileName){
       //Setting Application Type
            response.setContentType("application/x-pdf");
            response.setHeader("Content-disposition", "inline; filename="+fileName+"."+fileType);
        // return result 
        return response;    
    }//end HttpServletResponse
    
    @RequestMapping("/test")
    public String testReport(Model model) {
            //// Test Inputs 
            Integer patientId= 1;
            String fromDateString="2015-10-17";
            String toDateString="2015-12-17";
            // Getting Patient 
            Patient patient=patientService.getPatientById(patientId);
            // Getting ReportReservationStatus List and Reservations 
            List<ReportReservationStatus> reportReservationStatus=null;
            List<Reservation> reservations=null;
            /// Cheking if dates Entered    
            if((fromDateString!=null)&&(toDateString!=null)){
                  /// Covert String to Date
                  Date fromDate=ODate.getDateFromString(fromDateString);
                  Date toDate=ODate.getDateFromString(toDateString);
                  if(toDate.compareTo(fromDate)>=0){
                      /// Getting List 
                      reportReservationStatus=reservationService.getReservationStatusByDates(patientId, fromDate, toDate);
                      reservations = reservationService.getReservationsForPatientByDates(patientId, fromDate, toDate);
                  }//end if Condition
                  else{
                        
                  }
            }///end outer If
            else{  
                    reportReservationStatus=reservationService.getReservationStatus(patientId);
                    reservations = reservationService.getReservationsForPatient(patientId);
            }//end Else          
            // return Models
            model.addAttribute("patient", patient);
            model.addAttribute("reservations", reservations);
            model.addAttribute("reportReservationStatus", reportReservationStatus);      
        
        return MODULE_PATH+"patientReport22";
    }//end reservationReport
    
////////////////////////////////////////////////////////////////////////////////////////////////////////    
////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
    Reservation Report Module
    */    
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/reservation")
    public String searchReservationReport(Model model) {
        
        return null;
    }//end reservationReport
    
    @RequestMapping("/reservation/process")
    public String reservationReport(Model model) {
        /// Simulating the Search Parameters 
        Date fromDate=ODate.getDateFromString("2015-10-01");
        Date toDate=ODate.getDateFromString("2015-11-01");
        /// Getting ExamineTypePatients
        List<StatisticReportModule> examineTypePatients=reservationService.getReservationExamineTypePatientsStatistic(fromDate, toDate);
        /// Getting ExamineTypeMoney
        List<StatisticReportModule> examineTypeMoney=reservationService.getReservationExamineTypeMoneyStatistic(fromDate, toDate);
       //// Send Result to View
        model.addAttribute("Process", "Process");
        model.addAttribute("examineTypePatients", examineTypePatients);
        model.addAttribute("examineTypeMoney", examineTypeMoney);
        // return result
        return MODULE_PATH+"reservationReport";
    }//end reservationReport

    
////////////////////////////////////////////////////////////////////////////////////////////////////////    
////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
    Patient Report Module
    */    
//////////////////////////////////////////////////////////////////////////////////////////////////////// 
////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    @RequestMapping("/patient")
    public String patientReport(Model model) {    
        return "patientReport";
    }//end reservationReport
    
    @RequestMapping(value = "/searchPatientReport", method = RequestMethod.POST)
    public String searchPatientReport(@RequestParam(value="patientName",required = false) String patientName,
             @RequestParam(value="patientCode",required = false) String patientCode,
             @RequestParam(value="patientPhone",required = false) String patientPhone,
             Model model, HttpServletRequest request) {
             // Getting Result List 
             List<Patient> patients = patientService.searchForPatient(patientName, patientCode, patientPhone);
             model.addAttribute("patients", patients);
        // return result 
        return "patientReport";
    }//end searchPatient
    
    @RequestMapping(value = "/patientReport", method = RequestMethod.POST)
    public String patientReport(@RequestParam(value="patientId",required = true) Integer patientId,
             @RequestParam(value="fromDate",required = false) String fromDateString,
             @RequestParam(value="toDate",required = false) String toDateString,
             Model model, HttpServletRequest request) {
            // Getting Patient 
            Patient patient=patientService.getPatientById(patientId);
            // Getting ReportReservationStatus List and Reservations 
            List<ReportReservationStatus> reportReservationStatus=null;
            List<Reservation> reservations=null;
            /// Cheking if dates Entered    
            if((fromDateString!=null)&&(toDateString!=null)){
                  /// Covert String to Date
                  Date fromDate=ODate.getDateFromString(fromDateString);
                  Date toDate=ODate.getDateFromString(toDateString);
                  if(toDate.compareTo(fromDate)>=0){
                      /// Getting List 
                      reportReservationStatus=reservationService.getReservationStatusByDates(patientId, fromDate, toDate);
                      reservations = reservationService.getReservationsForPatientByDates(patientId, fromDate, toDate);
                  }//end if Condition
                  else{
                        
                  }
            }///end outer If
            else{  
                    reportReservationStatus=reservationService.getReservationStatus(patientId);
                    reservations = reservationService.getReservationsForPatient(patientId);
            }//end Else          
            // return Models
            model.addAttribute("patient", patient);
            model.addAttribute("reservations", reservations);
            model.addAttribute("reportReservationStatus", reportReservationStatus);
        // return result 
        return MODULE_PATH+"patientReport";
    }//end searchPatient
    
    @RequestMapping("/daily")
    public String dailyReport(Model model) {
        
        return null;
    }//end reservationReport
    
}//end Reports Controller
