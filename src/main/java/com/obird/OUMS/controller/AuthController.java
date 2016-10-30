/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OUMS.controller;

/**
 *
 * @author khaledeng
 */
import com.obird.OUMS.domain.Role;
import com.obird.OUMS.domain.User;
import com.obird.OUMS.service.UserService;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("authController")
@RequestMapping("/auth")
public class AuthController {
    
        private final String MODULE_PATH="/OBird/auth/";
	
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
	
        @Autowired
        private UserService userService;
        
        @RequestMapping(value="/login")
	public String login(HttpServletRequest request, Model model){
		return MODULE_PATH+"login";
	}
	
	@RequestMapping(value="/logout")
	public String logout(){
		return MODULE_PATH+"logout";
	}
	
	@RequestMapping(value="/denied")
	public String denied(){
		return MODULE_PATH+"denied";
	}
        
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
            
            
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
	
                User user=userService.getUserByUserName("khaledeng");
                System.out.println(">>>>>>>>>>>>> SIZE : "+user.getRoles().size());
                System.out.println(">>>>>>>>>>>>> USER : "+user.toString());
                for(Role role:user.getRoles()){
                   System.out.println(">>>>>>>>>>>>> ROLE : "+role.getName());
                }
                
                
                
		model.addAttribute("serverTime", formattedDate );
		return "home";
	}
	
	
}