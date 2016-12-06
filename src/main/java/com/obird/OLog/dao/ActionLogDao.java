/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OLog.dao;

import com.obird.OLog.domain.ActionLog;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface ActionLogDao {
 
    public ActionLog save(ActionLog actionLog);
    
    public void update(ActionLog actionLog);
    
    public void delete(ActionLog actionLog);
    
    public ActionLog get(Integer actionLogId);
    
    public List<ActionLog> getAllActionLogs();
    
    public List<ActionLog> getActionLogsWithPattern(final String pattern);
    
}
