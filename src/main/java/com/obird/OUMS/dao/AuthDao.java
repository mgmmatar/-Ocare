/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OUMS.dao;

import com.obird.OUMS.domain.Auth;

/**
 *
 * @author khaledeng
 */
public interface AuthDao {
        
    public Auth save(Auth auth);
    
    public void update(Auth auth);
    
    public void delete(Auth auth);
    
    public Auth get(Integer authId);
    
    
}
