package com.ocare.obook.controller;

import com.google.gson.Gson;
import com.ocare.obook.domain.Patient;
import com.ocare.obook.domain.Reservation;
import com.ocare.obook.holder.FastPatient;
import com.ocare.obook.holder.PatientHolder;
import com.ocare.obook.service.InsuranceCompanyService;
import com.ocare.obook.service.PatientService;
import com.ocare.obook.service.ReservationService;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("patientController")
@RequestMapping("/patient")
public class PatientController {
    // Patient Module Path
    private final String MODULE_PATH="/OBook/patient/";
  
    /////////////////////////////////////////////////////
    /*    AutoWiring Part */
    /////////////////////////////////////////////////////
    @Autowired
    private PatientService patientService;

    @Autowired
    private ReservationService reservationService;
    
    @Autowired
    private InsuranceCompanyService insuranceCompanyService;
    
    /******************************************************
     *   Patient List Process
    ******************************************************/    
    @RequestMapping(value = "/list")
    public String patientList(Model model){
        // return View         
        return MODULE_PATH+"patientList";
    }//end registerPatient
    
    
    /////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/loadPatientTable", method = {RequestMethod.GET, RequestMethod.POST})
    public String loadPatientListTable(@RequestParam(value="query", required=false) String query, Model model, HttpServletRequest request, HttpServletResponse response){
        /// Getting List of Patients 
        List<Patient> patients;
        /// Check if There is Parameter for Filter
        if(query!=null){
            patients=patientService.searchForPatient(query);
        }else{
            patients=patientService.getAllPatients();
        }//end if-Else Block
        // Adding Patient List to Model
        model.addAttribute("patients", patients);
        // return Table of Data 
      return MODULE_PATH+"patientTable";
    }//end fastSearchPatient 
    
    @RequestMapping(value = "/register")
    public String registerPatient(Model model){
        // Adding Data to Model
        model.addAttribute("operation", "Register");
        model.addAttribute("insuranceCompanies",insuranceCompanyService.getAllInsuranceCompanys());
        return MODULE_PATH+"patient";
    }//end registerPatient
    
    @RequestMapping("/edit/{id}")
    public String updatePatientById(@PathVariable("id") Integer patientId, Model model, HttpServletRequest request) {
        // Get patient 
        Patient patient = patientService.getPatientById(patientId);
        model.addAttribute("insuranceCompanies",insuranceCompanyService.getAllInsuranceCompanys());
        model.addAttribute("patient", patient);
        model.addAttribute("operation", "Update");
        // open List        
        return MODULE_PATH+"patient";
    }//end registerPatient
    
    @RequestMapping(value = "/process", method = RequestMethod.POST)
    public String registerationProcess(@ModelAttribute("patient")PatientHolder patientHolder,BindingResult result,Model model,HttpServletRequest request){
        // Check the Patient Mode
        if(patientHolder.getId()==null){
            patientService.register(patientHolder);
        }else{
             patientService.update(patientHolder);   
        }//end else-If 
         // redirect to Patient List       
        return "redirect:/patient/list";
    }//end registerPatient

    /****************************************************************** 
    *    View Process
    ******************************************************************/
    @RequestMapping("/view/{id}")
    public String viewPatientById(@PathVariable("id") Integer patientId, Model model, HttpServletRequest request) {
        // Get Patient Information
        Patient patient = patientService.getPatientById(patientId);
        // Get Patient Reservation List 
        List<Reservation> reservations=reservationService.getReservationsForPatient(patientId);
        model.addAttribute("reservations",reservations);
        model.addAttribute("patient", patient);
        // return View        
        return MODULE_PATH+"patientProfile";
    }//end registerPatient
    /****************************************************************** 
    *   Delete Process
    ******************************************************************/
    @RequestMapping("/delete/{id}")
    public void deletePatientByCode(@PathVariable("id") Integer patientId, Model model, HttpServletRequest request,HttpServletResponse response) throws IOException {
        /// Getting List of Patients 
        String done="true";
        ////////////////////////////////////////////////////////////
        Patient patient = patientService.getPatientById(patientId);
        System.out.println(">>>>>>>>>>>>>>>>>> "+patientId);
         // delete Patient 
        patientService.delete(patient);
        // open List        
        response.getWriter().write(done);
    }//end registerPatient
    /******************************************************
     * search Patient  
     ****************************************************/
    @RequestMapping("/search")
    public String searchPatient(Model model){
        model.addAttribute("result", "search");
       return MODULE_PATH+"patientSearch";
    }//end 
   
    @RequestMapping(value = "/fastSearch", method = RequestMethod.GET)
    public @ResponseBody String fastSearchPatient(@RequestParam("q") String query, Model model, HttpServletRequest request, HttpServletResponse response){
        /// Initialize the ModelView to be Returned 
        ModelAndView modelAndView = null;
        String jsonString=null;
        /// Check if Text Entered or Not
        if(!query.isEmpty()){
            // Getting Suggested List
            List<FastPatient> fastPatients=patientService.getFastPatientList(query);
            Gson gson = new Gson();
            jsonString = gson.toJson(fastPatients);
            System.out.println(">> TO SENT : "+jsonString);
        }//end if 
      return jsonString;
    }//end fastSearchPatient 
    
    @RequestMapping(value = "/doSearch", method = RequestMethod.POST)
    public String doSearchPatient(@RequestParam(value="patientName",required = false) String patientName,
             @RequestParam(value="patientCode",required = false) String patientCode,
             @RequestParam(value="patientPhone",required = false) String patientPhone,
             Model model, HttpServletRequest request) {
             // Getting Result List 
             List<Patient> patients = patientService.searchForPatient(patientName, patientCode, patientPhone);
             model.addAttribute("patients", patients);
             model.addAttribute("result", "done");
        // return result 
        return MODULE_PATH+"patientSearch";
    }//end searchPatient
    
}
