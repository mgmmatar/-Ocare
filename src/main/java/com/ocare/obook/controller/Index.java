/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.controller;

import com.ocare.obook.domain.Common;
import com.ocare.obook.service.CommonService;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

// Welcome to Index
/**
 *
 * @author khaledeng
 */
@Controller("indexController")
@RequestMapping("/")
public class Index {

    @Autowired
    private CommonService commonService;

 
    
    @RequestMapping(value = "/")
    public String indexPage(Model model) {
        return "index";
    }//end registerPatient

    @RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "login";
    }
        
    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "accessDenied";
	}
        
    	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}    
        
    @RequestMapping(value = "/defaultSearchBy", method = RequestMethod.GET)
    public @ResponseBody String registerPatient(Model model) {
        String defaultSearchBy=null;
        // Getting Common Information 
        Common common=commonService.get(1);
        defaultSearchBy = common.getDefaultSearchBy();
        System.out.println(">%%% "+defaultSearchBy);
        
        return defaultSearchBy;
    }//end registerPatient
    
    @RequestMapping(value = "/assignDefaultSearchBy/{searchBy}", method = RequestMethod.GET)
    public void assignDefaultSettings(@PathVariable("searchBy") String searchBy, Model model,HttpServletResponse response) throws IOException {
        /// Getting Reservation 
        // Getting Common Information 
        Common common=commonService.get(1);
        common.setDefaultSearchBy(searchBy);
        commonService.update(common);
        ////////////////////
        response.getWriter().write("true");
    }//cancelReservation process
    

}//end Index
