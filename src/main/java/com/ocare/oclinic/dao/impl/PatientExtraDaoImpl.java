/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.oclinic.dao.PatientExtraDao;
import com.ocare.oclinic.domain.PatientExtra;
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
@Repository("patientExtraDao")
public class PatientExtraDaoImpl extends GenericDAO<PatientExtra> implements PatientExtraDao{
    
    {
        super.setClass(PatientExtra.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<PatientExtra> getAllPatientExtra() {
        return getHibernateTemplate().execute(new HibernateCallback<List<PatientExtra>>() {
            @Override
            public List<PatientExtra> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from PatientExtra");
                return (List<PatientExtra>)query.list();
            }
        }); 
    }
 
    
    
}
