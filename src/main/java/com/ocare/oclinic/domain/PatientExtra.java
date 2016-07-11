/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.oclinic.domain;

import com.ocare.obook.domain.Patient;
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
@Table(name="patient_extra")
public class PatientExtra {
    
    private Integer id;
    private ExtraData extraData;
    private String value;
    private Patient patient;

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @ForeignKey(name="extraDataId")
    @JoinColumn(name="extraDataId" , nullable=true)
    @ManyToOne(fetch = FetchType.LAZY) 
    public ExtraData getExtraData() {
        return extraData;
    }

    public void setExtraData(ExtraData extraData) {
        this.extraData = extraData;
    }

    @Column(name="value",nullable =true)
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "patientId", nullable = false ) 
    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    @Override
    public String toString() {
        return "PatientExtra{" + "id=" + id + ", extraData=" + extraData + ", value=" + value + ", patient=" + patient + '}';
    }
    
  
}
