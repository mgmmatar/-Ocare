/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.controller;

import com.ocare.UMS.domain.MyUser;
import com.ocare.obook.domain.ExamineType;
import com.ocare.obook.domain.InsuranceCompany;
import com.ocare.obook.domain.InsuranceProfile;
import com.ocare.obook.domain.Patient;
import com.ocare.obook.domain.ReservationWay;
import com.ocare.obook.domain.WeekDay;
import com.ocare.obook.holder.WorkingDayHolder;
import com.ocare.obook.service.ExamineTypeService;
import com.ocare.obook.service.InsuranceCompanyService;
import com.ocare.obook.service.InsuranceProfileService;
import com.ocare.obook.service.ReservationWayService;
import com.ocare.obook.service.WeekDayService;
import com.ocare.obook.service.WorkingTimeService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author khaledeng
 */
@Controller("settingsController")
@RequestMapping("/settings")
@Secured({"ROLE_SUPER_ADMIN"})
public class SettingsController {

    private final String PACKAGE_ROOT = "/OBook/settings/";

    // AutoWiring 
    
    @Autowired
    private ExamineTypeService examineTypeService;

    @Autowired
    private WeekDayService weekDayService;

    @Autowired
    private WorkingTimeService workingTimeService;

    @Autowired
    private ReservationWayService reservationWayService;

    @Autowired
    private InsuranceCompanyService insuranceCompanyService;

    @Autowired
    private InsuranceProfileService insuranceProfileService;
    
    @RequestMapping("/home")
    public String settingsHome(Model model) {
        /// return Setting Home Page
        return "settings";
    }//end
   ////////////////////////////////////////////////////////////////////////////////////
   /*
     * Settings -- Examine Type Module
     */
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/examineType/list")
    public String examineTypeList(Model model) {
        // Getting List
        return PACKAGE_ROOT + "examineTypeList";
    }//end
    
    @RequestMapping("/examineType/loadExamineTable")
    public String loadExamineTypeTable(Model model) {
        // Getting all ExamineTypes
        List<ExamineType> examineTypes = examineTypeService.getAllExamineTypes();
        /// Append Models
        model.addAttribute("examineTypes", examineTypes);
        // Getting List
        return PACKAGE_ROOT + "examineTypeTable";
    }//end
    
    @RequestMapping(value = "/examineType/save", method = RequestMethod.POST)
    public String saveExamineType(@ModelAttribute ExamineType examineType, BindingResult result, Model model, HttpServletRequest request) {
        // Saving the ExamineType Data 
        examineTypeService.save(examineType);
        // Getting all ExamineTypes
        List<ExamineType> examineTypes = examineTypeService.getAllExamineTypes();
        /// Append Models
        model.addAttribute("examineTypes", examineTypes);
        // return Back to List 
        return PACKAGE_ROOT + "examineTypeTable";
    }//end registerPatient

    @RequestMapping(value = "/examineType/delete/{examineTypeId}", method = RequestMethod.GET)
    public void deleteExamineType(@PathVariable("examineTypeId") Integer examineTypeId,Model model, HttpServletRequest request,HttpServletResponse response) throws IOException {
        // Getting Examine Type
        ExamineType examineType = examineTypeService.get(examineTypeId);
        // Deleting the ExamineType
        examineTypeService.delete(examineType);
        // Getting all ExamineTypes
        /// Getting List of Patients 
        String done="true";
        // open List        
        response.getWriter().write(done);
    }//end registerPatient
    
    @RequestMapping(value = "/examineType/defaultOne", method = RequestMethod.POST)
    public String assignDefaultExamineType(@ModelAttribute("examineTypeID") Integer examineTypeID, BindingResult result, Model model, HttpServletRequest request) {
        // Assing new ExamineType
        examineTypeService.assignDefaultExamineType(examineTypeID);
        // Getting all ExamineTypes
        List<ExamineType> examineTypes = examineTypeService.getAllExamineTypes();
        /// Append Models
        model.addAttribute("examineTypes", examineTypes);
        // return Back to List 
        return PACKAGE_ROOT + "examineTypeTable";
    }//end registerPatient

