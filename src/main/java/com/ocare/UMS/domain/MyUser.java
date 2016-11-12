/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.UMS.domain;

import com.obird.OUMS.domain.User;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.hibernate.annotations.ForeignKey;

/**
 *
 * @author khaledeng
 */
@Entity
@Table(name = "user")
@ForeignKey(name = "fk_users_1")
public class MyUser extends User{
    
    private String phoneNumber1;
    private String phoneNumber2;
    private String Address;

    @Column(name = "phoneNumber1", nullable = true)
    public String getPhoneNumber1() {
        return phoneNumber1;
    }

    public void setPhoneNumber1(String phoneNumber1) {
        this.phoneNumber1 = phoneNumber1;
    }

    @Column(name = "phoneNumber2", nullable = true)
    public String getPhoneNumber2() {
        return phoneNumber2;
    }

    public void setPhoneNumber2(String phoneNumber2) {
        this.phoneNumber2 = phoneNumber2;
    }

    @Column(name = "address", nullable = true)
    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    @Override
    public String toString() {
        return super.toString()+ " MyUser {" + "phoneNumber1=" + phoneNumber1 + ", phoneNumber2=" + phoneNumber2 + ", Address=" + Address + '}';
    }
    
}
