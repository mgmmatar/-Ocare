/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.oclinic.controller;

import com.google.gson.Gson;
import com.omedico.oclinic.domain.Complain;
import com.omedico.oclinic.domain.Diagnosis;
import com.omedico.oclinic.domain.Measurement;
import com.omedico.oclinic.domain.Medication;
import com.omedico.oclinic.domain.PatientComplain;
import com.omedico.oclinic.domain.PatientDiagnosis;
import com.omedico.oclinic.domain.PatientMedication;
import com.omedico.oclinic.domain.PatientPrescription;
import com.omedico.oclinic.domain.PatientVisit;
import com.omedico.oclinic.domain.Prescription;
import com.omedico.oclinic.service.ComplainService;
import com.omedico.oclinic.service.DiagnosisService;
import com.omedico.oclinic.service.MeasurementService;
import com.omedico.oclinic.service.MedicationService;
import com.omedico.oclinic.service.PatientComplainService;
import com.omedico.oclinic.service.PatientDiagnosisService;
import com.omedico.oclinic.service.PatientMedicationService;
import com.omedico.oclinic.service.PatientPrescriptionService;
import com.omedico.oclinic.service.PatientVisitService;
import com.omedico.oclinic.service.PrescriptionService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author khaledeng
 */
@Controller("examinationController2")
@RequestMapping("/monitor/examination")
public class ExaminationController {
    
    private final String PACKAGE_ROOT = "monitor/examination/";
    
    @Autowired
    private ComplainService complainService;
    
    @Autowired
    private PatientComplainService patientComplainService;
    
    @Autowired
    private PatientDiagnosisService patientDiagnosisService;
    
    @Autowired
    private PatientPrescriptionService patientPrescriptionService;
    
    @Autowired
    private PatientMedicationService patientMedicationService;
    
    @Autowired
    private DiagnosisService diagnosisService;
        
    @Autowired
    private PrescriptionService prescriptionService;
    
    @Autowired
    private MedicationService medicationService;
    
    @Autowired
    private MeasurementService measurementService;
    
    @Autowired
    private PatientVisitService patientVisitService;
    
    /////////////////////////////////////////////////////////////////////////////////////
    /*
              Examinination Process
    */    
    /////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/complain/{id}")
    public String complainDetection(@PathVariable("id") Integer visitId,Model model) {
        // Getting All Signed And UnSigned Data 
        List<Complain> signedComplains= complainService.getSignedComplains();
        List<Complain> unSignedComplains= complainService.getUnSignedComplains();
        PatientVisit patientVisit=patientVisitService.get(visitId);
        System.out.println(">>>> "+patientVisit.toString());
        //// Model Attributes 
        model.addAttribute("signedComplains", signedComplains);
        model.addAttribute("unSignedComplains", unSignedComplains);
        model.addAttribute("visitId",visitId);
        // return View
        return PACKAGE_ROOT+"complains";
    }//end complainDetection
    
    /////////////////////////////////////////////////////////////////////////
    
    @RequestMapping(value = "/complain/save", method = RequestMethod.GET)
    public void complainSave(@RequestParam(value="complains[]") Integer[] complainsArray,
            @RequestParam(value="visitId") Integer visitId,Model model
            ,HttpServletResponse response) throws IOException {
        // Initialize A new Complain List 
        List<PatientComplain> patientComplains=new ArrayList<PatientComplain>();
        // Getting RervationObject
        PatientVisit visit=patientVisitService.get(visitId);
        // Adding Complain to List
        for (Integer complainId : complainsArray) {
           // Define Patient Complain 
           PatientComplain patientComplain= new PatientComplain();
           // Getting Complain 
           Complain complain=complainService.get(complainId);
           patientComplain.setComplain(complain);
           patientComplain.setPatientVisit(visit);
           patientComplainService.save(patientComplain);
        } //end for Loop 
        // return View
        String done="true";
        ////////////////////////////////////////////////////////////
        response.getWriter().write(done);
    }//end complainDetection
    ///////////////////////////////////////////////////////////////////////////////////
    