        @RequestMapping(value = "/examineTypeEditable/{examineTypeID},{changedColumn},{changedValue}", method = RequestMethod.GET)
    public void examineTypeEditable(@PathVariable("examineTypeID") Integer examineTypeID
                                    ,@PathVariable("changedColumn") Integer changedColumn
                                    ,@PathVariable("changedValue") String changedValue
                                    , Model model,HttpServletResponse response,HttpServletRequest request) throws IOException {
        /// Getting Reservation 
        request.setCharacterEncoding("utf-8");

        ExamineType examineType = examineTypeService.get(examineTypeID);
        /// chossing the result
        switch(changedColumn){
            case 2:
                examineType.setNameAr(changedValue);
                examineTypeService.update(examineType);
                break;
            case 3:
                examineType.setNameEn(changedValue);
                examineTypeService.update(examineType);
                break;
            case 4:
                examineType.setDescription(changedValue);
                examineTypeService.update(examineType);
                break;
            case 5:
                examineType.setCost(Float.parseFloat(changedValue));
                examineTypeService.update(examineType);
                break;
            case 6:
                examineType.setEstimatedPeriod(Integer.parseInt(changedValue));
                examineTypeService.update(examineType);
                break;    
        }//end 
        ////////////////////////////////////////////////////////////
        String done="true";
        if(!true){
             done="false";
        }//end if 
        ////////////////////////////////////////////////////////////
        response.getWriter().write(done);
    }//cancelReservation process 
    
     @RequestMapping(value = "/examineType/search", method = {RequestMethod.GET, RequestMethod.POST})
    public String searchForExamineType(@RequestParam(value="query", required=false) String query, Model model, HttpServletRequest request, HttpServletResponse response){
        /// Getting List of Patients 
        List<ExamineType> examineTypes;
        /// Check if There is Parameter for Filter        
        if(!query.isEmpty()){
            examineTypes =examineTypeService.getExamineTypesWithPattern(query);
        }else{
            examineTypes =examineTypeService.getAllExamineTypes();
        }//end if-Else Block
        // Getting all ExamineTypes
        /// Append Models
        model.addAttribute("examineTypes", examineTypes);
        // Getting List
        return PACKAGE_ROOT + "examineTypeTable";
    }//end fastSearchPatient
    
   ////////////////////////////////////////////////////////////////////////////////////
   /*
     * Settings -- Reservation Way Module
     */
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/reservationWay/list")
    public String reservationWayList(Model model) {
        // Getting Reload the ReservationWay List
        return PACKAGE_ROOT + "reservationWaysList";
    }//end
    
    @RequestMapping("/reservationWay/loadReservationWayTable")
    public String loadReservationWayTable(Model model) {
        // Getting all ExamineTypes
        List<ReservationWay> reservationWays = reservationWayService.getAllReservationWays();
        /// Append Models
        model.addAttribute("reservationWays", reservationWays);
        // Getting List
        return PACKAGE_ROOT + "reservationWaysTable";
    }//end
    
    @RequestMapping(value = "/reservationWay/save", method = RequestMethod.POST)
    public String saveReservationWay(@ModelAttribute ReservationWay reservationWay, BindingResult result, Model model, HttpServletRequest request) {
        // Saving the ExamineType Data 
        reservationWayService.save(reservationWay);
        // Getting all ExamineTypes
        List<ReservationWay> reservationWays = reservationWayService.getAllReservationWays();
        /// Append Models
        model.addAttribute("reservationWays", reservationWays);
        // Getting List
        return PACKAGE_ROOT + "reservationWaysTable";
    }//end registerPatient

    
    @RequestMapping(value = "/reservationWay/defaultOne", method = RequestMethod.POST)
    public String assignDefaultReservationWay(@ModelAttribute("reservationWayID") Integer reservationWayID, BindingResult result, Model model, HttpServletRequest request) {
        // Assing new ExamineType
        reservationWayService.assignDefaultReservationWay(reservationWayID);
        // Getting all reservationWays
        List<ReservationWay> reservationWays = reservationWayService.getAllReservationWays();
        /// Append Models
        model.addAttribute("reservationWays", reservationWays);
        // Getting List
        return PACKAGE_ROOT + "reservationWaysTable";
    }//end registerPatient
   
