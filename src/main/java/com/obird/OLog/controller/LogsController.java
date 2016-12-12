package com.obird.OLog.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.obird.OLog.domain.ActionLog;
import com.obird.OLog.service.ActionLogService;
import com.obird.utility.ODate;
import com.ocare.obook.domain.WeekDay;
import com.ocare.obook.holder.ShiftReservation;
import com.ocare.obook.service.ReservationService;
import com.ocare.obook.service.WeekDayService;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
    
    @Autowired
    private ReservationService reservationService;
    
    @Autowired
    private WeekDayService weekDayService;
    
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
    
    @Secured({"ROLE_SUPER_ADMIN"})
    @RequestMapping("/reservation")
    public String reservationProcess2(Model model) {
        // Get patient
        Date currentDate = new Date();
        String dayShortName = ODate.getWeekDay(currentDate);
        WeekDay weekDay = weekDayService.getWeekDay(dayShortName);
        /// Model Data to View
        model.addAttribute("currentDate", ODate.getStringDateForCalendar(currentDate));
        model.addAttribute("weekDay", weekDay);
        // Return result 
        return MODULE_PATH + "reservationLog";
    }//end registerPatient
    
    @RequestMapping(value = "/reservation/Element/{date}", method = RequestMethod.GET, produces = "application/json")
    @Secured({"ROLE_SUPER_ADMIN","ROLE_ADMIN","ROLE_RESERVATION_USER","ROLE_INQUIRY_USER"})
    public String reservationListForDate(@PathVariable("date") String dateString, Model model) {
    
        System.out.println(">>> HELLO ");   
        System.out.println(">>> CurrentDate "+dateString);   
     ////////////////////////////////////////////////////////////
        Date currentDate = ODate.getDateFromString(dateString);
        // Getting All Reservations Per Shift 
        List<ShiftReservation> shifts=reservationService.getAllDoneReservations(currentDate);
        // Getting Reservation Shifts
        String dayShortName = ODate.getWeekDay(currentDate);
        WeekDay weekDay = weekDayService.getWeekDay(dayShortName);
        ///////////////////////
        // Sent Data to View
        model.addAttribute("currentDate", ODate.getStringDateForCalendar(currentDate));
        model.addAttribute("weekDay", weekDay);
        model.addAttribute("shifts", shifts);
        // returning Wanted Page
        return MODULE_PATH + "reservationLogElement";
    }
    
}