    @RequestMapping(value = "/fastComplain", method = RequestMethod.GET)
    public @ResponseBody String fastSearchPatient(@RequestParam("pattern") String namePattern, Model model, HttpServletRequest request, HttpServletResponse response){
        /// Initialize the ModelView to be Returned 
        ModelAndView modelAndView = null;
        String jsonString=null;
        /// Check if Text Entered or Not
        if(!namePattern.isEmpty()){
            // Getting Suggested List
            List<Complain> complains=complainService.getComplainWithPattern(namePattern);
            Gson gson = new Gson();
            jsonString = gson.toJson(complains);
        }//end if 
      return jsonString;
    }//end fastSearchPatient 
    
    ////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////

    @RequestMapping(value = "/diagnosis/{id}")
    public String diagnosisDetection(@PathVariable("id") Integer visitId,Model model) {
        // Getting List of All diagnosis in System  
        List<Diagnosis> diagnosises=diagnosisService.getAllDiagnosises();
        List<Measurement> measurements=measurementService.getAllMeasurements();
        //// Model Attributes 
        model.addAttribute("diagnosises", diagnosises);
        model.addAttribute("measurements", measurements);
        model.addAttribute("visitId",visitId);
        // return View
        return PACKAGE_ROOT+"diagnosises";
    }//end complainDetection
    
    
    @RequestMapping(value = "/fastDiagnosis", method = RequestMethod.GET)
    public @ResponseBody String fastDiagnosisSearch(@RequestParam("pattern") String namePattern, Model model, HttpServletRequest request, HttpServletResponse response){
        /// Initialize the ModelView to be Returned 
        ModelAndView modelAndView = null;
        String jsonString=null;
        /// Check if Text Entered or Not
        if(!namePattern.isEmpty()){
            // Getting Suggested List
            List<Diagnosis> diagnosises=diagnosisService.getDiagnosisWithPattern(namePattern);
            Gson gson = new Gson();
            jsonString = gson.toJson(diagnosises);
        }//end if 
      return jsonString;
    }//end fastSearchPatient 
    
    @RequestMapping(value = "/diagnosis/save", method = RequestMethod.GET)
    public void diagnosisSave(@RequestParam(value="diagnosises[]") Integer[] diagnosisArray,
            @RequestParam(value="visitId") Integer visitId,Model model
            ,HttpServletResponse response) throws IOException {
        // Getting RervationObject
            System.out.println(">>>> VisitID "+visitId);
        PatientVisit visit=patientVisitService.get(visitId);
        // Adding Complain to List
        for (Integer diagnosisId : diagnosisArray) {
           // Define Patient Complain 
           PatientDiagnosis patientDiagnosis= new PatientDiagnosis();
           // Getting Complain 
           Diagnosis diagnosis=diagnosisService.get(diagnosisId);
           patientDiagnosis.setDiagnosis(diagnosis);
           patientDiagnosis.setPatientVisit(visit);
           patientDiagnosisService.save(patientDiagnosis);
        } //end for Loop 
        // return View
        String done="true";
        ////////////////////////////////////////////////////////////
        response.getWriter().write(done);
    }//end complainDetection
    
    ////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/prescription/{id}")
    public String prescriptionDetection(@PathVariable("id") Integer visitId,Model model) {
        // Getting List of All diagnosis in System  
        List<Prescription> signedPrescriptions=prescriptionService.getSignedPrescriptions();
        List<Prescription> unSignedPrescriptions=prescriptionService.getUnSignedPrescriptions();
        //// Model Attributes 
        model.addAttribute("signedPrescriptions", signedPrescriptions);
        model.addAttribute("unSignedPrescriptions", unSignedPrescriptions);
        model.addAttribute("visitId",visitId);
        // return View
        return PACKAGE_ROOT+"prescriptions";
    }//end complainDetection
    
    
    @RequestMapping(value = "/fastPrescription", method = RequestMethod.GET)
    public @ResponseBody String fastPrescriptionSearch(@RequestParam("pattern") String namePattern, Model model, HttpServletRequest request, HttpServletResponse response){
        /// Initialize the ModelView to be Returned 
        ModelAndView modelAndView = null;
        String jsonString=null;
        /// Check if Text Entered or Not
        if(!namePattern.isEmpty()){
            // Getting Suggested List
            List<Prescription> prescriptions=prescriptionService.getPrescriptionWithPattern(namePattern);
            Gson gson = new Gson();
            jsonString = gson.toJson(prescriptions);
        }//end if 
      return jsonString;
    }//end fastSearchPatient 
    