    @RequestMapping(value = "/reservationWayEditable/{reservationWayID},{changedColumn},{changedValue}", method = RequestMethod.GET)
    public void reservationWayEditable(@PathVariable("reservationWayID") Integer reservationWayID
                                    ,@PathVariable("changedColumn") Integer changedColumn
                                    ,@PathVariable("changedValue") String changedValue
                                    , Model model,HttpServletResponse response) throws IOException {
        /// Getting Reservation 
        ReservationWay reservationWay = reservationWayService.get(reservationWayID);
        if(reservationWay!=null){
        /// chossing the result
        switch(changedColumn){
            case 2:
                reservationWay.setNameAr(changedValue);
                reservationWayService.update(reservationWay);
                break;
            case 3:
                reservationWay.setNameEn(changedValue);
                reservationWayService.update(reservationWay);
                break;
            case 4:
                reservationWay.setDescription(changedValue);
                reservationWayService.update(reservationWay);
                break;
            }//end 
        }//end if Condition
        ////////////////////////////////////////////////////////////
        String done="true";
        if(!true){
             done="false";
        }//end if 
        ////////////////////////////////////////////////////////////
        response.getWriter().write(done);
    }//cancelReservation process 

    @RequestMapping(value = "/reservationWay/search", method = {RequestMethod.GET, RequestMethod.POST})
    public String searchForReservationWay(@RequestParam(value="query", required=false) String query, Model model, HttpServletRequest request, HttpServletResponse response){
        /// Getting List of Patients 
        List<ReservationWay> reservationWays;
        /// Check if There is Parameter for Filter        
        if(!query.isEmpty()){
            reservationWays = reservationWayService.getReservationWaysWithPattern(query);
        }else{
            reservationWays = reservationWayService.getAllReservationWays();
        }//end if-Else Block
        /// Append Models
        model.addAttribute("reservationWays", reservationWays);
        // Getting List
        return PACKAGE_ROOT + "reservationWaysTable";
    }//end fastSearchPatient
    
    
    @RequestMapping(value = "/reservationWay/delete/{reservationWayId}", method = RequestMethod.GET)
    public void deleteReservationWay(@PathVariable("reservationWayId") Integer reservationWayId,Model model, HttpServletRequest request,HttpServletResponse response) throws IOException {
        // Getting Examine Type
        ReservationWay reservationWay = reservationWayService.get(reservationWayId);
        // Deleting the ExamineType
        reservationWayService.delete(reservationWay);
        // Getting all ExamineTypes
        /// Getting List of Patients 
        String done="true";
        // open List        
        response.getWriter().write(done);
    }//end registerPatient
    ////////////////////////////////////////////////////////////////////////////////////
   /*
     * Settings -- Insurrance Company Module
     */
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/insurrance/list")
    public String insurranceCompanyList(Model model) {
        // Getting Reload the ReservationWay List
        return PACKAGE_ROOT + "insurranceCompanyList";
    }//end
    
    @RequestMapping("/insurrance/loadInsurranceCompanyTable")
    public String loadInsurranceCompany(Model model) {
        // Getting all Insurrance Company List 
        List<InsuranceCompany> insuranceCompanys = insuranceCompanyService.getAllInsuranceCompanys();
        /// Append Models
        model.addAttribute("insuranceCompanys", insuranceCompanys);
        // Getting List
        return PACKAGE_ROOT + "insurranceCompanyTable";
    }//end
    
    @RequestMapping(value = "/insurrance/save", method = RequestMethod.POST)
    public String saveInsurranceCompany(@ModelAttribute InsuranceCompany insuranceCompany, BindingResult result, Model model, HttpServletRequest request) {
        // Saving the Insurrance Company Data 
        insuranceCompanyService.save(insuranceCompany);
        // Getting all Insurrance Company List 
        List<InsuranceCompany> insuranceCompanys = insuranceCompanyService.getAllInsuranceCompanys();
        /// Append Models
        model.addAttribute("insuranceCompanys", insuranceCompanys);
        // Getting List
        return PACKAGE_ROOT + "insurranceCompanyTable";
    }//end registerPatient

