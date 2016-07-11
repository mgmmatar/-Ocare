/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.omedico.oclinic.dao.PatientVisitDao;
import com.omedico.oclinic.domain.PatientVisit;
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
@Repository("patientVisitDao")
public class PatientVisitDaoImpl extends GenericDAO<PatientVisit> implements PatientVisitDao{
    
    {
       super.setClass(PatientVisit.class);
    }

    @Override
    public List<PatientVisit> getAllPatientVisits() {
        return getHibernateTemplate().execute(new HibernateCallback<List<PatientVisit>>() {
            @Override
            public List<PatientVisit> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from PatientVisit");
                return (List<PatientVisit>)query.list();
            }
        });
    }

    @Override
    public PatientVisit getLastVisitForPatient(final Integer patientId) {
        return getHibernateTemplate().execute(new HibernateCallback<PatientVisit>() {
            @Override
            public PatientVisit doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select v from PatientVisit v inner join v.patient p where p.id = :patientId order by v.visitDate desc");
                query.setInteger("patientId", patientId);
                query.setMaxResults(1);
                return (PatientVisit)query.uniqueResult();
            }
        });
    }

    @Override
    public List<PatientVisit> getNofLastVisit(final Integer patientId,final Integer nOfVisits) {
          return getHibernateTemplate().execute(new HibernateCallback<List<PatientVisit>>() {
            @Override
            public List<PatientVisit> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select v from PatientVisit v inner join v.patient p where p.id = :patientId order by v.visitDate desc");
                query.setInteger("patientId", patientId);
                query.setMaxResults(nOfVisits);
                return (List<PatientVisit>)query.list();
            }
        });
    }
    
}
