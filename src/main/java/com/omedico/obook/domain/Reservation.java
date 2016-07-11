/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.obook.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.ForeignKey;

/**
 *
 * @author khaledeng
 */
@Entity
@Table(name="reservation")
public class Reservation {
 
    private Integer id;
    private Date reservationDate;
    private ReservationWay reservationWay;
    private ExamineType examineType;
    private Patient patient;
    private Float paid;
    private Float remain;
    private Date attendenceTimeFrom;
    private Date attendenceTimeTo;
    private String status;
    private Integer theOrder;
    private WorkingTime workingTime;
    
    
    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="reservationDate",nullable =true)
    public Date getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(Date reservationDate) {
        this.reservationDate = reservationDate;
    }

    @ForeignKey(name="reservationWay")
    @JoinColumn(name="reservationWay" , nullable=true)
    @ManyToOne(fetch = FetchType.LAZY)     
    public ReservationWay getReservationWay() {
        return reservationWay;
    }

    public void setReservationWay(ReservationWay reservationWay) {
        this.reservationWay = reservationWay;
    }

    @ForeignKey(name="examineType")
    @JoinColumn(name="examineType" , nullable=true)
    @ManyToOne(fetch = FetchType.LAZY)
    public ExamineType getExamineType() {
        return examineType;
    }

    public void setExamineType(ExamineType examineType) {
        this.examineType = examineType;
    }

    @ForeignKey(name="patientId")
    @JoinColumn(name="patientId" , nullable=true)
    @ManyToOne(fetch = FetchType.LAZY)
    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    @Column(name="paid",nullable =true)
    public Float getPaid() {
        return paid;
    }

    public void setPaid(Float paid) {
        this.paid = paid;
    }

    @Column(name="remain",nullable =true)
    public Float getRemain() {
        return remain;
    }

    public void setRemain(Float remain) {
        this.remain = remain;
    }

    @Temporal(TemporalType.TIME)
    @Column(name="attendenceTimeFrom",nullable =true)
    public Date getAttendenceTimeFrom() {
        return attendenceTimeFrom;
    }

    public void setAttendenceTimeFrom(Date attendenceTimeFrom) {
        this.attendenceTimeFrom = attendenceTimeFrom;
    }

    @Temporal(TemporalType.TIME)
    @Column(name="attendenceTimeTo",nullable =true)
    public Date getAttendenceTimeTo() {
        return attendenceTimeTo;
    }

    public void setAttendenceTimeTo(Date attendenceTimeTo) {
        this.attendenceTimeTo = attendenceTimeTo;
    }
    
    @Column(name="status",nullable =true) 
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name="theOrder",nullable =true)
    public Integer getTheOrder() {
        return theOrder;
    }

    public void setTheOrder(Integer theOrder) {    
        this.theOrder = theOrder;
    }

    @ForeignKey(name="workingTimeId")
    @JoinColumn(name="workingTimeId", nullable=true)
    @ManyToOne(fetch = FetchType.LAZY)
    public WorkingTime getWorkingTime() {
        return workingTime;
    }

    public void setWorkingTime(WorkingTime workingTime) {
        this.workingTime = workingTime;
    }
    
    @Override
    public String toString() {
        return "Reservation{" + "id=" + id + ", reservationDate=" + reservationDate + ", reservationWay=" + reservationWay + ", examineType=" + examineType + ", patient=" + patient + ", paid=" + paid + ", remain=" + remain + ", attendenceTimeFrom=" + attendenceTimeFrom + ", attendenceTimeTo=" + attendenceTimeTo + ", status=" + status + ", theOrder=" + theOrder + '}';
    }

}
