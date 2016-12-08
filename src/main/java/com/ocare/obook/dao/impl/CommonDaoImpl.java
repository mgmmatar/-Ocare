/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.obook.dao.CommonDao;
import com.ocare.obook.domain.Common;
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
@Repository("commonDao") 
public class CommonDaoImpl extends GenericDAO<Common> implements CommonDao{
    {
        super.setClass(Common.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Common> getAllCommons() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Common>>() {
            @Override
            public List<Common> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Common");
                return (List<Common>)query.list();
            }
        });
    }
    
    
}
