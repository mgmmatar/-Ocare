/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.utility;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public class ODate {
    
    public static Date getDateWithTime(int hour,int minute){
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY,hour);
        cal.set(Calendar.MINUTE,minute);
        cal.set(Calendar.SECOND,0);
        cal.set(Calendar.MILLISECOND,0);
        Date date = cal.getTime();
        // return result 
        return date;
    }//end Method 
    
    public static Date addMinutesToTime(Date date,int minutes){
    
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MINUTE, minutes);
        // return 
       return cal.getTime();
    }
    
    public static String getWeekDay(Date date){
       // Date Format       
       SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
       dateFormat.applyPattern("EEE");
       String MyDate = dateFormat.format(date);
       MyDate = MyDate.substring(0,3).toUpperCase();
      // return result
       return MyDate.toUpperCase();
    }
    
    public static Date getDateFromString(String dateString){
    
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        // date Creation
        Date date = null;
        try {
            date = sdf.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }//end try_catch Block 
    
        /// return Date 
        return date;
    }
    
    public static Date getTimeFromString(String time){
       // TimeFormat 
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        // date Creation
        Date date = null;
        try {
            date = sdf.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }//end try_catch Block 
        //return result 
        return date; 
    }//end getTimeFromString
    
    public static Date getTimeAMPMFromString(String time){
       // TimeFormat 
        SimpleDateFormat sdf = new SimpleDateFormat("hh:mm aa");
        // date Creation
        Date date = null;
        try {
            date = sdf.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }//end try_catch Block 
        //return result 
        return date; 
    }//end getTimeFromString

    public static String getStringFromTime(Date date){
    
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        
        String stringDate = sdf.format(date);
        
        return stringDate;
      
    }
    
    public static String getStringDateForCalendar(Date date){
    
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
        
        String stringDate = sdf.format(date);
        
        return stringDate;
      
    }
    
    public static String getStringFromDate(Date date){
    
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        String stringDate = sdf.format(date);
        
        return stringDate;
      
    }
    
    public static int getMinutesBetweenTimes(Date time1,Date time2){
    
        long difference = time1.getTime() - time2.getTime(); 
        
        int minutes=0;
        
        if(difference!=0){
            minutes=((int)difference/1000)/60;
        }
        return minutes;
        
    }//end getMinutes Time
  
    public static Date addMinutesToDate(Date date,Integer minutes){
        // Getting CurrentDate
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MINUTE, minutes);
        // return result 
        return cal.getTime();
    }//end addMinutesToDate 
  
    public static Date getDateTimeFormat(Date date , Date time){
       // Date DateFormatter 
       SimpleDateFormat timeDateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       /// Full String Date 
       String fullString=getStringFromDate(date)+" "+getStringFromTime(time);
       /// Date to be Returned
       Date fullDate=null;
       
       try {
            fullDate = timeDateFormatter.parse(fullString);
        } catch (ParseException e) {
            e.printStackTrace();
        }//end try_catch Block 
       /// return result    
       return fullDate;
    }
    
    public static Date get24HourTimeFromString(String time){
        // Time Formats 
        DateFormat twelveHourFormat = new SimpleDateFormat("hh:mm a");
        DateFormat twentyFourHourFormat = new SimpleDateFormat("HH:mm:ss");
        //Date to be returned 
        Date twentyFourHourDate=null;
        // Parsing the Date 
        try {
            // converting String to twentyForHourDate
            Date twelveHourDate = twelveHourFormat.parse(time);
            String twentyFourHourString= twentyFourHourFormat.format(twelveHourDate);
            twentyFourHourDate=twentyFourHourFormat.parse(twentyFourHourString);
        } catch (ParseException e) {
            e.printStackTrace();
        }//end try_catch Block 
       // return result 
        return twentyFourHourDate;
    }//end get24HourTimeFromString
    
    public static boolean isValidateDate(String date){
       
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            dateFormat.setLenient(false);
            try {
              dateFormat.parse(date.trim());
            } catch (ParseException pe) {
              return false;
            }
            return true;

    }//isValidateDate
    
    public static List<String> getMonthNameList(){
    
        List<String> months=new ArrayList<String>();
        /// Set Names
        months.add("January");
        months.add("February");
        months.add("March");
        months.add("April");
        months.add("May");
        months.add("June");
        months.add("July");
        months.add("August");
        months.add("September");
        months.add("October");
        months.add("November");
        months.add("December");
        
        // return result 
        return months;
    }//end getMonthNameList
    
    public static String getMonthValue(String month){
    
        String monthValue="";
        
        List<String> months= getMonthNameList();
        for(int i=0;i<months.size();i++){
          if(months.get(i).equalsIgnoreCase(month)){
              int value=(i+1);
              if(value<10){
                  monthValue+="0"+value;
              }else{
                  monthValue+=value;
              }//end if-Else
              break;
          }//end if 
        }//end if 
        // return result 
        return monthValue;
    }
    
    public static List<Integer> getDaysList(){
    
        List<Integer> days=new ArrayList<Integer>();
        /// Set Names
        for(int i=1;i<=31;i++){
            days.add(i);
        }//end for 
        // return result 
        return days;
    }//end getMonthNameList
    
    public static List<Integer> getYearsList(){
    
        int year = Calendar.getInstance().get(Calendar.YEAR);
        
        List<Integer> years=new ArrayList<Integer>();
        /// Set Names
        for(int i=year;i>=1920;i--){
            years.add(i);
        }//end for 
        // return result 
        return years;
    }//end getMonthNameList
    
    
    
    public static void main(String[] args) {

        String myTime = "23:30:54";

        String myDate="2015-10-24";

        Date date=getDateFromString(myDate);

        Date time=getTimeFromString(myTime);

        Date ddd=getDateTimeFormat(date, time);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //System.out.println(sdf.format(ddd));
   
        String dateS="2016-50-10";
        
        System.out.println(">>>> "+isValidateDate(dateS));
          
   }//end Main method
   
    
    
    
}//end Class ODate 
