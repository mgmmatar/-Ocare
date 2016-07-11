/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.holder;

import java.util.List;

/**
 *
 * @author khaledeng
 */
public class ShiftSlice {

    private Integer shiftId;
    private List<TimeSlice> slices;

    public Integer getShiftId() {
        return shiftId;
    }

    public void setShiftId(Integer shiftId) {
        this.shiftId = shiftId;
    }

    public List<TimeSlice> getSlices() {
        return slices;
    }

    public void setSlices(List<TimeSlice> slices) {
        this.slices = slices;
    }
    
    
    
}
