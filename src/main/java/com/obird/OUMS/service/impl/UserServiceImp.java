/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OUMS.service.impl;

import com.obird.OUMS.dao.UserDao;
import com.obird.OUMS.domain.Role;
import com.obird.OUMS.domain.User;
import com.obird.OUMS.service.UserService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
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
        return userDao.getUserByUserName(userName);
    }

    @Override
    @Transactional(readOnly=true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // Getting USer
        System.out.println("User : "+username);
        User user = getUserByUserName(username);
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
    
}
