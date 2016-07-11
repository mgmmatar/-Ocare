/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.obook.service;

import com.omedico.obook.domain.WorkingTime;

/**
 *
 * @author khaledeng
 */
public interface WorkingTimeService {
    
    public WorkingTime save(WorkingTime workingTime);
    
    public void update(WorkingTime workingTime);
    
    public void delete(WorkingTime workingTime);
    
    public WorkingTime get(Integer workingTimeId);
    
    public void removeAllWorkingTimes(String shortDayName);
            
}//end WorkingTimeService 
