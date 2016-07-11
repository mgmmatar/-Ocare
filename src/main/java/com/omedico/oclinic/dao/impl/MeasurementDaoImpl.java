/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.oclinic.dao.impl;

import com.obird.core.GenericDAO;
import com.omedico.oclinic.dao.MeasurementDao;
import com.omedico.oclinic.domain.Measurement;
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
@Repository("measurementDao")
public class MeasurementDaoImpl extends GenericDAO<Measurement> implements MeasurementDao{
    
    
    {
       super.setClass(Measurement.class);
    }

    @Override
    public List<Measurement> getAllMeasurements() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Measurement>>() {
            @Override
            public List<Measurement> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Measurement");
                return (List<Measurement>)query.list();
            }
        });
    }

    
    
}//end Class MeasurementDaoImpl