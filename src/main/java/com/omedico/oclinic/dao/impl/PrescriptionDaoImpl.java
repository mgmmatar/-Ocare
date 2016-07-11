/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.omedico.oclinic.dao.PrescriptionDao;
import com.omedico.oclinic.domain.Prescription;
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
@Repository("prescriptionDao")
public class PrescriptionDaoImpl extends GenericDAO<Prescription> implements PrescriptionDao{
    
    {
       super.setClass(Prescription.class);
    }

    @Override
    public List<Prescription> getAllPrescriptions() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Prescription>>() {
            @Override
            public List<Prescription> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Prescription");
                return (List<Prescription>)query.list();
            }
        });
    }

    @Override
    public List<Prescription> getSignedPrescriptions() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Prescription>>() {
            @Override
            public List<Prescription> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Prescription p where p.signed = :signed order by p.name asc");
                query.setBoolean("signed", true);
                return (List<Prescription>)query.list();
            }
        });
    }

    @Override
    public List<Prescription> getUnSignedPrescriptions() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Prescription>>() {
            @Override
            public List<Prescription> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Prescription p where p.signed <> :signed order by p.name asc");
                query.setBoolean("signed", true);
                return (List<Prescription>)query.list();
            }
        });
    }

    @Override
    public List<Prescription> getPrescriptionWithPattern(final String namePattern) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Prescription>>() {
            @Override
            public List<Prescription> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Prescription p where p.name like :namePattern");
                query.setString("namePattern", "%"+namePattern+"%");
                return (List<Prescription>)query.list();
            }
        });
    }
    
    
    
}
