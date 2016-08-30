/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.domain;


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
@Table(name = "insurance_profile")
public class InsuranceProfile {

    private Integer id;
    private ExamineType examineType;
    private Float percentage;
    private InsuranceCompany insurranceCompany;
    
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

//    @ForeignKey(name = "companyId")
//    @JoinColumn(name = "companyId", nullable = true)
//    @ManyToOne(fetch = FetchType.LAZY)
//    public InsuranceCompany getInsuranceCompany() {
//        return insuranceCompany;
//    }
//
//    public void setInsuranceCompany(InsuranceCompany insuranceCompany) {
//        this.insuranceCompany = insuranceCompany;
//    }

    @ForeignKey(name = "examineTypeId")
    @JoinColumn(name = "examineTypeId", nullable = true)
    @ManyToOne(fetch = FetchType.LAZY)
    public ExamineType getExamineType() {
        return examineType;
    }

    public void setExamineType(ExamineType examineType) {
        this.examineType = examineType;
    }

    @Column(name = "percentage", nullable = true)
    public Float getPercentage() {
        return percentage;
    }

    public void setPercentage(Float percentage) {
        this.percentage = percentage;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "companyId", nullable = false )
    public InsuranceCompany getInsurranceCompany() {
        return insurranceCompany;
    }

    public void setInsurranceCompany(InsuranceCompany insurranceCompany) {
        this.insurranceCompany = insurranceCompany;
    }

    

}
