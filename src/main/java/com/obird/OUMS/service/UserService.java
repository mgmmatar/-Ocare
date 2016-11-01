/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OUMS.service;

import com.obird.OUMS.domain.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetails;

/**
 *
 * @author khaledeng
 */
public interface UserService {
 
    public User save(User user);
    
    public void update(User user);
    
    public void delete(User user);
    
    public User get(Integer userId);
    
    public List<User> getAllUsers();
    
    public User getUserByUserName(String userName);
    
    public UserDetails getLoggedInUser();
    
    public boolean isSuperAdmin();
    
    public boolean isAdmin();
    
    public boolean isReservationUser();
    
    public boolean isEntryUser();
    
    public boolean isInquiryUser();
        
}
