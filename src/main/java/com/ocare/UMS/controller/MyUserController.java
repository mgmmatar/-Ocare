/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.UMS.controller;

import com.obird.OUMS.domain.Role;
import com.obird.OUMS.service.RoleService;
import com.obird.utility.OFault;
import com.ocare.UMS.domain.MyUser;
import com.ocare.UMS.holder.UserHolder;
import com.ocare.UMS.service.MyUserService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author khaledeng
 */

@Controller
@RequestMapping("/ums")
public class MyUserController {
    
    private final String MODULE_PATH="/OBird/ums/";
    
    @Autowired
    private MyUserService userService;
    
    @Autowired
    private RoleService roleService;
    
    ///////////////////////////////////////////////////////////////////////////////
    /*****************************************************************************
    *           <   Admin MODULE  >
    *****************************************************************************/
    ///////////////////////////////////////////////////////////////////////////////
    
    @Secured({"ROLE_SUPER_ADMIN"})
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminUsers(Model model) {
        //////////////////////////////////////////////////////////////
        // returning Wanted Page
        return MODULE_PATH + "admin";
    }
    
    @Secured({"ROLE_SUPER_ADMIN"})
    @RequestMapping("/admin/loadAdminTable")
    public String loadAdminTable(Model model) {
        // Getting all System Admins
        List<MyUser> myAdmins =userService.getAllAdmins();
        /// Adding Admins to View 
        model.addAttribute("myAdmins", myAdmins);
        // return AdminTable with Data Model
        return MODULE_PATH + "adminTable";
    }//end loadAdminTable
    
    @Secured({"ROLE_SUPER_ADMIN"})
    @RequestMapping(value = "/admin/data/{adminId}", method = RequestMethod.GET)
    public String gettingAdminProfile(@PathVariable("adminId") Integer adminId, Model model) {
        // Check if the Request for Registeration or Editing Profile 
        if(adminId==0){
            model.addAttribute("mode", "Register");
            model.addAttribute("register", true);
        }else{
             MyUser myUser=userService.getUserById(adminId);
            
             model.addAttribute("register", false);
             model.addAttribute("myUser", myUser);
             model.addAttribute("mode", "Save Changes");
             
        }//end Else If Block 
        // return the User data 
        return MODULE_PATH + "adminData";
    }
    
    @Secured({"ROLE_SUPER_ADMIN"})
    @RequestMapping(value = "/admin/createOrUpdate", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE,method = RequestMethod.POST)
    public @ResponseBody List<OFault> createAdmins(@RequestBody @Valid UserHolder userHolder,BindingResult bindingResult, Model model) {
        // Check if the Request for Registeration or Editing Profile 
        List<OFault> faults=new ArrayList<OFault>();
        if (bindingResult.hasErrors()) {
            // Getting Error List 
            for(FieldError objectError:bindingResult.getFieldErrors()){
                /// Init New Fault
                OFault oFault=new OFault();
                oFault.setPropertyName(objectError.getField());
                oFault.setErrorMessage(objectError.getDefaultMessage());
                // Adding to Error
                faults.add(oFault);
            }//end for Loop
            
            System.out.println(">> ERROR SIZE "+faults.size());
           
        }else{
            // saving Admin Data
            userService.registerOrUpdateUser(userHolder);
        }//end else
        // return result 
        return faults;
    }//end createAdmins
    
    @Secured({"ROLE_SUPER_ADMIN"})
    @RequestMapping(value = "/admin/activeOrDeactive", method = RequestMethod.POST)
    public String activateDeactivateAdmin(@ModelAttribute("adminId") Integer adminId,@ModelAttribute("status") boolean status,Model model) {
        // Update User Status
        userService.activateOrDeactivateUser(adminId, status);
        // Getting all Admins
        List<MyUser> myAdmins =userService.getAllAdmins();
        /// Adding Admins to View 
        model.addAttribute("myAdmins", myAdmins);
        // return AdminTable with Data Model
        return MODULE_PATH + "adminTable";
    }//end registerPatient
    
    @Secured({"ROLE_SUPER_ADMIN"})
    @RequestMapping(value = "/admin/delete/{adminId}", method = RequestMethod.GET)
    public void deleteAdmin(@PathVariable("adminId") Integer adminId,Model model,HttpServletResponse response) throws IOException {
        // Update User Status
        boolean deleted=userService.deleteUser(adminId);
        
        String done="true";
        if(!deleted){
             done="false";
        }
        ////////////////////////////////////////////////////////////
        response.getWriter().write(done);
    }//end 
    
