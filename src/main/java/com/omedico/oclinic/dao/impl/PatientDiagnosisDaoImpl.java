/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.omedico.oclinic.dao.PatientDiagnosisDao;
import com.omedico.oclinic.domain.PatientDiagnosis;
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
@Repository("patientDiagnosisDao")
public class PatientDiagnosisDaoImpl extends GenericDAO<PatientDiagnosis> implements PatientDiagnosisDao{
    
    {
         super.setClass(PatientDiagnosis.class);
    }

    @Override
    public List<PatientDiagnosis> getAllPatientDiagnosiss() {
        return getHibernateTemplate().execute(new HibernateCallback<List<PatientDiagnosis>>() {
            @Override
            public List<PatientDiagnosis> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from PatientDiagnosis");
                return (List<PatientDiagnosis>)query.list();
            }
        });
    }
    
    
    
}
