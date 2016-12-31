/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.UMS.holder;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author khaledeng
 */
public class UserHolder {
    
    private Integer userId;
    private String roleName;
    private String firstName;
    private String middleName;
    private String lastName;
    private String userName;
    private String email;
    private String password;
    private String rePassword;
    private String phoneNumber1;
    private String phoneNumber2;
    private String address;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @NotEmpty(message="FirstName is Required")
    @Size(min=3, max=30,message="FirstName must be between 3 to 30 Character")
    //@Pattern(regexp = "^{A-Za-z}*" , message = "FirstName Accept Letters Only")
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @NotEmpty(message="MiddleName is Required")
    @Size(min=3, max=30,message="MiddleName must be between 3 to 30 Character")
    //@Pattern(regexp = "^{A-Za-z}*" , message = "MiddleName Accept Letters Only")
    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    @NotEmpty(message="LastName is Required")
    @Size(min=3, max=30,message="LastName must be between 3 to 30 Character")
    //@Pattern(regexp = "^{A-Za-z}*" , message = "LastName Accept Letters Only")
    public String getLastName() {
        return lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @NotEmpty(message="UserName is Required")
    @Size(min=3, max=30,message="UserName must be between 3 to 30 Character")
    //@Pattern(regexp = "^{A-Za-z}*" , message = "UserName Accept Letters Only")
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Email(message="Email format error,It must be like example@mail.com")
    public String getEmail() {
        return email;
    }

    
    public void setEmail(String email) {
        this.email = email;
    }

    @NotEmpty(message="Password is Required")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @NotEmpty(message="Retype Password is Required")
    public String getRePassword() {
        return rePassword;
    }

    public void setRePassword(String rePassword) {
        this.rePassword = rePassword;
    }

    //@Pattern(regexp = "{\\d{11}}" , message = "Phone Number must be 11 Number")
    public String getPhoneNumber1() {
        return phoneNumber1;
    }

    public void setPhoneNumber1(String phoneNumber1) {
        this.phoneNumber1 = phoneNumber1;
    }

    //@Pattern(regexp = "{\\d{11}}" , message = "Phone Number must be 11 Number")
    public String getPhoneNumber2() {
        return phoneNumber2;
    }

    public void setPhoneNumber2(String phoneNumber2) {
        this.phoneNumber2 = phoneNumber2;
    }

    @Size(min=3, max=30,message="Address must be between 3 to 100 Character")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return "UserHolder{" + "userId=" + userId + ", roleName=" + roleName + ", firstName=" + firstName + ", middleName=" + middleName + ", lastName=" + lastName + ", userName=" + userName + ", email=" + email + ", password=" + password + ", rePassword=" + rePassword + ", phoneNumber1=" + phoneNumber1 + ", phoneNumber2=" + phoneNumber2 + ", address=" + address + '}';
    }

    
    
    
}
