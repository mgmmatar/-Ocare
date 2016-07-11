/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.omedico.oclinic.dao.PrescriptionTypeDao;
import com.omedico.oclinic.domain.PatientMedication;
import com.omedico.oclinic.domain.PrescriptionType;
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
@Repository("prescriptionTypeDao")
public class PrescriptionTypeDaoImpl extends GenericDAO<PrescriptionType> implements PrescriptionTypeDao{
    
    {
       super.setClass(PrescriptionType.class);
    }

    @Override
    public List<PrescriptionType> getAllPrescriptionTypes() {
        return getHibernateTemplate().execute(new HibernateCallback<List<PrescriptionType>>() {
            @Override
            public List<PrescriptionType> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from PrescriptionType");
                return (List<PrescriptionType>)query.list();
            }
        });
    }
    
    
}
