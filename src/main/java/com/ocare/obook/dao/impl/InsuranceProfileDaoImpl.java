/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.obook.dao.InsuranceProfileDao;
import com.ocare.obook.domain.InsuranceProfile;
import com.ocare.obook.domain.Patient;
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
@Repository("insuranceProfileDao")
public class InsuranceProfileDaoImpl extends GenericDAO<InsuranceProfile> implements InsuranceProfileDao{
    
    {
      super.setClass(InsuranceProfile.class);
    }

    @Override
    public List<InsuranceProfile> getAllInsuranceProfiles() {
        return findAll();
    }

    @Override
    public InsuranceProfile getProfileForCompanyAndExamine(final Integer insurranceCompanyId,final Integer examineTypeId) {
        return getHibernateTemplate().execute(new HibernateCallback<InsuranceProfile>() {
            @Override
            public InsuranceProfile doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select p from InsuranceProfile p inner join p.insurranceCompany c inner join p.examineType e where c.id = :insurranceCompanyId and e.id = :examineTypeId and c.isDeleted = :deleted");
                query.setInteger("insurranceCompanyId", insurranceCompanyId);
                query.setInteger("examineTypeId", examineTypeId);
                query.setBoolean("deleted", false);
                return (InsuranceProfile) query.uniqueResult();
            }
        });
    }
    
    
}
