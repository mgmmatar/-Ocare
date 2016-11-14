/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.UMS.dao.imp;

import com.obird.core.GenericDAO;
import com.ocare.UMS.dao.MyUserDao;
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
@Repository("myUserDao")
public class MyUserDaoImp extends GenericDAO<MyUser> implements MyUserDao{
    
    {
        super.setClass(MyUser.class);
    }

    @Override
    public List<MyUser> getAllUsers() {
        return getHibernateTemplate().execute(new HibernateCallback<List<MyUser>>() {
            @Override
            public List<MyUser> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select u from MyUser u inner join u.roles r where u.deleted =:deleted AND r.name <> :superAdminRole AND r.name <> :adminRole");
                query.setBoolean("deleted", false);
                query.setString("superAdminRole","SUPER_ADMIN");
                query.setString("adminRole","ADMIN");
                List<MyUser> users= query.list();
                //return result 
                return users;
            }
        });
    }

    @Override
    public List<MyUser> getAllAdmins() {
        return getHibernateTemplate().execute(new HibernateCallback<List<MyUser>>() {
            @Override
            public List<MyUser> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select u from MyUser u inner join u.roles r where u.deleted =:deleted AND r.name = :roleName");
                query.setBoolean("deleted", false);
                query.setString("roleName","ADMIN");
                List<MyUser> users= query.list();
                //return result 
                return users;
            }
        });
    }


    
}