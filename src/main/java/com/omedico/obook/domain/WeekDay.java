/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.obook.domain;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Where;

/**
 *
 * @author khaledeng
 */
@Entity
@Table(name="week_day")
public class WeekDay {
    
    private Integer id;
    private String dayShort;
    private String dayNameEn;
    private String dayNameAr;
    private boolean offLine;
    private List<WorkingTime> workingTimes; 
    
    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name="dayShort",nullable =true)
    public String getDayShort() {
        return dayShort;
    }

    public void setDayShort(String dayShort) {
        this.dayShort = dayShort;
    }

    @Column(name="dayNameEn",nullable =true)
    public String getDayNameEn() {
        return dayNameEn;
    }

    public void setDayNameEn(String dayNameEn) {
        this.dayNameEn = dayNameEn;
    }

    @Column(name="dayNameAr",nullable =true)
    public String getDayNameAr() {
        return dayNameAr;
    }

    public void setDayNameAr(String dayNameAr) {
        this.dayNameAr = dayNameAr;
    }

    @Column(name="offLine",nullable =true)
    public boolean isOffLine() {
        return offLine;
    }

    public void setOffLine(boolean offLine) {
        this.offLine = offLine;
    }

//    
//    @OneToMany(fetch = FetchType.EAGER,cascade={CascadeType.ALL})
//    @JoinColumn(name = "weekDayId",referencedColumnName="weekDayId")
    @OneToMany( mappedBy = "weekDay", fetch = FetchType.EAGER)
    @Cascade(CascadeType.SAVE_UPDATE)
    @Where(clause = "isDeleted = 0")
    public List<WorkingTime> getWorkingTimes() {    
        return workingTimes;
    }

    public void setWorkingTimes(List<WorkingTime> workingTimes) {
        this.workingTimes = workingTimes;
    }

    @Override
    public String toString() {
        return "WeekDay{" + "id=" + id + ", dayShort=" + dayShort + ", dayNameEn=" + dayNameEn + ", dayNameAr=" + dayNameAr + ", offLine=" + offLine + ", workingTimes=" + workingTimes + '}';
    }
    
}
