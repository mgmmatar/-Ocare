/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.obook.holder;

import com.omedico.obook.domain.Reservation;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public class ShiftReservation {
    
    private Integer shiftId;
    private List<Reservation> reservations;

    public Integer getShiftId() {
        return shiftId;
    }

    public void setShiftId(Integer shiftId) {
        this.shiftId = shiftId;
    }

    public List<Reservation> getReservations() {
        return reservations;
    }

    public void setReservations(List<Reservation> reservations) {
        this.reservations = reservations;
    }
    
    
     
}
