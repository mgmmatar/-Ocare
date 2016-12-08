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
@Table(name = "patient_prescription")
public class PatientPrescription {
    
    private Integer id;
    private PatientVisit patientVisit;
    private Prescription prescription;
    
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
    
    @ForeignKey(name="prescriptionId")
    @JoinColumn(name="prescriptionId" , nullable=true)
    @ManyToOne(fetch = FetchType.LAZY) 
    public Prescription getPrescription() {
        return prescription;
    }

    public void setPrescription(Prescription prescription) {
        this.prescription = prescription;
    }

    @Override
    public String toString() {
        return "PatientPrescription{" + "id=" + id + ", patientVisit=" + patientVisit + ", prescription=" + prescription + '}';
    }

    
}
