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
public class ReportReservationStatus {
    
    private String statusName;
    private long occuranceNumber;

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public long getOccuranceNumber() {
        return occuranceNumber;
    }

    public void setOccuranceNumber(long occuranceNumber) {
        this.occuranceNumber = occuranceNumber;
    }

    @Override
    public String toString() {
        return "ReportReservationStatus{" + "statusName=" + statusName + ", occuranceNumber=" + occuranceNumber + '}';
    }

   

    
}
