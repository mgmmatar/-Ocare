/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 *
 * @author khaledeng
 */
@Entity
@Table(name="insurance_company")
public class InsuranceCompany  {

    private Integer id;
    private String nameAr;
    private String nameEn;
    private String description;
    private Date joinDate;
    private Boolean isDeleted=new Boolean(false);
    private List<InsuranceProfile> profiles;

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

    @Temporal(TemporalType.DATE)
    @Column(name="joinDate",nullable =true)
    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }
    
    @Column(name="isDeleted",nullable =true)
    public Boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    @OneToMany( mappedBy = "insurranceCompany", fetch = FetchType.EAGER)
    @Cascade(CascadeType.SAVE_UPDATE)
    public List<InsuranceProfile> getProfiles() {
        return profiles;
    }

    public void setProfiles(List<InsuranceProfile> profiles) {
        this.profiles = profiles;
    }

    @Override
    public String toString() {
        String result="InsuranceCompany{" + "id=" + id + ", nameAr=" + nameAr + ", nameEn=" + nameEn + ", description=" + description + ", joinDate=" + joinDate + ", isDeleted=" + isDeleted + ", profiles="; 
                for(InsuranceProfile profile:profiles) {
                    result+=profile.toString();
                }//for 
                result+= "}";
                
        return result;        
    }
    
    
}//end Class InsurrenceCompany
