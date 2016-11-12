/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.UMS.controller;

import com.ocare.UMS.domain.MyUser;
import com.ocare.UMS.holder.UserHolder;
import com.ocare.UMS.service.MyUserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    ////////////////////////////////////////////////////////////////////////////
    /*   
        * Admin Module *
    */
    ////////////////////////////////////////////////////////////////////////////
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
    
    @RequestMapping(value = "/admin/createOrUpdate", method = RequestMethod.POST)
    public String createAdmins(@ModelAttribute("userHolder")UserHolder userHolder, Model model) {
        // Check if the Request for Registeration or Editing Profile 
         userService.registerOrUpdateUser(userHolder);
        // return the User data 
        return "redirect:/ums/admin";
    }
    
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
    
}
