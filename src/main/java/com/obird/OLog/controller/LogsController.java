package com.obird.OLog.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.obird.OLog.domain.ActionLog;
import com.obird.OLog.service.ActionLogService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author khaledeng
 */
@Controller("logsController")
@RequestMapping("/log")
public class LogsController {
    
    // Patient Module Path
    private final String MODULE_PATH="/OBird/log/";
    
    @Autowired
    private ActionLogService actionLogService;
    
    @Secured({"ROLE_SUPER_ADMIN"})
    @RequestMapping(value = "/action")
    public String actionLog(Model model){
        
        // return View         
        return MODULE_PATH+"actionLog";
    }//end registerPatient
    
    
    @Secured({"ROLE_SUPER_ADMIN"})
    @RequestMapping(value = "/action/loadActionLogTable")
    public String actionLogTable(Model model){
     
        List<ActionLog> logs=actionLogService.getAllActionLogs();
        model.addAttribute("logs", logs);
        // return View         
        return MODULE_PATH+"actionLogTable";
    }//end registerPatient
    
    @RequestMapping(value = "/action/search", method = {RequestMethod.GET, RequestMethod.POST})
    public String searchForExamineType(@RequestParam(value="query", required=false) String query, Model model, HttpServletRequest request, HttpServletResponse response){
        /// Getting List of Patients 
        List<ActionLog> logs;
        /// Check if There is Parameter for Filter        
        if(!query.isEmpty()){
            logs =actionLogService.getActionLogsWithPattern(query);
        }else{
            logs=actionLogService.getAllActionLogs();
        }//end if-Else Block
        // Getting all ExamineTypes
        /// Append Models
       model.addAttribute("logs", logs);
        // Getting List
        return MODULE_PATH+"actionLogTable";
    }//end fastSearchPatient
    
    
}