    @RequestMapping(value = "/insurrance/delete", method = RequestMethod.POST)
    public String deleteInsurranceCompany(@ModelAttribute("insurranceCompanyID") Integer insurranceCompanyID, BindingResult result, Model model, HttpServletRequest request) {
        // Getting Insurrance Company
        InsuranceCompany insuranceCompany = insuranceCompanyService.get(insurranceCompanyID);
        // Deleting Insurrance Company
        insuranceCompany.setIsDeleted(true);
        insuranceCompanyService.update(insuranceCompany);
        // Getting all Insurrance Company List 
        List<InsuranceCompany> insuranceCompanys = insuranceCompanyService.getAllInsuranceCompanys();
        /// Append Models
        model.addAttribute("insuranceCompanys", insuranceCompanys);
        // Getting List
        return PACKAGE_ROOT + "insurranceCompanyTable";
    }//end registerPatient
    
    @RequestMapping(value = "/insurrance/delete/{companyId}", method = RequestMethod.GET)
    public void deleteInsurranceCompany(@PathVariable("companyId") Integer companyId,Model model, HttpServletRequest request,HttpServletResponse response) throws IOException {
        // Getting Examine Type
        InsuranceCompany insuranceCompany = insuranceCompanyService.get(companyId);
        // Deleting the ExamineType
        insuranceCompanyService.delete(insuranceCompany);
        // Getting all ExamineTypes
        /// Getting List of Patients 
        String done="true";
        // open List        
        response.getWriter().write(done);
    }//end registerPatient
    
    @RequestMapping(value = "/insurranceCompanyEditable/{insurranceCompanyID},{changedColumn},{changedValue}", method = RequestMethod.GET)
    public void insurranceCompanyEditable(@PathVariable("insurranceCompanyID") Integer insurranceCompanyID
                                    ,@PathVariable("changedColumn") Integer changedColumn
                                    ,@PathVariable("changedValue") String changedValue
                                    , Model model,HttpServletResponse response) throws IOException {
        // Getting Insurrance Company
        InsuranceCompany insuranceCompany = insuranceCompanyService.get(insurranceCompanyID);
        if(insuranceCompany!=null){
        /// chossing the result
        switch(changedColumn){
            case 2:
                insuranceCompany.setNameAr(changedValue);
                insuranceCompanyService.update(insuranceCompany);
                break;
            case 3:
                insuranceCompany.setNameEn(changedValue);
                insuranceCompanyService.update(insuranceCompany);
                break;
            case 4:
                insuranceCompany.setDescription(changedValue);
                insuranceCompanyService.update(insuranceCompany);
                break;
            }//end 
        }//end if Condition
        ////////////////////////////////////////////////////////////
        String done="true";
        if(!true){
             done="false";
        }//end if 
        ////////////////////////////////////////////////////////////
        response.getWriter().write(done);
    }//cancelReservation process 
    
    @RequestMapping(value = "/insurrance/profile/{insurranceCompanyId}", method = RequestMethod.GET, produces = "application/json")
    public String insurranceCompanyProfiles(@PathVariable("insurranceCompanyId") Integer insurranceCompanyId, Model model) {
        
        // Getting the targetted Company
        InsuranceCompany company=insuranceCompanyService.get(insurranceCompanyId);
        List<ExamineType> examineTypes=examineTypeService.getAllExamineTypes();
        List<Float> percentages=new ArrayList<Float>();
        for(float i=0f;i<=100;i+=5){
            percentages.add(i);
        }//end for Loop
        // Adding data to Model
        model.addAttribute("company", company);
        model.addAttribute("examineTypes", examineTypes);
        model.addAttribute("percentages", percentages);
        //////////////////////////////////////////////////////////////
        // returning Wanted Page
        return PACKAGE_ROOT + "insurranceProfiles";
    }
    
