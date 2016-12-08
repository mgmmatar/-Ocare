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
@Table(name="diagnosis")
public class Diagnosis {
 
    private Integer id;
    private String name;
    private String description;
    private String level;
    private MedicalSection medicalSection;
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

    @Column(name="description",nullable =true)
    public String getDescription() {
        return description;
    }
 
    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name="level",nullable =true)    
    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    
    @ForeignKey(name = "medicalSectionId")
    @JoinColumn(name = "medicalSectionId", nullable = true)
    @ManyToOne(fetch = FetchType.LAZY)
    public MedicalSection getMedicalSection() {
        return medicalSection;
    }

    public void setMedicalSection(MedicalSection medicalSection) {
        this.medicalSection = medicalSection;
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
        return "Diagnosis{" + "id=" + id + ", name=" + name + ", description=" + description + ", level=" + level + ", medicalSection=" + medicalSection + ", signed=" + signed + '}';
    }

    

}
