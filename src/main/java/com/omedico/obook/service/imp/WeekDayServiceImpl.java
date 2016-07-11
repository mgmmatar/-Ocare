/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.obook.service.imp;

import com.obird.utility.ODate;
import com.omedico.obook.dao.WeekDayDao;
import com.omedico.obook.domain.WeekDay;
import com.omedico.obook.domain.WorkingTime;
import com.omedico.obook.holder.WorkingDayHolder;
import com.omedico.obook.service.WeekDayService;
import com.omedico.obook.service.WorkingTimeService;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author khaledeng
 */
@Service("weekDayService")
public class WeekDayServiceImpl implements WeekDayService {

    @Autowired
    private WeekDayDao weekDayDao;
    
    @Autowired
    private WorkingTimeService workingTimeService;
    
    @Override
    @Transactional
    public WeekDay save(WeekDay weekDay) {
         
        System.out.println(">>>> ABOUT TO SAVE "+weekDay.toString());
        
        return weekDayDao.save(weekDay);
    }

    @Override
    @Transactional
    public void update(WeekDay weekDay) {
        weekDayDao.update(weekDay);
    }

    @Override
    public void delete(WeekDay weekDay) {
        weekDayDao.delete(weekDay);
    }

    @Override
    public WeekDay get(Integer weekDayId) {
        return weekDayDao.get(weekDayId);
    }

    @Override
    public List<WeekDay> getAllWeekDays() {
        return weekDayDao.getAllWeekDays();
    }

    @Override
    public List<WeekDay> getWorkingWeekDays() {
        return weekDayDao.getWorkingWeekDays();
    }  

    @Override
    public WeekDay getWeekDay(String dayShortName) {
        return weekDayDao.getWeekDay(dayShortName);
    }
    
