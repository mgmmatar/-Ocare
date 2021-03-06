/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.dao;

import com.ocare.obook.domain.WorkingTime;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface WorkingTimeDao {
 
    public WorkingTime save(WorkingTime workingTime);
    
    public void update(WorkingTime workingTime);
    
    public void delete(WorkingTime workingTime);
    
    public WorkingTime get(Integer workingTimeId);   
    
    public List<WorkingTime> getWorkingDayTimes(String dayShort);
        
}
