/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author khaledeng
 */


@Entity
@Table(name="examine_type")
public class ExamineType {
    
    private Integer id;
    private String nameAr;
    private String nameEn;
    private String description;
    private Float cost;
    private Integer estimatedPeriod;
    private Boolean isDeleted=new Boolean(false);
    private Boolean defaultOne=new Boolean(false);

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name="nameAr",nullable =true)
    public String getNameAr() {
        return nameAr;
    }

    public void setNameAr(String nameAr) {
        this.nameAr = nameAr;
    }

    @Column(name="nameEn",nullable =true)
    public String getNameEn() {
        return nameEn;
    }

    public void setNameEn(String nameEn) {
        this.nameEn = nameEn;
    }

    @Column(name="description",nullable =true)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name="cost",nullable =true)
    public Float getCost() {
        return cost;
    }

    public void setCost(Float cost) {
        this.cost = cost;
    }

    @Column(name="estimatedPeriod",nullable =true)
    public Integer getEstimatedPeriod() {
        return estimatedPeriod;
    }

    public void setEstimatedPeriod(Integer estimatedPeriod) {
        this.estimatedPeriod = estimatedPeriod;
    }

    @Column(name="isDeleted",nullable =false)
    public Boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Column(name="isDefault",nullable =false)
    public Boolean getDefaultOne() {
        return defaultOne;
    }

    public void setDefaultOne(Boolean defaultOne) {
        this.defaultOne = defaultOne;
    }

    @Override
    public String toString() {
        return "ExamineType{" + "id=" + id + ", nameAr=" + nameAr + ", nameEn=" + nameEn + ", description=" + description + ", cost=" + cost + ", estimatedPeriod=" + estimatedPeriod + ", isDeleted=" + isDeleted + ", defaultOne=" + defaultOne + '}';
    }

    
        
}