    @Transactional
    private List<WeekDay> fillWorkingDay(WorkingDayHolder workingDayHolder){
      
      // Preparing All Week WorkingDays Objects 
      WeekDay satDay= weekDayDao.getWeekDay("SAT");
      WeekDay sunDay= weekDayDao.getWeekDay("SUN");
      WeekDay monDay= weekDayDao.getWeekDay("MON");
      WeekDay tueDay= weekDayDao.getWeekDay("TUE");
      WeekDay wedDay= weekDayDao.getWeekDay("WED");
      WeekDay thuDay= weekDayDao.getWeekDay("THU");
      WeekDay friDay= weekDayDao.getWeekDay("FRI");
    
      List<WeekDay> weekDays=new ArrayList<WeekDay>();
      
      // filling Saterday Shifts 
      if(workingDayHolder.getSAT_DAY().equals("on")){
            // set Day as Working Day  
             System.out.println("SSSSSSS");
            satDay.setOffLine(false);
            if((workingDayHolder.getSAT_TIMEFROM()!=null)&&(workingDayHolder.getSAT_TIMEFROM().size()>0)){
                  
                List<WorkingTime> satWorkingTimes= new ArrayList<WorkingTime>();
                //Add All Times 
                for(int i=0;i<workingDayHolder.getSAT_TIMEFROM().size();i++){
                            WorkingTime satTime = new WorkingTime();
                            satTime.setExpanded(false);
                            satTime.setTimeFrom(ODate.getTimeFromString(workingDayHolder.getSAT_TIMEFROM().get(i)+":00"));
                            satTime.setTimeTo(ODate.getTimeFromString(workingDayHolder.getSAT_TIMETO().get(i)+":00"));
                            satTime.setWeekDay(satDay);
                            satWorkingTimes.add(satTime);
                }//end for Loop 
                satDay.setWorkingTimes(satWorkingTimes);
                System.out.println("HHHHHHHH "+satDay);
            }//end inner If      
        }//end Outer If
        
        else{
            satDay.setOffLine(true);
        }//end Else 
        
      //ADD DAY TO List 
      weekDays.add(satDay);
      
      // filling SUNDAY Shifts 
      if(workingDayHolder.getSUN_DAY().equals("on")){
            // set Day as Working Day  
            sunDay.setOffLine(false);
            if((workingDayHolder.getSUN_TIMEFROM()!=null)&&(workingDayHolder.getSUN_TIMEFROM().size()>0)){
                List<WorkingTime> sunWorkingTimes= new ArrayList<WorkingTime>();
                //Add All Times 
                for(int i=0;i<workingDayHolder.getSUN_TIMEFROM().size();i++){
                            WorkingTime sunTime = new WorkingTime();
                            sunTime.setExpanded(false);
                            sunTime.setTimeFrom(ODate.getTimeFromString(workingDayHolder.getSUN_TIMEFROM().get(i)+":00"));
                            sunTime.setTimeTo(ODate.getTimeFromString(workingDayHolder.getSUN_TIMETO().get(i)+":00"));
                            sunTime.setWeekDay(sunDay);
                            sunWorkingTimes.add(sunTime);
                }//end for Loop 
                sunDay.setWorkingTimes(sunWorkingTimes);
            }//end inner If      
        }//end Outer If
        
        else{
            sunDay.setOffLine(true);
        }//end Else 
        
      //ADD DAY TO List 
      weekDays.add(sunDay);
      
      // filling Monday Shifts 
      if(workingDayHolder.getMON_DAY().equals("on")){
            // set Day as Working Day  
            monDay.setOffLine(false);
            if((workingDayHolder.getMON_TIMEFROM()!=null)&&(workingDayHolder.getMON_TIMEFROM().size()>0)){
                  
                List<WorkingTime> monWorkingTimes= new ArrayList<WorkingTime>();
                //Add All Times 
                for(int i=0;i<workingDayHolder.getMON_TIMEFROM().size();i++){
                            WorkingTime monTime = new WorkingTime();
                            monTime.setExpanded(false);
                            monTime.setTimeFrom(ODate.getTimeFromString(workingDayHolder.getMON_TIMEFROM().get(i)+":00"));
                            monTime.setTimeTo(ODate.getTimeFromString(workingDayHolder.getMON_TIMETO().get(i)+":00"));
                            monTime.setWeekDay(monDay);
                            monWorkingTimes.add(monTime);
                }//end for Loop 
                monDay.setWorkingTimes(monWorkingTimes);
            }//end inner If      
        }//end Outer If
        
        else{
            monDay.setOffLine(true);
        }//end Else 
        
      //ADD DAY TO List 
      weekDays.add(monDay);
      
      // filling TUESDAY Shifts 
      if(workingDayHolder.getTUE_DAY().equals("on")){
            // set Day as Working Day  
            tueDay.setOffLine(false);
            if((workingDayHolder.getTUE_TIMEFROM()!=null)&&(workingDayHolder.getTUE_TIMEFROM().size()>0)){
                  
                List<WorkingTime> tueWorkingTimes= new ArrayList<WorkingTime>();
                //Add All Times 
                for(int i=0;i<workingDayHolder.getTUE_TIMEFROM().size();i++){
                            WorkingTime tueTime = new WorkingTime();
                            tueTime.setExpanded(false);
                            tueTime.setTimeFrom(ODate.getTimeFromString(workingDayHolder.getTUE_TIMEFROM().get(i)+":00"));
                            tueTime.setTimeTo(ODate.getTimeFromString(workingDayHolder.getTUE_TIMETO().get(i)+":00"));
                            tueTime.setWeekDay(tueDay);
                            tueWorkingTimes.add(tueTime);
                }//end for Loop 
                tueDay.setWorkingTimes(tueWorkingTimes);
            }//end inner If      
        }//end Outer If
        
        else{
            tueDay.setOffLine(true);
        }//end Else 
        
      //ADD DAY TO List 
      weekDays.add(tueDay);
      
      // filling WEDNESDAY Shifts 
      if(workingDayHolder.getWED_DAY().equals("on")){
            // set Day as Working Day
            satDay.setOffLine(false);
            if((workingDayHolder.getWED_TIMEFROM()!=null)&&(workingDayHolder.getWED_TIMEFROM().size()>0)){
                  
                List<WorkingTime> wedWorkingTimes= new ArrayList<WorkingTime>();
                //Add All Times 
                for(int i=0;i<workingDayHolder.getWED_TIMEFROM().size();i++){
                            WorkingTime wedTime = new WorkingTime();
                            wedTime.setExpanded(false);
                            wedTime.setTimeFrom(ODate.getTimeFromString(workingDayHolder.getWED_TIMEFROM().get(i)+":00"));
                            wedTime.setTimeTo(ODate.getTimeFromString(workingDayHolder.getWED_TIMETO().get(i)+":00"));
                            wedTime.setWeekDay(wedDay);
                            wedWorkingTimes.add(wedTime);
                }//end for Loop 
                wedDay.setWorkingTimes(wedWorkingTimes);
            }//end inner If      
        }//end Outer If
        
        else{
            wedDay.setOffLine(true);
        }//end Else 
        
      //ADD DAY TO List 
      weekDays.add(wedDay);
      
      // filling THURSDAY Shifts 
      if(workingDayHolder.getTHU_DAY().equals("on")){
            // set Day as Working Day  
            thuDay.setOffLine(false);
            if((workingDayHolder.getTHU_TIMEFROM()!=null)&&(workingDayHolder.getTHU_TIMEFROM().size()>0)){
                  
                List<WorkingTime> thuWorkingTimes= new ArrayList<WorkingTime>();
                //Add All Times 
                for(int i=0;i<workingDayHolder.getTHU_TIMEFROM().size();i++){
                            WorkingTime thuTime = new WorkingTime();
                            thuTime.setExpanded(false);
                            thuTime.setTimeFrom(ODate.getTimeFromString(workingDayHolder.getTHU_TIMEFROM().get(i)+":00"));
                            thuTime.setTimeTo(ODate.getTimeFromString(workingDayHolder.getTHU_TIMETO().get(i)+":00"));
                            thuTime.setWeekDay(thuDay);
                            thuWorkingTimes.add(thuTime);
                }//end for Loop 
                thuDay.setWorkingTimes(thuWorkingTimes);
            }//end inner If      
        }//end Outer If
        
        else{
            thuDay.setOffLine(true);
        }//end Else 
        
      //ADD DAY TO List 
      weekDays.add(thuDay);
      
      // filling FRIDAY Shifts 
      if(workingDayHolder.getFRI_DAY().equals("on")){
            // set Day as Working Day  
            friDay.setOffLine(false);
            if((workingDayHolder.getFRI_TIMEFROM()!=null)&&(workingDayHolder.getFRI_TIMEFROM().size()>0)){
                  
                List<WorkingTime> friWorkingTimes= new ArrayList<WorkingTime>();
                //Add All Times 
                for(int i=0;i<workingDayHolder.getFRI_TIMEFROM().size();i++){
                            WorkingTime friTime = new WorkingTime();
                            friTime.setExpanded(false);
                            friTime.setTimeFrom(ODate.getTimeFromString(workingDayHolder.getFRI_TIMEFROM().get(i)+":00"));
                            friTime.setTimeTo(ODate.getTimeFromString(workingDayHolder.getFRI_TIMETO().get(i)+":00"));
                            friTime.setWeekDay(friDay);
                            friWorkingTimes.add(friTime);
                }//end for Loop 
                friDay.setWorkingTimes(friWorkingTimes);
            }//end inner If      
        }//end Outer If
        
        else{
            friDay.setOffLine(true);
        }//end Else 
      
      //ADD DAY TO List 
      weekDays.add(friDay);
      
        // return result 
        return weekDays;
    }//end fillWorkingDay
  
