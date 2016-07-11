/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.report;

/**
 *
 * @author khaledeng
 */
public class ReportField {

    private String name;
    private String viewName;
    private Integer size;
    private Class fieldClass;

    public ReportField(String name, String viewName, Integer size, Class fieldClass) {
        this.name = name;
        this.viewName = viewName;
        this.size = size;
        this.fieldClass = fieldClass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getViewName() {
        return viewName;
    }

    public void setViewName(String viewName) {
        this.viewName = viewName;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public Class getFieldClass() {
        return fieldClass;
    }

    public void setFieldClass(Class fieldClass) {
        this.fieldClass = fieldClass;
    }

    @Override
    public String toString() {
        return "ReportField{" + "name=" + name + ", viewName=" + viewName + ", size=" + size + ", fieldClass=" + fieldClass + '}';
    }
    
    
}
