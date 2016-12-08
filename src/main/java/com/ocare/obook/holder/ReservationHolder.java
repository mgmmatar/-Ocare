/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.holder;

/**
 *
 * @author khaledeng
 */
public class ReservationHolder {
    
    private Integer patientId;
    private Integer reservationWayId;
    private Integer examineTypeId;
    private Integer workingTimeId;
    private String reservationDate;
    private String attendenceTime;
    private String totalCost;
    private String paidCost;
    
    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    public Integer getReservationWayId() {
        return reservationWayId;
    }

    public void setReservationWayId(Integer reservationWayId) {
        this.reservationWayId = reservationWayId;
    }

    public Integer getExamineTypeId() {
        return examineTypeId;
    }

    public void setExamineTypeId(Integer examineTypeId) {
        this.examineTypeId = examineTypeId;
    }

    public String getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(String reservationDate) {
        this.reservationDate = reservationDate;
    }

    public Integer getWorkingTimeId() {
        return workingTimeId;
    }

    public void setWorkingTimeId(Integer workingTimeId) {
        this.workingTimeId = workingTimeId;
    }

  
    public String getAttendenceTime() {
        return attendenceTime;
    }

    public void setAttendenceTime(String attendenceTime) {
        this.attendenceTime = attendenceTime;
    }

    public String getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(String totalCost) {
        this.totalCost = totalCost;
    }

    public String getPaidCost() {
        return paidCost;
    }

    public void setPaidCost(String paidCost) {
        this.paidCost = paidCost;
    }

    @Override
    public String toString() {
        return "ReservationHolder{" + "patientId=" + patientId + ", reservationWayId=" + reservationWayId + ", examineTypeId=" + examineTypeId + ", workingTimeId=" + workingTimeId + ", reservationDate=" + reservationDate + ", attendenceTime=" + attendenceTime + ", totalCost=" + totalCost + ", paidCost=" + paidCost + '}';
    }

}
