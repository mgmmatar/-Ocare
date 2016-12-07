/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OUMS.dao.imp;

import com.obird.OUMS.dao.UserDao;
import com.obird.OUMS.domain.User;
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
@Repository("userDao")
public class UserDaoImp extends GenericDAO<User> implements UserDao{
    
    {
        super.setClass(User.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> getAllUsers() {
        return getHibernateTemplate().execute(new HibernateCallback<List<User>>() {
            @Override
            public List<User> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from User u where u.deleted =:deleted");
                query.setBoolean("deleted", false);
                return query.list();
            }
        });
    }

    @Override
    public User getUserByUserName(final String userName) {
    
        System.out.println(">>>>> IN DAO");
        return getHibernateTemplate().execute(new HibernateCallback<User>() {
            @Override
            public User doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select u from User u inner join u.auth a where a.userName =:userName");
                query.setString("userName", userName);
                User user=(User) query.uniqueResult();
                System.out.println("%%%%%% "+user.toString());
                return user;
            }
        });
    }
    
    

}
