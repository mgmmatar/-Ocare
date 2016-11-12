/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OUMS.dao.imp;

import com.obird.OUMS.dao.RoleDao;
import com.obird.OUMS.domain.Role;
import com.obird.core.GenericDAO;
import com.ocare.UMS.domain.MyUser;
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

    @Override
    public Role getRoleByName(final String roleName) {
        return getHibernateTemplate().execute(new HibernateCallback<Role>() {
            @Override
            public Role doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select r from Role r where r.name = :roleName");
                query.setString("roleName", roleName);
                return (Role)query.uniqueResult();
            }
        });
    }

    @Override
    public List<Role> getAllNonAdminRoles() {
           return getHibernateTemplate().execute(new HibernateCallback<List<Role>>() {
            @Override
            public List<Role> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select r from Role r where r.name <> :superAdminRole AND r.name <> :adminRole and r.deleted= :deleted");
                query.setBoolean("deleted", false);
                query.setString("superAdminRole","SUPER_ADMIN");
                query.setString("adminRole","ADMIN");
                List<Role> users= query.list();
                //return result 
                return users;
            }
        });
    }
    
    
    
}
