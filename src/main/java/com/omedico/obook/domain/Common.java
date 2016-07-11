/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.obook.domain;

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
@Table(name="common")
public class Common {
    
    private Integer id;
    private String defaultSearchBy;

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name="defaultSearchBy",nullable =true)
    public String getDefaultSearchBy() {
        return defaultSearchBy;
    }

    public void setDefaultSearchBy(String defaultSearchBy) {
        this.defaultSearchBy = defaultSearchBy;
    }

    @Override
    public String toString() {
        return "Common{" + "id=" + id + ", defaultSearchBy=" + defaultSearchBy + '}';
    }
    
}
