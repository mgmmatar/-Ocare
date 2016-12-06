/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OLog.service.imp;

import com.obird.OLog.dao.ActionLogDao;
import com.obird.OLog.domain.ActionLog;
import com.obird.OLog.service.ActionLogService;
import com.ocare.UMS.service.MyUserService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author khaledeng
 */
@Service("actionLogService")
public class ActionLogServiceImp implements ActionLogService{
    
    @Autowired
    private ActionLogDao actionLogDao;

    @Autowired
    private MyUserService userService;
    
    @Override
    public ActionLog save(ActionLog actionLog) {
        return actionLogDao.save(actionLog);
    }

    @Override
    public void update(ActionLog actionLog) {
        actionLogDao.update(actionLog);
    }

    @Override
    public void delete(ActionLog actionLog) {
        actionLogDao.delete(actionLog);
    }

    @Override
    public ActionLog get(Integer actionLogId) {
        return actionLogDao.get(actionLogId);
    }

    @Override
    public List<ActionLog> getAllActionLogs() {
        return actionLogDao.getAllActionLogs();
    }

    @Transactional
    @Override
    public void createActionLog(String action, String module, String identifier, String message) {
        // define ACtionLogString
        
        String actionLogString="";
        
        if(action!=null){
            actionLogString+=" "+action;
        }
        
        if(module!=null){
            actionLogString+=" "+module;
        }
        
        if(identifier!=null){
            actionLogString+=" "+identifier;
        }
        
        if(message!=null){
            actionLogString+=" "+message;
        }
        // Init ActionLog
        ActionLog actionLog=new ActionLog();
        actionLog.setAction(actionLogString.trim());
        actionLog.setCreated(new Date());
        actionLog.setMyUser(userService.getLoggedInUserObject());
        // Save Log 
        actionLogDao.save(actionLog);
        
    }

    @Override
    public List<ActionLog> getActionLogsWithPattern(String pattern) {
        return actionLogDao.getActionLogsWithPattern(pattern);
    }
    
    
    
}
