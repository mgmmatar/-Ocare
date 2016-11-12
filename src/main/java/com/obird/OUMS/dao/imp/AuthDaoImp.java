/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OUMS.dao.imp;

import com.obird.OUMS.dao.AuthDao;
import com.obird.OUMS.domain.Auth;
import com.obird.core.GenericDAO;
import org.springframework.stereotype.Repository;

/**
 *
 * @author khaledeng
 */
@Repository("authDao")
public class AuthDaoImp extends GenericDAO<Auth> implements AuthDao{
    
    {
        super.setClass(Auth.class);
    }
    
}
