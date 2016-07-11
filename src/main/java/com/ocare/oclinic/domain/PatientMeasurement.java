/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.oclinic.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.ForeignKey;

/**
 *
 * @author khaledeng
 */
@Entity
@Table(name="patient_measurement")
public class PatientMeasurement {
    
    private Integer id; 
    private PatientVisit patientVisit;
    private Measurement measurement;
    private String theValue;

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @ForeignKey(name="visitId")
    @JoinColumn(name="visitId" , nullable=true)
    @ManyToOne(fetch = FetchType.LAZY)
    public PatientVisit getPatientVisit() {
        return patientVisit;
    }

    public void setPatientVisit(PatientVisit patientVisit) {
        this.patientVisit = patientVisit;
    }

    @ForeignKey(name="measurementId")
    @JoinColumn(name="measurementId" , nullable=true)
    @ManyToOne(fetch = FetchType.LAZY)
    public Measurement getMeasurement() {
        return measurement;
    }

    public void setMeasurement(Measurement measurement) {
        this.measurement = measurement;
    }

    @Column(name="theValue",nullable =true)
    public String getTheValue() {
        return theValue;
    }

    public void setTheValue(String theValue) {
        this.theValue = theValue;
    }

    @Override
    public String toString() {
        return "PatientMeasurement{" + "id=" + id + ", patientVisit=" + patientVisit + ", measurement=" + measurement + ", theValue=" + theValue + '}';
    }

    
}
