/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.oclinic.dao.ComplainDao;
import com.ocare.oclinic.domain.Complain;
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
@Repository("complainDao")
public class ComplainDaoImpl extends GenericDAO<Complain> implements ComplainDao{
    
    {
        super.setClass(Complain.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Complain> getAllComplains() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Complain>>() {
            @Override
            public List<Complain> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Complain");
                return (List<Complain>)query.list();
            }
        });        
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Complain> getSignedComplains() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Complain>>() {
            @Override
            public List<Complain> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Complain c where c.signed = :signed order by c.name asc");
                query.setBoolean("signed", true);
                return (List<Complain>)query.list();
            }
        });       
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Complain> getUnSignedComplains() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Complain>>() {
            @Override
            public List<Complain> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Complain c where c.signed <> :signed order by c.name asc");
                query.setBoolean("signed", true);
                return (List<Complain>)query.list();
            }
        });         
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Complain> getComplainWithPattern(final String namePattern) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Complain>>() {
            @Override
            public List<Complain> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Complain c where c.name like :namePattern");
                query.setString("namePattern", "%"+namePattern+"%");
                return (List<Complain>)query.list();
            }
        });           
    }
    
}
