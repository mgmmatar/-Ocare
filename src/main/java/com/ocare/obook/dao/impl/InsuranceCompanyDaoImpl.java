/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.obook.dao.InsuranceCompanyDao;
import com.ocare.obook.domain.InsuranceCompany;
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
@Repository("insuranceCompanyDao")
public class InsuranceCompanyDaoImpl extends GenericDAO<InsuranceCompany> implements InsuranceCompanyDao{

   {
        super.setClass(InsuranceCompany.class);
    }

    @Override
    public List<InsuranceCompany> getAllInsuranceCompanys() {
        return getHibernateTemplate().execute(new HibernateCallback<List<InsuranceCompany>>() {
            @Override
            public List<InsuranceCompany> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from InsuranceCompany where isDeleted = :deleted");
                query.setBoolean("deleted", false);
                return (List<InsuranceCompany>)query.list();
            }
        });
    }  
   
}
