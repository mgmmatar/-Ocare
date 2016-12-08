/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.oclinic.dao.PatientComplainDao;
import com.ocare.oclinic.domain.PatientComplain;
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
@Repository("patientComplainDao")
public class PatientComplainDaoImpl extends GenericDAO<PatientComplain> implements PatientComplainDao{
   
    {
         super.setClass(PatientComplain.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<PatientComplain> getAllPatientComplains() {
        return getHibernateTemplate().execute(new HibernateCallback<List<PatientComplain>>() {
            @Override
            public List<PatientComplain> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from PatientComplain");
                return (List<PatientComplain>)query.list();
            }
        });
    }
    
        
}
