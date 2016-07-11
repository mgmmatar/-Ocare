/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.oclinic.dao.MedicalSectionDao;
import com.ocare.oclinic.domain.MedicalSection;
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
@Repository("medicalSectionDao")
public class MedicalSectionDaoImpl extends GenericDAO<MedicalSection> implements MedicalSectionDao{
    
    {
      super.setClass(MedicalSection.class);
    }

    @Override
    public List<MedicalSection> getAllMedicalSections() {
        return getHibernateTemplate().execute(new HibernateCallback<List<MedicalSection>>() {
            @Override
            public List<MedicalSection> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from MedicalSection");
                return (List<MedicalSection>)query.list();
            }
        });
    }
    
}
