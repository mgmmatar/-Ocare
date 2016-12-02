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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperPrint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
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
    
   
     
    @RequestMapping("/today")
    public String dailyReport(Model model) {
        /// Simulating the Search Parameters 
        Date todayDate=new Date();      
        /// Getting reservationReport For Today
        List<StatisticReportModule> todayReservationReport=reservationService.getTodayReservationReport(todayDate);
        /// Getting InsuranceReport for Today
        List<StatisticReportModule> todayInsurranceReport=reservationService.getTodayInsurranceReport(todayDate);
        // Calculate Total Number of Patient for Reservation Report 
        long totalPatient=0;
        double totalProfit=0;
        if(!todayReservationReport.isEmpty()){
            for(StatisticReportModule reportModule:todayReservationReport){
                totalPatient+=reportModule.getOccuranceNumber();
                totalProfit+=reportModule.getModuleSum();
            }//end For Lop 
        }//end if Condition
        // Calculate Total Number of Patient for Reservation Report 
        long totalInsurredPatient=0;
        double totalInsurranceProfit=0;
        if(!todayInsurranceReport.isEmpty()){
            for(StatisticReportModule reportModule:todayInsurranceReport){
                totalInsurredPatient+=reportModule.getOccuranceNumber();
                totalInsurranceProfit+=reportModule.getModuleSum();
            }//end For Lop 
        }//end if Condition
        /// Send Result to View
        model.addAttribute("Process", "Process");
        model.addAttribute("todayReservationReport", todayReservationReport);
        model.addAttribute("todayInsurranceReport", todayInsurranceReport);
        model.addAttribute("totalPatient", totalPatient);
        model.addAttribute("totalProfit", totalProfit);
        model.addAttribute("totalInsurredPatient", totalInsurredPatient);
        model.addAttribute("totalInsurranceProfit", totalInsurranceProfit);
        
        return MODULE_PATH+"todayReport";
    }//end todayReport
    
    @RequestMapping("/reservation")
    public String reservationReport(Model model) {
        
        return MODULE_PATH+"reservationReport";
    }//end reservationReport
    
    @RequestMapping(value = "/reservation/search", method = RequestMethod.POST,produces="application/json")
    public @ResponseBody Map<String,Object> searchReservationReport(@RequestParam(value="dateFrom",required = true) String dateFromString,
             @RequestParam(value="dateTo",required = true) String dateToString,Model model) {
        
        Map<String,Object> models=new HashMap<String,Object>();
        
        if((dateFromString!=null)&&(dateToString!=null)){
                /// Simulating the Search Parameters 
               Date dateFrom=ODate.getDateFromString(dateFromString);        
               Date dateTo=ODate.getDateFromString(dateToString);
               if(dateTo.compareTo(dateFrom)>=0){
                    /// Getting reservationReport For Date Range
                    List<StatisticReportModule> myReservationReport=reservationService.getReservationReportWithRange(dateFrom, dateTo);
                    /// Getting InsuranceReport for Today
                    List<StatisticReportModule> myInsurranceReport=reservationService.getInsuranceReportWithRange(dateFrom, dateTo);
                    // Calculate Total Number of Patient for Reservation Report 
                    long totalPatient=0;
                    double totalProfit=0;
                    if(!myReservationReport.isEmpty()){
                        for(StatisticReportModule reportModule:myReservationReport){
                            totalPatient+=reportModule.getOccuranceNumber();
                            totalProfit+=reportModule.getModuleSum();
                        }//end For Lop 
                    }//end if Condition
                    // Calculate Total Number of Patient for Reservation Report 
                    long totalInsurredPatient=0;
                    double totalInsurranceProfit=0;
                    if(!myInsurranceReport.isEmpty()){
                        for(StatisticReportModule reportModule:myInsurranceReport){
                            totalInsurredPatient+=reportModule.getOccuranceNumber();
                            totalInsurranceProfit+=reportModule.getModuleSum();
                        }//end For Lop 
                    }//end if Condition
                    /// Send Result to View
                    models.put("myReservationReport", myReservationReport);
                    models.put("myInsurranceReport", myInsurranceReport);
                    models.put("totalPatient", totalPatient);
                    models.put("totalProfit", totalProfit);
                    models.put("totalInsurredPatient", totalInsurredPatient);
                    models.put("totalInsurranceProfit", totalInsurranceProfit);
                   System.out.println(">>> Reservation Report "+myReservationReport);
                   System.out.println(">>> Insurance Report "+myInsurranceReport);
                   
               }//end Inner If Condition
        }//end if Condition     
        // return result 
        return models;
    }//end reservationReport
    
    
    @RequestMapping("/patient")
    public String patientReport(Model model) {    
        return MODULE_PATH+"patientReport";
    }//end reservationReport
    
    
    ///////////////////////////////////////////////////////////////////////////
    /*
     *  Test Cases 
     */
    ///////////////////////////////////////////////////////////////////////////
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
    Patient Report Module
    */    
//////////////////////////////////////////////////////////////////////////////////////////////////////// 
////////////////////////////////////////////////////////////////////////////////////////////////////////
    
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
   
}//end Reports Controller
