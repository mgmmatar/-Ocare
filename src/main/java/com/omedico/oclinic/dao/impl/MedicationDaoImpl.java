/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.omedico.oclinic.dao.MedicationDao;
import com.omedico.oclinic.domain.Medication;
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
@Repository("medicationDao")
public class MedicationDaoImpl extends GenericDAO<Medication> implements MedicationDao{
    
    {
       super.setClass(Medication.class);
    }

    @Override
    public List<Medication> getAllMedications() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Medication>>() {
            @Override
            public List<Medication> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Medication");
                return (List<Medication>)query.list();
            }
        });
    }

    @Override
    public List<Medication> getSignedMedications() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Medication>>() {
            @Override
            public List<Medication> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Medication m where m.signed = :signed order by m.name asc");
                query.setBoolean("signed", true);
                return (List<Medication>)query.list();
            }
        });   
    }

    @Override
    public List<Medication> getUnSignedMedications() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Medication>>() {
            @Override
            public List<Medication> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Medication m where m.signed <> :signed order by m.name asc");
                query.setBoolean("signed", true);
                return (List<Medication>)query.list();
            }
        });
    }

    @Override
    public List<Medication> getMedicationWithPattern(final String namePattern) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Medication>>() {
            @Override
            public List<Medication> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Medication m where m.name like :namePattern");
                query.setString("namePattern", "%"+namePattern+"%");
                return (List<Medication>)query.list();
            }
        });     
    }
    
    
    
}
