/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.obook.domain;

import com.obird.utility.ODate;
import java.util.Date;

/**
 *
 * @author khaledeng
 */
public class AvailableRange {

    private int shift;
    private Date timeFrom;
    private Date timeTo;

    public int getShift() {
        return shift;
    }

    public void setShift(int shift) {
        this.shift = shift;
    }

    public Date getTimeFrom() {
        return timeFrom;
    }

    public void setTimeFrom(Date timeFrom) {
        this.timeFrom = timeFrom;
    }

    public Date getTimeTo() {
        return timeTo;
    }

    public void setTimeTo(Date timeTo) {
        this.timeTo = timeTo;
    }

    @Override
    public String toString() {
        return "AvailableTimeRanges{" + "shift=" + shift + ", timeFrom=" + ODate.getStringFromTime(timeFrom) + ", timeTo=" + ODate.getStringFromTime(timeTo) + '}';
    }
    
  
    
}
