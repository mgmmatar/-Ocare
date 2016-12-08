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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.annotations.ForeignKey;

/**
 *
 * @author khaledeng
 */
@Entity
@Table(name="patient_complain")
public class PatientComplain {
    
    private Integer id;
    private PatientVisit patientVisit;
    private Complain complain;
    
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

    @ForeignKey(name="complainId")
    @JoinColumn(name="complainId" , nullable=true)
    @ManyToOne(fetch = FetchType.LAZY)       
    public Complain getComplain() {
        return complain;
    }

    public void setComplain(Complain complain) {
        this.complain = complain;
    }

    @Override
    public String toString() {
        return "PatientComplain{" + "id=" + id + ", patientVisit=" + patientVisit + ", complain=" + complain + '}';
    }
    
}
