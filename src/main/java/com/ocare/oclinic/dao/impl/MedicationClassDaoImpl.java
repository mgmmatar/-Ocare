/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.oclinic.dao.MedicationClassDao;
import com.ocare.oclinic.domain.MedicationClass;
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
@Repository("medicationClassDao")
public class MedicationClassDaoImpl extends GenericDAO<MedicationClass> implements MedicationClassDao{
    
    {
        super.setClass(MedicationClass.class);
    }

    @Override
    public List<MedicationClass> getAllMedicationClasses() {
        return getHibernateTemplate().execute(new HibernateCallback<List<MedicationClass>>() {
            @Override
            public List<MedicationClass> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from MedicationClass");
                return (List<MedicationClass>)query.list();
            }
        });
    }
    
    
}
