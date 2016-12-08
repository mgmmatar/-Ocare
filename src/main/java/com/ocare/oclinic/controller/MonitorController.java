/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.controller;

import com.obird.utility.ODate;
import com.ocare.obook.domain.Patient;
import com.ocare.obook.domain.WeekDay;
import com.ocare.obook.service.PatientService;
import com.ocare.obook.service.ReservationService;
import com.ocare.obook.service.WeekDayService;
import com.ocare.oclinic.domain.Complain;
import com.ocare.oclinic.domain.Diagnosis;
import com.ocare.oclinic.domain.PatientExtra;
import com.ocare.oclinic.domain.PatientVisit;
import com.ocare.oclinic.service.ComplainService;
import com.ocare.oclinic.service.DiagnosisService;
import com.ocare.oclinic.service.PatientVisitService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author khaledeng
 */
@Controller("monitorController")
@RequestMapping("/monitor/")
public class MonitorController {

    // Define the Default Path 
    private final String PACKAGE_ROOT = "OClinic/visit/"; 
    
    @Autowired
    private PatientVisitService patientVisitService;
    
    @Autowired
    private ReservationService reservationService;
    
    @Autowired
    private ComplainService complainService;
    
    @Autowired
    private DiagnosisService diagnosisService;
    
    @Autowired
    private PatientService patientService;

    @Autowired
    private WeekDayService weekDayService;
    
  
    
    @RequestMapping("/main")
    public String mainMonitoir(Model model) {
        // 
        Date currentDate = new Date();
        String dayShortName = ODate.getWeekDay(currentDate);
        WeekDay weekDay = weekDayService.getWeekDay(dayShortName);
        /// Model Data to View
        model.addAttribute("currentDate", ODate.getStringDateForCalendar(currentDate));
        model.addAttribute("weekDay", weekDay);
        // Return Reservation List Page 
        return PACKAGE_ROOT+"visitList";
    }//end
    
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/patient/{id}")
    public String patientProfile(@PathVariable("id") Integer patientId, Model model) {
        // Define The Operation
          // Get Patient Information
        Patient patient = patientService.getPatientById(patientId);
        
        for(PatientExtra extra:patient.getPatientExtras()){
            System.out.println(">> "+extra.getExtraData().getName()+" - "+extra.getValue());
        }
        // Get Patient Last Visit
        PatientVisit lastVisit=patientVisitService.getLastVisitForPatient(patientId);
        /// Getting List of Visitis
        List<PatientVisit> allVisits = patientVisitService.getAllPatientVisits();
        for(PatientVisit visit:allVisits){
            System.out.println(">>> "+visit.toString());
        }
        /// Set Model View Data    
        model.addAttribute("allVisits",allVisits);
        model.addAttribute("lastVisit", lastVisit);
        model.addAttribute("patient", patient);
        model.addAttribute("visitId", 0 );
        // return View 
        return PACKAGE_ROOT+"patientProfile2";
    }//end
    
    @RequestMapping(value = "/visitPage/{visitId}", method = RequestMethod.GET, produces = "application/json")
    public String slicingTimeForDate(@PathVariable("visitId") String visitId, Model model) {
    
        model.addAttribute("test", visitId);
        //////////////////////////////////////////////////////////////
        // returning Wanted Page
        return PACKAGE_ROOT + "visitPage";
    }
    //////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/visitBooklet", method = RequestMethod.GET, produces = "application/json")
    public String visitListBooklet( Model model) {
        System.out.println(">>>>>>>>>>>>>>>> Booklet");
        // returning Wanted Page
        return PACKAGE_ROOT + "visitListBooklet";
    }      
    
    @RequestMapping(value = "/test")
    public String testMe(Model model) {
        
        List<Complain> complains= complainService.getAllComplains();
        List<Diagnosis> diagnosises=diagnosisService.getAllDiagnosises();
        //// Model Attributes 
        model.addAttribute("complains", complains);
        model.addAttribute("diagnosises", diagnosises);
        
        return "monitor/process/patientComplains";
    }//end
/////////////////////////////////////////////////////////////////////////////////////
/*
      Examinination Process
    */    
/////////////////////////////////////////////////////////////////////////////////////
    
    @RequestMapping(value = "/exaine")
    public String complainDetection(Model model) {
        
        List<Complain> complains= complainService.getAllComplains();
        List<Diagnosis> diagnosises=diagnosisService.getAllDiagnosises();
        //// Model Attributes 
        model.addAttribute("complains", complains);
        model.addAttribute("diagnosises", diagnosises);
        
        return "monitor/process/patientComplains";
    }//end
    
}