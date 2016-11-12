/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OUMS.dao;

import com.obird.OUMS.domain.Role;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface RoleDao {
    
    public Role save(Role role);
    
    public void update(Role role);
    
    public void delete(Role role);
    
    public Role get(Integer roleId);
    
    public Role getRoleByName(String roleName);
    
    public List<Role> getAllRoles();
    
    public List<Role> getAllNonAdminRoles();
    
}
