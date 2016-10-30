/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OUMS.dao.imp;

import com.obird.OUMS.dao.RoleDao;
import com.obird.OUMS.domain.Role;
import com.obird.core.GenericDAO;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.stereotype.Repository;


/**
 *
 * @author khaledeng
 */
@Repository("roleDao")
public class RoleDaoImp extends GenericDAO<Role> implements RoleDao{
    
    {
       super.setClass(Role.class);
    }

    @Override
    public List<Role> getAllRoles() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Role>>() {
            @Override
            public List<Role> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Role");
                return query.list();
            }
        });       
    }
    
    
    
}