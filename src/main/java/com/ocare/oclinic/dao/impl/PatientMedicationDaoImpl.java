/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.oclinic.dao.PatientMedicationDao;
import com.ocare.oclinic.domain.PatientMedication;
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
@Repository("patientMedicationDao")
public class PatientMedicationDaoImpl extends GenericDAO<PatientMedication> implements PatientMedicationDao{
    
    {
         super.setClass(PatientMedication.class);
    }

    @Override
    public List<PatientMedication> getAllPatientMedications() {
        return getHibernateTemplate().execute(new HibernateCallback<List<PatientMedication>>() {
            @Override
            public List<PatientMedication> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from PatientMedication");
                return (List<PatientMedication>)query.list();
            }
        });
    }
    
    
    
}
