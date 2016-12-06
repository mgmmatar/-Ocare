/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.holder;

/**
 *
 * @author khaledeng
 */
public class PatientHolder {
    
    private Integer id;
    private String fName;
    private String midName;
    private String lName;
    private String address;
    private String phoneNumber1; 
    private String phoneNumber2;
    private String email; 
    private String age;
    private String birthDate;
    private Integer insuranceCompany;
    private String gender;
    private String birthMonth;
    private String birthDay;
    private String birthYear;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getFName() {
        return fName;
    }

    public void setFName(String fName) {
        this.fName = fName;
    }

    public String getMidName() {
        return midName;
    }

    public void setMidName(String midName) {
        this.midName = midName;
    }

    public String getLName() {
        return lName;
    }

    public void setLName(String lName) {
        this.lName = lName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber1() {
        return phoneNumber1;
    }

    public void setPhoneNumber1(String phoneNumber1) {
        this.phoneNumber1 = phoneNumber1;
    }

    public String getPhoneNumber2() {
        return phoneNumber2;
    }

    public void setPhoneNumber2(String phoneNumber2) {
        this.phoneNumber2 = phoneNumber2;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public Integer getInsuranceCompany() {
        return insuranceCompany;
    }

    public void setInsuranceCompany(Integer insuranceCompany) {
        this.insuranceCompany = insuranceCompany;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirthMonth() {
        return birthMonth;
    }

    public void setBirthMonth(String birthMonth) {
        this.birthMonth = birthMonth;
    }

    public String getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    public String getBirthYear() {
        return birthYear;
    }

    public void setBirthYear(String birthYear) {
        this.birthYear = birthYear;
    }

    
    @Override
    public String toString() {
        return "PatientHolder{" + "id=" + id + ", fName=" + fName + ", midName=" + midName + ", lName=" + lName + ", address=" + address + ", phoneNumber1=" + phoneNumber1 + ", phoneNumber2=" + phoneNumber2 + ", email=" + email + ", age=" + age + ", birthDate=" + birthDate + ", insuranceCompany=" + insuranceCompany + ", gender=" + gender + ", birthMonth=" + birthMonth + ", birthDay=" + birthDay + ", birthyear=" + birthYear + '}';
    }

    
}