    @RequestMapping(value = "/prescription/save", method = RequestMethod.GET)
    public void prescriptionSave(@RequestParam(value="prescriptions[]") Integer[] prescriptionArray,
            @RequestParam(value="visitId") Integer visitId,Model model
            ,HttpServletResponse response) throws IOException {
        // Getting RervationObject
            System.out.println(">>>> VisitID "+visitId);
        PatientVisit visit=patientVisitService.get(visitId);
        // Adding Complain to List
        for (Integer prescriptionId : prescriptionArray) {
           // Define Patient Complain 
            PatientPrescription patientPrescription= new PatientPrescription();
           // Getting Prescription
           Prescription prescription=prescriptionService.get(prescriptionId);
           patientPrescription.setPrescription(prescription);
           patientPrescription.setPatientVisit(visit);
           patientPrescriptionService.save(patientPrescription);
        } //end for Loop 
        // return View
        String done="true";
        ////////////////////////////////////////////////////////////
        response.getWriter().write(done);
    }//end complainDetection
    
    ////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/medication/{id}")
    public String medicationDetection(@PathVariable("id") Integer visitId,Model model) {
        // Getting List of All diagnosis in System  
        List<Medication> signedMedications=medicationService.getSignedMedications();
        List<Medication> unSignedMedications=medicationService.getUnSignedMedications();
        //// Model Attributes 
        model.addAttribute("signedMedications", signedMedications);
        model.addAttribute("unSignedMedications", unSignedMedications);
        model.addAttribute("visitId",visitId);
        // return View
        return PACKAGE_ROOT+"prescriptions";
    }//end complainDetection
    
    
    @RequestMapping(value = "/fastMedication", method = RequestMethod.GET)
    public @ResponseBody String fastMedicationSearch(@RequestParam("pattern") String namePattern, Model model, HttpServletRequest request, HttpServletResponse response){
        /// Initialize the ModelView to be Returned 
        ModelAndView modelAndView = null;
        String jsonString=null;
        /// Check if Text Entered or Not
        if(!namePattern.isEmpty()){
            // Getting Suggested List
            List<Medication> medications=medicationService.getMedicationWithPattern(namePattern);
            Gson gson = new Gson();
            jsonString = gson.toJson(medications);
        }//end if 
      return jsonString;
    }//end fastSearchPatient 
    
    @RequestMapping(value = "/medication/save", method = RequestMethod.GET)
    public void medicationSave(@RequestParam(value="medications[]") Integer[] medicationArray,
            @RequestParam(value="visitId") Integer visitId,Model model
            ,HttpServletResponse response) throws IOException {
        // Getting RervationObject
        System.out.println(">>>> VisitID "+visitId);
        PatientVisit visit=patientVisitService.get(visitId);
        // Adding Complain to List
        for (Integer medicationId : medicationArray) {
           // Define Patient Complain 
            PatientMedication patientMedication= new PatientMedication();
           // Getting Prescription
           Medication medication=medicationService.get(medicationId);
           patientMedication.setMedication(medication);
           patientMedication.setPatientVisit(visit);
           patientMedicationService.save(patientMedication);
        } //end for Loop 
        // return View
        String done="true";
        ////////////////////////////////////////////////////////////
        response.getWriter().write(done);
    }//end complainDetection
        
}//end Controller 