    @RequestMapping(value = "/insurrance/profile/{profileId}/edit/{attribute},{value}", method = RequestMethod.GET, produces = "application/json")
    public void editInsurranceProfile(@PathVariable("profileId") Integer profileId,
            @PathVariable("attribute") String attribute,
            @PathVariable("value") String value,
            HttpServletResponse response,
            Model model) throws IOException {
        // Getting Profile 
        InsuranceProfile profile=insuranceProfileService.get(profileId);
        if(attribute.equals("examine")){
             ExamineType examineType=examineTypeService.get(Integer.parseInt(value));
             profile.setExamineType(examineType);
        }//end ifs
        else if(attribute.equals("percentage")){
             profile.setPercentage(Float.parseFloat(value));
        }//end else if
        
        // Saving Data 
        insuranceProfileService.update(profile);
        //////////////////////////////////////////////////////////////
        // returning Wanted Page
        String done="true";
        ////////////////////////
        // returning Wanted Page
        response.getWriter().write(done);
    }
    
    @RequestMapping(value = "/insurrance/profile/create", method = RequestMethod.POST)
    public void createProfileForCompany(@ModelAttribute("insurranceId") Integer insurranceId,
            @ModelAttribute("examineTypeId") Integer examineTypeId,
            @ModelAttribute("percentage") Float percentage,
            Model model,HttpServletResponse response) throws IOException {
        // Done
        String done="false";
        // Getting the Submitted ExamineType
        ExamineType examineType=examineTypeService.get(examineTypeId);
        InsuranceCompany company=insuranceCompanyService.get(insurranceId);
        /// Setting the Profile
        InsuranceProfile profile= new InsuranceProfile();
        profile.setPercentage(percentage);
        profile.setExamineType(examineType);
        profile.setInsurranceCompany(company);
        // Saving Profile 
        insuranceProfileService.save(profile);
        done="true";
        ////////////////////////
        // returning Wanted Page
        response.getWriter().write(done);
    }
    
    
    @RequestMapping(value = "/insurrance/profile/delete", method = RequestMethod.POST)
    public void createProfileForCompany(@ModelAttribute("profileId") Integer profileId,
            Model model,HttpServletResponse response) throws IOException {
        // Done
        String done="false";
        // Getting the Submitted ExamineType
        InsuranceProfile profile=insuranceProfileService.get(profileId);
        // Deleting Profile 
        insuranceProfileService.delete(profile);
        done="true";
        ////////////////////////
        // returning Wanted Page
        response.getWriter().write(done);
    }
    
    @RequestMapping(value = "/insurrance/search", method = {RequestMethod.GET, RequestMethod.POST})
    public String searchForInsurrance(@RequestParam(value="query", required=false) String query, Model model, HttpServletRequest request, HttpServletResponse response){
        /// Getting List of Patients 
        List<InsuranceCompany> insuranceCompanys;
        /// Check if There is Parameter for Filter        
        if(!query.isEmpty()){
            insuranceCompanys = insuranceCompanyService.getInsurranceCompaniesWithPattern(query);
        }else{
            insuranceCompanys = insuranceCompanyService.getAllInsuranceCompanys();
        }//end if-Else Block
        /// Append Models
        model.addAttribute("insuranceCompanys", insuranceCompanys);
        // Getting List
        return PACKAGE_ROOT + "insurranceCompanyTable";
    }//end fastSearchPatient
    ///////////////////////////////////////////////////
   /*
     * Settings -- Working Days Module
     */
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/workingDays")
    public String doctorWorkingDays(Model model) {
        // Getting List of All WeekDays
        List<WeekDay> weekDays = weekDayService.getAllWeekDays();
        model.addAttribute("weekDays", weekDays);
        // return WorkingDays
        return PACKAGE_ROOT+"workingDays";
    }//end
    
    @RequestMapping(value = "/workingDays/process", method = RequestMethod.POST)
    public String saveWorkingDays(@ModelAttribute("workingDayHolder") WorkingDayHolder workingDayHolder, BindingResult result, Model model, HttpServletRequest request) {
        // Saving All Times
        weekDayService.addALLTimes(workingDayHolder);
        // return Back to List    
        return "redirect:/" + PACKAGE_ROOT + "workingDays";
    }//end registerPatient

}//end SettingsController class
