/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OUMS.service.impl;

import com.obird.OUMS.dao.UserDao;
import com.obird.OUMS.domain.Role;
import com.obird.OUMS.domain.User;
import com.obird.OUMS.enums.UserType;
import com.obird.OUMS.service.UserService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author khaledeng
 */
@Service("userDetailsService")
public class UserServiceImp implements UserService , UserDetailsService{
    
    @Autowired
    @Qualifier("userDao")
    private UserDao userDao;

    @Override
    public User save(User user) {
        return userDao.save(user);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public void delete(User user) {
        userDao.delete(user);
    }

    @Override
    public User get(Integer userId) {
        return userDao.get(userId);
    }

    @Override
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    @Override
    public User getUserByUserName(String userName) {
        System.out.println(">>>>> HERE");
        return userDao.getUserByUserName(userName);
    }

    @Override
    @Transactional(readOnly=true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // Getting USer
        System.out.println(">>>>> User : "+username);
        User user = getUserByUserName(username);
                System.out.println("Password : "+user.getAuth().getPassword());   
		System.out.println("User : "+user.toString());
		if(user==null){
			System.out.println("User not found");
			throw new UsernameNotFoundException("Username not found");
		}
               	return new org.springframework.security.core.userdetails.User(user.getAuth().getUserName(), user.getAuth().getPassword(), 
				 user.isActive(), true, true, true, getGrantedAuthorities(user));
    }//end loadUserByUserName
    
    
    private List<GrantedAuthority> getGrantedAuthorities(User user){
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
                // Assign the Granted Rules for Authorization
                for(Role role : user.getRoles()){
			System.out.println("Role : "+role.toString());
			authorities.add(new SimpleGrantedAuthority("ROLE_"+role.getName()));
		}
		System.out.print("authorities :"+authorities);
		return authorities;
    }

    @Override
    public UserDetails getLoggedInUser() {
	// Init the UserDetails Object 
        UserDetails userDetails = null;
        // Getting the UserDetails from SpringSecurity Context
	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        // Check the Principal User on the System
		if (principal instanceof UserDetails) {
			userDetails = ((UserDetails)principal);
		} 
                // return result 
		return userDetails;
	}//end getLoggedInUser

    @Override
        public boolean isSuperAdmin() {
        // Checking the User Role 
            boolean isSuperAdmin=false;
            System.out.println(">>>>>>>>>>>>> IsAdmin");
        // Getting Logged In User 
        UserDetails userDetails=getLoggedInUser();
        /// Check in Granted Authorities 
        for(GrantedAuthority authority:userDetails.getAuthorities()){
             if(authority.getAuthority().equalsIgnoreCase(UserType.SUPER_ADMIN)){
                 System.out.println(">>>>>>>>>>>>> IsAdmin");
                 isSuperAdmin=true;
                 break;
             }//end 
        }//end For Each
        // return result 
        return isSuperAdmin;
    }

    @Override
    public boolean isAdmin() {
        // Checking the User Role 
            boolean isAdmin=false;
        // Getting Logged In User 
        UserDetails userDetails=getLoggedInUser();
        /// Check in Granted Authorities 
        for(GrantedAuthority authority:userDetails.getAuthorities()){
             if(authority.getAuthority().equalsIgnoreCase(UserType.ADMIN)){
                 isAdmin=true;
                 break;
             }//end if condition 
        }//end For Each
        // return result 
        return isAdmin;
    }//end isAdminUser

    @Override
    public boolean isReservationUser() {
            // Checking the User Role 
            boolean isReservationUser=false;
        // Getting Logged In User 
        UserDetails userDetails=getLoggedInUser();
        /// Check in Granted Authorities 
        for(GrantedAuthority authority:userDetails.getAuthorities()){
             if(authority.getAuthority().equalsIgnoreCase(UserType.RESERVATION_USER)){
                 isReservationUser=true;
                 break;
             }//end if condition 
        }//end For Each
        // return result 
        return isReservationUser;
    }

    @Override
    public boolean isEntryUser() {
        // Checking the User Role 
            boolean isEntryUser=false;
        // Getting Logged In User 
        UserDetails userDetails=getLoggedInUser();
        /// Check in Granted Authorities 
        for(GrantedAuthority authority:userDetails.getAuthorities()){
             if(authority.getAuthority().equalsIgnoreCase(UserType.ENTRY_USER)){
                 isEntryUser=true;
                 break;
             }//end if condition 
        }//end For Each
        // return result 
        return isEntryUser;
    }

    @Override
    public boolean isInquiryUser() {
        // Checking the User Role 
            boolean isInquiryUser=false;
        // Getting Logged In User 
        UserDetails userDetails=getLoggedInUser();
        /// Check in Granted Authorities 
        for(GrantedAuthority authority:userDetails.getAuthorities()){
             if(authority.getAuthority().equalsIgnoreCase(UserType.INQUIRY_USER)){
                 isInquiryUser=true;
                 break;
             }//end if condition 
        }//end For Each
        // return result 
        return isInquiryUser;
    }
    
}
