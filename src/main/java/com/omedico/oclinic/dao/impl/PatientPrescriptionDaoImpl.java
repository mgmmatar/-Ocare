/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.omedico.oclinic.dao.PatientPrescriptionDao;
import com.omedico.oclinic.domain.PatientPrescription;
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
@Repository("patientPrescriptionDao")
public class PatientPrescriptionDaoImpl extends GenericDAO<PatientPrescription> implements PatientPrescriptionDao{
    
    {
        super.setClass(PatientPrescription.class);
    }

    @Override
    public List<PatientPrescription> getAllPatientPrescriptions() {
        return getHibernateTemplate().execute(new HibernateCallback<List<PatientPrescription>>() {
            @Override
            public List<PatientPrescription> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from PatientPrescription");
                return (List<PatientPrescription>)query.list();
            }
        });
    }
    
}