    @Transactional
    public List<WeekDay> addALLTimes(WorkingDayHolder workingDayHolder){         
        // Saving all WeekDays
        saveWeekDayInfo("SAT", workingDayHolder.getSAT_DAY(), workingDayHolder.getSAT_TIMEFROM(),workingDayHolder.getSAT_TIMETO(), workingDayHolder.getSAT_STATUS());
        saveWeekDayInfo("SUN", workingDayHolder.getSUN_DAY(), workingDayHolder.getSUN_TIMEFROM(),workingDayHolder.getSUN_TIMETO(), workingDayHolder.getSUN_STATUS());
        saveWeekDayInfo("MON", workingDayHolder.getMON_DAY(), workingDayHolder.getMON_TIMEFROM(),workingDayHolder.getMON_TIMETO(), workingDayHolder.getMON_STATUS());
        saveWeekDayInfo("TUE", workingDayHolder.getTUE_DAY(), workingDayHolder.getTUE_TIMEFROM(),workingDayHolder.getTUE_TIMETO(), workingDayHolder.getTUE_STATUS());
        saveWeekDayInfo("WED", workingDayHolder.getWED_DAY(), workingDayHolder.getWED_TIMEFROM(),workingDayHolder.getWED_TIMETO(), workingDayHolder.getWED_STATUS());
        saveWeekDayInfo("THU", workingDayHolder.getTHU_DAY(), workingDayHolder.getTHU_TIMEFROM(),workingDayHolder.getTHU_TIMETO(), workingDayHolder.getTHU_STATUS());
        saveWeekDayInfo("FRI", workingDayHolder.getFRI_DAY(), workingDayHolder.getFRI_TIMEFROM(),workingDayHolder.getFRI_TIMETO(), workingDayHolder.getFRI_STATUS());
        //return result
        return null;
    }
    
