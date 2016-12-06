/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.OLog.dao.imp;

import com.obird.OLog.dao.ActionLogDao;
import com.obird.OLog.domain.ActionLog;
import com.obird.core.GenericDAO;
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
@Repository("actionLogDao")
public class ActionLogDaoImp extends GenericDAO<ActionLog> implements ActionLogDao{
    
    {
       super.setClass(ActionLog.class);
    }

    @Override
    public List<ActionLog> getAllActionLogs() {
        return getHibernateTemplate().execute(new HibernateCallback<List<ActionLog>>() {
            @Override
            public List<ActionLog> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select a from ActionLog a order by a.created DESC");
                return query.list();
            }
        });          
    }
    
    @Override
    public List<ActionLog> getActionLogsWithPattern(final String pattern) {
          return getHibernateTemplate().execute(new HibernateCallback<List<ActionLog>>() {
            @Override
            public List<ActionLog> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select a from ActionLog a where a.action LIKE :pattern order by a.created DESC");
                query.setString("pattern","%"+pattern+"%");
                return (List<ActionLog>)query.list();
            }
        });
    }
    
}
