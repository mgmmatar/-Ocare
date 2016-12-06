/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.UMS.dao;

import com.ocare.UMS.domain.MyUser;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface MyUserDao {
    
    public MyUser save(MyUser myUser);
    
    public void update(MyUser myUser);
    
    public void delete(MyUser myUser);
    
    public MyUser get(Integer myUserId);
    
    public MyUser getByUserName(String userName);
    
    public List<MyUser> getAllUsers();
    
    public List<MyUser> getAllAdmins();
    
    public List<MyUser> getAdminsWithPattern(String pattern);
    
    public List<MyUser> getUsersWithPattern(String pattern);
        
}
