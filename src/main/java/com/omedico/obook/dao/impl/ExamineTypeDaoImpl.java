/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.obook.dao.impl;

import com.obird.core.GenericDAO;
import com.omedico.obook.dao.ExamineTypeDao;
import com.omedico.obook.domain.ExamineType;
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

@Repository("examineTypeDao")   
public class ExamineTypeDaoImpl extends GenericDAO<ExamineType> implements ExamineTypeDao{
   
    {
        super.setClass(ExamineType.class);
    }

    /**
     *
     * @return
     */
    @Override
    public List<ExamineType> getAllExamineTypes() {
        return getHibernateTemplate().execute(new HibernateCallback<List<ExamineType>>() {
            @Override
            public List<ExamineType> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from ExamineType where isDeleted=:deleted ");
                query.setBoolean("deleted", false);
                return (List<ExamineType>)query.list();
            }
        });
    }

    @Override
    public ExamineType getDefaultExamineType() {
        return getHibernateTemplate().execute(new HibernateCallback<ExamineType>() {
            @Override
            public ExamineType doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from ExamineType where defaultOne=:default");
                query.setBoolean("default", true);
                return (ExamineType)query.uniqueResult();
            }
        });
    }
}
