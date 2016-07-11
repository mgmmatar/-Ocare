/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.obook.service.imp;

import com.omedico.obook.dao.WorkingTimeDao;
import com.omedico.obook.domain.WorkingTime;
import com.omedico.obook.service.WorkingTimeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author khaledeng
 */
@Service("workingTimeService")
public class WorkingTimeServiceImpl implements WorkingTimeService{

    @Autowired
    private WorkingTimeDao workingTimeDao;
    
    @Override
    public WorkingTime save(WorkingTime workingTime) {
        return workingTimeDao.save(workingTime);
    }

    @Override
    public void update(WorkingTime workingTime) {
        workingTimeDao.update(workingTime);
    }

    @Override
    @Transactional
    public void delete(WorkingTime workingTime) {
        workingTimeDao.delete(workingTime);
    }

    @Override
    public WorkingTime get(Integer workingTimeId) {
          return workingTimeDao.get(workingTimeId);
    }

    @Override
    @Transactional
    public void removeAllWorkingTimes(String shortDayName) {
        
        List<WorkingTime> times=workingTimeDao.getWorkingDayTimes(shortDayName);
        // Foreach all of them 
        for(WorkingTime time:times){
            delete(time);
        }//end For each 
        
    }

    
}
