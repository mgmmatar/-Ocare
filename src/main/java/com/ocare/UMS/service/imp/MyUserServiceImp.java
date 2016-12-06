/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.UMS.service.imp;

import com.obird.OUMS.dao.AuthDao;
import com.obird.OUMS.domain.Auth;
import com.obird.OUMS.domain.Role;
import com.obird.OUMS.service.RoleService;
import com.obird.OUMS.service.UserService;
import com.ocare.UMS.dao.MyUserDao;
import com.ocare.UMS.domain.MyUser;
import com.ocare.UMS.holder.UserHolder;
import com.ocare.UMS.service.MyUserService;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author khaledeng
 */
@Service("myUserService")
public class MyUserServiceImp implements MyUserService{
    
    @Autowired
    private MyUserDao myUserDao;

    @Autowired
    private AuthDao authDao;
    
    @Autowired
    private RoleService roleService;
    
    
    @Autowired
    private UserService userService;
    
    @Override
    public List<MyUser> getAllAdmins() {
        return myUserDao.getAllAdmins();
    }

    @Override
    public List<MyUser> getAllUsers() {
        return myUserDao.getAllUsers();
    }

    @Override
    public MyUser getUserById(Integer myUserId) {
        return myUserDao.get(myUserId);
    }

    @Override
    @Transactional
    public void registerOrUpdateUser(UserHolder userHolder) {
        // Checking if the User is existion or No 
        if(userHolder.getUserId()==null){
                    // New User Registeration
                    MyUser myUser=new MyUser();
                    myUser=userHolderTrnasformer(userHolder, myUser);
                    // Filling Object 
                    myUser.setActive(true);
                    myUser.setCreated(new Date());
                    //// Setting Login Information 
                    Auth auth=new Auth(); 
                    auth.setUserName(userHolder.getUserName());
                    auth.setPassword(userHolder.getPassword());
                    /// saving 
                    auth=authDao.save(auth);
                    // setting Auth 
                    myUser.setAuth(auth);
                    /// Save Data 
                    myUserDao.save(myUser);
        }
        else{
            /// Getting MyUser 
            MyUser myUser=getUserById(userHolder.getUserId());
            if(myUser!=null){
                 myUser=userHolderTrnasformer(userHolder, myUser);
                 myUser.setUpdated(new Date());
                 /// Update Auth 
                 Auth auth=myUser.getAuth();
                 auth.setUserName(userHolder.getUserName());
                 authDao.update(auth);
                 /// Update Data
                 myUserDao.update(myUser);
            }//end if Condition 
        
        }//end else 
        
        
    }//end register
    
    private MyUser userHolderTrnasformer(UserHolder userHolder,MyUser myUser){
        // Transform Data form UserHolder 
        // Setting Basic Data 
        myUser.setFirstName(userHolder.getFirstName());
        myUser.setMiddleName(userHolder.getMiddleName());
        myUser.setLastName(userHolder.getLastName());
        myUser.setAddress(userHolder.getAddress());
        myUser.setEmail(userHolder.getEmail());
        myUser.setPhoneNumber1(userHolder.getPhoneNumber1());
        myUser.setPhoneNumber2(userHolder.getPhoneNumber2());
        /// Setting Roles 
         Role role=roleService.getRoleByName(userHolder.getRoleName());
         Set<Role> roles=new HashSet<Role>();
         roles.add(role);
         /// Setting Roles 
         myUser.setRoles(roles);
        // return result 
        return myUser;
    }//end myUser

    @Override
    public boolean activateOrDeactivateUser(Integer myUserId, boolean status) {
        // Init Boolean 
        boolean isActivated=false;
        // Getting User
        MyUser myUser=getUserById(myUserId);
        if(myUser!=null){
            // Assing User Status 
            myUser.setActive(status);
            myUserDao.update(myUser);
            /// Assign the Service as Done
            isActivated=true;
        }//end if condition
        // return result 
        return isActivated;
    }

    @Override
    public boolean deleteUser(Integer myUserId) {
       // Init Boolean 
        boolean isDeleted=false;
        // Getting User
        MyUser myUser=getUserById(myUserId);
        if(myUser!=null){
            // Assing User Status 
            myUser.setDeleted(true);
            myUserDao.update(myUser);
            /// Assign the Service as Done
            isDeleted=true;
        }//end if condition
        // return result 
        return isDeleted;
    }

    @Override
    public List<MyUser> getAdminsWithPattern(String pattern) {
        return myUserDao.getAdminsWithPattern(pattern);
    }

    @Override
    public List<MyUser> getUsersWithPattern(String pattern) {
        return myUserDao.getUsersWithPattern(pattern);
    }

    @Override
    public MyUser getLoggedInUserObject() {
        // Getting Current LoggedIn User
        UserDetails userDetails=userService.getLoggedInUser();
        return myUserDao.getByUserName(userDetails.getUsername());
    }
    
}
