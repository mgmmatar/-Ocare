/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.service;

import com.ocare.obook.domain.WeekDay;
import com.ocare.obook.holder.WorkingDayHolder;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface WeekDayService {
    
    public WeekDay save(WeekDay weekDay);
    
    public void update(WeekDay weekDay);
    
    public void delete(WeekDay weekDay);
    
    public WeekDay get(Integer weekDayId);
    
    public List<WeekDay> getAllWeekDays();
    
    public List<WeekDay> getWorkingWeekDays();
    
    public WeekDay getWeekDay(String dayShortName);
     
    public List<WeekDay> addALLTimes(WorkingDayHolder workingDayHolder);
    
}