    @Secured({"ROLE_SUPER_ADMIN"})
    @RequestMapping(value = "/admin/search", method = {RequestMethod.GET, RequestMethod.POST})
    public String searchForAdmin(@RequestParam(value="query", required=false) String query, Model model, HttpServletRequest request, HttpServletResponse response){
        /// Getting List of Patients 
        List<MyUser> myAdmins;
        /// Check if There is Parameter for Filter
        if(query!=null){
            myAdmins =userService.getAdminsWithPattern(query);
        }else{
            myAdmins =userService.getAllAdmins();
        }//end if-Else Block
        /// Adding Admins to View 
        model.addAttribute("myAdmins", myAdmins);
        // return AdminTable with Data Model
        return MODULE_PATH + "adminTable";
    }//end fastSearchPatient 
    
    
    ///////////////////////////////////////////////////////////////////////////////
    /*****************************************************************************
    *           <   USER MODULE  >
    *****************************************************************************/
    ///////////////////////////////////////////////////////////////////////////////
    
    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN"})
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String systemUsers(Model model) {
        //////////////////////////
        // returning Wanted Page
        return MODULE_PATH + "user";
    }
    
    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN"})
    @RequestMapping("/user/loadUserTable")
    public String loadUserTable(Model model) {
        // Getting all System Admins
        List<MyUser> myUsers =userService.getAllUsers();
        /// Append Models
        model.addAttribute("myUsers", myUsers);
        // return AdminTable with Data Model
        return MODULE_PATH + "userTable";
    }//end loadAdminTable
    
    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN"})
    @RequestMapping(value = "/user/data/{userId}", method = RequestMethod.GET)
    public String gettingUserProfile(@PathVariable("userId") Integer userId, Model model) {
        // Check if the Request for Registeration or Editing Profile 
        List<Role> roles=roleService.getAllNonAdminRoles();
        
        model.addAttribute("roles", roles);
        
        if(userId==0){
            model.addAttribute("mode", "Register");
            model.addAttribute("register", true);
        }else{
             MyUser myUser=userService.getUserById(userId);
           
             model.addAttribute("register", false);
             model.addAttribute("myUser", myUser);
             model.addAttribute("mode", "Save Changes");             
        }//end Else If Block 
        // return the User data 
        return MODULE_PATH + "userData";
    }
    
    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN"})
    @RequestMapping(value = "/user/createOrUpdate", method = RequestMethod.POST)
    public String createUsers(@ModelAttribute("userHolder")UserHolder userHolder, Model model) {
        // Check if the Request for Registeration or Editing Profile 
        userService.registerOrUpdateUser(userHolder);
        // return the User data 
        return "redirect:/ums/user";
    }
    
    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN"})
    @RequestMapping(value = "/user/activeOrDeactive", method = RequestMethod.POST)
    public String activateDeactivateUser(@ModelAttribute("userId") Integer userId,@ModelAttribute("status") boolean status,Model model) {
        // Update User Status
        userService.activateOrDeactivateUser(userId, status);
        // Getting all System Admins
        List<MyUser> myUsers =userService.getAllUsers();
        /// Append Models
        model.addAttribute("myUsers", myUsers);
        // return AdminTable with Data Model
        return MODULE_PATH + "userTable";
    }//end registerPatient
    
    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN"})
    @RequestMapping(value = "/user/delete/{userId}", method = RequestMethod.GET)
    public void deleteUser(@PathVariable("userId") Integer userId,Model model,HttpServletResponse response) throws IOException {
        // Update User Status
        boolean deleted=userService.deleteUser(userId);
        
        String done="true";
        if(!deleted){
             done="false";
        }
        ////////////////////////////////////////////////////////////
        response.getWriter().write(done);
    }//end registerPatient
    
    @RequestMapping(value = "/user/search", method = {RequestMethod.GET, RequestMethod.POST})
    public String searchForUser(@RequestParam(value="query", required=false) String query, Model model, HttpServletRequest request, HttpServletResponse response){
        /// Getting List of Patients 
        List<MyUser> myUsers;
        /// Check if There is Parameter for Filter
        if(query!=null){
            myUsers =userService.getUsersWithPattern(query);
        }else{
            myUsers =userService.getAllAdmins();
        }//end if-Else Block
        /// Adding Admins to View 
        model.addAttribute("myUsers", myUsers);
        // return AdminTable with Data Model
        return MODULE_PATH + "userTable";
    }//end fastSearchPatient 
    
    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN"})
    @RequestMapping(value = "/user/profile", method = RequestMethod.GET)
    public String userProfile(Model model,HttpServletResponse response) throws IOException {
        // Update User Status
        MyUser myUser=userService.getLoggedInUserObject();
        
        model.addAttribute("myUser", myUser);
        // return profile Page 
        return MODULE_PATH + "userProfile";
    }//end 
    
    
}
