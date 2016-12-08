/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.oclinic.dao.PatientMeasurementDao;
import com.ocare.oclinic.domain.Measurement;
import com.ocare.oclinic.domain.PatientMeasurement;
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
@Repository("patientMeasurementDao")
public class PatientMeasurementDaoImpl extends GenericDAO<PatientMeasurement> implements PatientMeasurementDao{
    
    {
       super.setClass(PatientMeasurement.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<PatientMeasurement> getAllPatientMeasurements() {
        return getHibernateTemplate().execute(new HibernateCallback<List<PatientMeasurement>>() {
            @Override
            public List<PatientMeasurement> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from PatientMeasurement");
                return (List<PatientMeasurement>)query.list();
            }
        });
    }
    
    
}
