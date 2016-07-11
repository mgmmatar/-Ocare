/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.omedico.oclinic.dao.ExtraDataDao;
import com.omedico.oclinic.domain.ExtraData;
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
@Repository("extraDataDao")
public class ExtraDataDaoImpl extends GenericDAO<ExtraData> implements ExtraDataDao{
   
    {
         super.setClass(ExtraData.class);
    }

    @Override
    public List<ExtraData> getAllExtraData() {
        return getHibernateTemplate().execute(new HibernateCallback<List<ExtraData>>() {
            @Override
            public List<ExtraData> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from ExtraData");
                return (List<ExtraData>)query.list();
            }
        });   
    }


    
}
