/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.obook.dao.ReservationWayDao;
import com.ocare.obook.domain.ReservationWay;
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
@Repository("reservationWayDao")
public class ReservationWayDaoImpl extends GenericDAO<ReservationWay> implements ReservationWayDao{
    {
      super.setClass(ReservationWay.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<ReservationWay> getAllReservationWays() {
        return getHibernateTemplate().execute(new HibernateCallback<List<ReservationWay>>() {
            @Override
            public List<ReservationWay> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from ReservationWay where isDeleted=:deleted ");
                query.setBoolean("deleted", false);
                return (List<ReservationWay>)query.list();
            }
        });
    }

    @Override
    public ReservationWay getDefaultReservationWay() {
        return getHibernateTemplate().execute(new HibernateCallback<ReservationWay>() {
            @Override
            public ReservationWay doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from ReservationWay where defaultOne=:default");
                query.setBoolean("default", true);
                return (ReservationWay)query.uniqueResult();
            }
        });
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<ReservationWay> getReservationWaysWithPattern(final String pattern) {
        return getHibernateTemplate().execute(new HibernateCallback<List<ReservationWay>>() {
            @Override
            public List<ReservationWay> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from ReservationWay r where r.isDeleted=:deleted AND (r.nameEn LIKE :nameEn OR r.nameAr LIKE :nameAr)");
                query.setBoolean("deleted", false);
                query.setString("nameAr","%"+pattern+"%");
                query.setString("nameEn","%"+pattern+"%");
                return (List<ReservationWay>)query.list();
            }
        });
    }
    
}
