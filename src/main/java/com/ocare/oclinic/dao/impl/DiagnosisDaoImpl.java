/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.oclinic.dao.DiagnosisDao;
import com.ocare.oclinic.domain.Diagnosis;
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
@Repository("diagnosisDao")
public class DiagnosisDaoImpl extends GenericDAO<Diagnosis> implements DiagnosisDao{
    {
       super.setClass(Diagnosis.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Diagnosis> getAllDiagnosises() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Diagnosis>>() {
            @Override
            public List<Diagnosis> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Diagnosis");
                return (List<Diagnosis>)query.list();
            }
        });
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Diagnosis> getSignedDiagnisises() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Diagnosis>>() {
            @Override
            public List<Diagnosis> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Diagnosis d where d.signed = :signed order by d.name asc");
                query.setBoolean("signed", true);
                return (List<Diagnosis>)query.list();
            }
        });
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Diagnosis> getUnSignedDiagnisises() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Diagnosis>>() {
            @Override
            public List<Diagnosis> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Diagnosis d where d.signed <> :signed order by d.name asc");
                query.setBoolean("signed", true);
                return (List<Diagnosis>)query.list();
            }
        });    
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Diagnosis> getDiagnosisWithPattern(final String namePattern) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Diagnosis>>() {
            @Override
            public List<Diagnosis> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Diagnosis d where d.name like :namePattern");
                query.setString("namePattern", "%"+namePattern+"%");
                return (List<Diagnosis>)query.list();
            }
        });     
    }
}
