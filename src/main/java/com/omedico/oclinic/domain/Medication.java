/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.oclinic.domain;

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
@Table(name="medication")
public class Medication {
    
    private Integer id;
    private String name;
    private MedicationClass medicationClass;
    private boolean signed;
    
    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

     @Column(name="name",nullable =true)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ForeignKey(name = "medicationClassId")
    @JoinColumn(name = "medicationClassId", nullable = true)
    @ManyToOne(fetch = FetchType.LAZY)    
    public MedicationClass getMedicationClass() {
        return medicationClass;
    }

    public void setMedicationClass(MedicationClass medicationClass) {
        this.medicationClass = medicationClass;
    }

    @Column(name="signed",nullable =true)
    public boolean isSigned() {
        return signed;
    }

    public void setSigned(boolean signed) {
        this.signed = signed;
    }

    @Override
    public String toString() {
        return "Medication{" + "id=" + id + ", name=" + name + ", medicationClass=" + medicationClass + ", signed=" + signed + '}';
    }
    
    
    
    
}
