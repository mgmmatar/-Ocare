/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.UMS.service;

import com.ocare.UMS.domain.MyUser;
import com.ocare.UMS.holder.UserHolder;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("myUserService")
public interface MyUserService {
    
    public List<MyUser> getAllAdmins();
    
    public List<MyUser> getAllUsers();
    
    public MyUser getUserById(Integer myUserId);
    
    public void registerOrUpdateUser(UserHolder userHolder);
    
    
}