    @Transactional
    public List<WeekDay> addAllWeektimes(WorkingDayHolder workingDayHolder){
        // Getting List 
        List<WeekDay> weekDays = fillWorkingDay(workingDayHolder);
        // Updating Them 
        for(WeekDay weekDay : weekDays){
            // update weekDay
            update(weekDay);
        }//end Foreach 
        return weekDays;
    }///addThem
    
    @Transactional
    public void removeAllTimes(){
        
        workingTimeService.removeAllWorkingTimes("SAT");
        workingTimeService.removeAllWorkingTimes("SUN");
        workingTimeService.removeAllWorkingTimes("MON");
        workingTimeService.removeAllWorkingTimes("TUE");
        workingTimeService.removeAllWorkingTimes("WED");
        workingTimeService.removeAllWorkingTimes("THU");
        workingTimeService.removeAllWorkingTimes("FRI");
        
    }
    
    @Transactional
    private void saveWeekDayInfo(String dayShort,String status,List<String> fromTimes,List<String> toTimes,List<String> timeStatus){
        // Getting DayShortName
        WeekDay weekDay=getWeekDay(dayShort);
        System.out.println(">> >>>>>>>>>> DAY "+dayShort);
        System.out.println(">> >>>>>>>>>> STATUS "+status);
        if(status.equals("on")){
            weekDay.setOffLine(false);
            /// Stage of save or update  
            if(fromTimes!=null){
                for(int i=0;i<fromTimes.size();i++){
                    if(timeStatus.get(i).equals("0")){
                        // Create New WorkingTime 
                        WorkingTime workingTime= new WorkingTime();
                        workingTime.setTimeFrom(ODate.getTimeAMPMFromString(fromTimes.get(i)));
                        workingTime.setTimeTo(ODate.getTimeAMPMFromString(toTimes.get(i)));
                        workingTime.setWeekDay(weekDay);
                        workingTime.setExpanded(false);
                        workingTimeService.save(workingTime);
                        ////
                        System.out.println(">> NEW ");
                        System.out.println("FROM : "+fromTimes.get(i)+" TO : "+toTimes.get(i));
                    }else{
                        int workingDayId=Integer.parseInt(timeStatus.get(i));
                        WorkingTime workingTime=workingTimeService.get(workingDayId);
                        workingTime.setTimeFrom(ODate.getTimeAMPMFromString(fromTimes.get(i)));
                        workingTime.setTimeTo(ODate.getTimeAMPMFromString(toTimes.get(i)));
                        workingTimeService.update(workingTime);
                        System.out.println(">> OLD ");
                        System.out.println("FROM : "+fromTimes.get(i)+" TO : "+toTimes.get(i));
                    }//end else
                }//end for Loop 
                /// Deleted Times 
                for(WorkingTime workingTime:weekDay.getWorkingTimes()){
                     String workingId=workingTime.getId()+"";
                     if(!timeStatus.contains(workingId)){
                         System.out.println(">>>>>>>>>>>>>>> DELETED : "+workingId);
                         workingTime.setDeleted(true);
                         workingTimeService.update(workingTime);
                     }//end for Loop 
                }//end for Loop    
            }//end if 
        }//end if condition 
        if(status.equals("off")){
            System.out.println(">> >>>>>>>>>> DAY "+dayShort);
            System.out.println(">> >>>>>>>>>> STATUS "+status);
            weekDay.setOffLine(true);
        }//end if condition 
        /// Update and Insert New 
         
        
        
        
    }//end saveWeekDayInfo Method
    
}
