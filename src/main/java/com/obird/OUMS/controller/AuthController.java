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

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("authController")
@RequestMapping("/auth")
public class AuthController {
    
        private final String MODULE_PATH="/OBird/auth/";
	        
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
	
}