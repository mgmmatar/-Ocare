/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.obook.dao.WeekDayDao;
import com.ocare.obook.domain.WeekDay;
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
@Repository("weekDayDao")
public class WeekDayDaoImpl extends GenericDAO<WeekDay> implements WeekDayDao{
    
    {
      super.setClass(WeekDay.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<WeekDay> getAllWeekDays() {
        return getHibernateTemplate().execute(new HibernateCallback<List<WeekDay>>() {
            @Override
            public List<WeekDay> doInHibernate(Session sn) throws HibernateException {
                //Query query = sn.createQuery("select w from WeekDay w outer join w.workingTimes ww where ww.deleted <> :deleted");
                Query query = sn.createQuery("from WeekDay ");
                //query.setBoolean("deleted", true);  
                return (List<WeekDay>)query.list();
            }
        });
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<WeekDay> getWorkingWeekDays() {
        return getHibernateTemplate().execute(new HibernateCallback<List<WeekDay>>() {
            @Override
            public List<WeekDay> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from WeekDay where offLine <> :offLine");
                query.setBoolean("offLine", true);
                return (List<WeekDay>)query.list();
            }
        });
    }

    @Override
    public WeekDay getWeekDay(final String dayShortName) {
        return getHibernateTemplate().execute(new HibernateCallback<WeekDay>() {
            @Override
            public WeekDay doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from WeekDay where dayShort = :dayShortName");
                query.setString("dayShortName", dayShortName);
                return (WeekDay)query.uniqueResult();
            }
        });
    }
    
    
    
}
