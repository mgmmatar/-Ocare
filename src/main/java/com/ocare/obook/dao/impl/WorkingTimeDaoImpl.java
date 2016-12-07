/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.obook.dao.WorkingTimeDao;
import com.ocare.obook.domain.WorkingTime;
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
@Repository("workingTimeDao")
public class WorkingTimeDaoImpl extends GenericDAO<WorkingTime> implements WorkingTimeDao {

    {
        super.setClass(WorkingTime.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<WorkingTime> getWorkingDayTimes(final String dayShortName) {
        return getHibernateTemplate().execute(new HibernateCallback<List<WorkingTime>>() {
            @Override
            public List<WorkingTime> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select w from WorkingTime w where w.weekDay.dayShort  = :dayShortName");
                query.setString("dayShortName", dayShortName);
                return (List<WorkingTime>) query.list();
            }
        });
    }

}
