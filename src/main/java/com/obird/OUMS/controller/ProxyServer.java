/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OUMS.controller;

import com.obird.OUMS.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author khaledeng
 */
@Controller("proxyServer")
@RequestMapping("/proxy")
public class ProxyServer {
    
    @Autowired
    private UserService userService;
    
    @RequestMapping(value = {"/",""})
    public String indexPage(Model model) {
        /// Redirect URL 
        String redirectURL="";
        //// Route the User to Main Method
        if(userService.isSuperAdmin()){
            redirectURL="redirect:/reservation/list";
        }
        else if(userService.isAdmin()){
            redirectURL="redirect:/reservation/list";
        }//end if Condition
        else if(userService.isReservationUser()){
            redirectURL="redirect:/reservation/list";
        }//end if Condition
        else if(userService.isEntryUser()){
            redirectURL="redirect:/patient/list";
        }
        else if(userService.isInquiryUser()){
            redirectURL="redirect:/reservation/preview";
        }//end if Condition
        
        return redirectURL;
    }//end registerPatient
    
    
    
    
}
