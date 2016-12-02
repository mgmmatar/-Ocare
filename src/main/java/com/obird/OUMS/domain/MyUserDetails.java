/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OUMS.domain;
import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

/**
 *
 * @author khaledeng
 */
public class MyUserDetails extends User{
    
    private static final long serialVersionUID = 1L;
    
    private final Object id;
    private final String fullName;
    private final String roleName;
    
    public MyUserDetails(String username, String password, boolean enabled, boolean accountNonExpired,
                      boolean credentialsNonExpired, boolean accountNonLocked,
                      Collection<GrantedAuthority> authorities, Object id, String fullName,String roleName) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired,
                accountNonLocked, authorities);
 
        // Initialize all the custom attributes here like the following.
        this.id = id;
        this.fullName = fullName;
        this.roleName=roleName;
    }
    
    public Object getId() {
        return id;
    }

    public String getFullName() {
        return fullName;
    }

    public String getRoleName() {
        return roleName;
    }
    
    
}
