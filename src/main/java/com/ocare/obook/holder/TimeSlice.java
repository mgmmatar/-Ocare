
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.holder;

import java.util.Date;

/**
 *
 * @author khaledeng
 */
public class TimeSlice {
    
    private Date timeFrom;
    private Date timeTo;
    private String status;
    private Integer visitPeriod;
    private Integer patientId;

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getVisitPeriod() {
        return visitPeriod;
    }

    public void setVisitPeriod(Integer visitPeriod) {
        this.visitPeriod = visitPeriod;
    }

    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    @Override
    public String toString() {
        return "TimeSlice{" + "timeFrom=" + timeFrom + ", timeTo=" + timeTo + ", status=" + status + ", visitPeriod=" + visitPeriod + ", patientId=" + patientId + '}';
    }
    
}
