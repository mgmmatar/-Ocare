/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.obook.dao.ReservationDao;
import com.ocare.obook.domain.Reservation;
import com.ocare.obook.holder.ReportReservationStatus;
import com.ocare.obook.holder.StatisticReportModule;
import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.stereotype.Repository;

/**
 *
 * @author khaledeng
 */
@Repository("reservationDao")
public class ReservationDaoImpl extends GenericDAO<Reservation> implements ReservationDao{
    {
        super.setClass(Reservation.class);
    }    

    @SuppressWarnings("unchecked")
    @Override
    public List<Reservation> getAllReservations() {
           return getHibernateTemplate().execute(new HibernateCallback<List<Reservation>>() {
            @Override
            public List<Reservation> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Reservation ");
                return (List<Reservation>)query.list();
            }
        });
    }

    @SuppressWarnings("unchecked")
    @Override
    public Reservation getLastReservation(final Date day) {
        return getHibernateTemplate().execute(new HibernateCallback<Reservation>() {
            @Override
            public Reservation doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select r from Reservation r where r.reservationDate = :day order by attendenceTime desc");
                query.setDate("day", day);
                query.setMaxResults(1);
                return (Reservation)query.uniqueResult();
            }
        });        
    }

    @Override
    public Reservation getLastReservationwithPeriod(Date day, Date start, Date end) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Reservation> getReservationsForShift(final Date day,final Integer shift) {
         return getHibernateTemplate().execute(new HibernateCallback<List<Reservation>>() {
            @Override
            public List<Reservation> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select r from Reservation r inner join r.workingTime wt where r.reservationDate = :day and wt.id= :shift and r.status= :status order by attendenceTimeTo asc");
                query.setDate("day", day);
                query.setString("status", "WAITING");
                query.setInteger("shift", shift);
                return (List<Reservation>)query.list();
            }
        });
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Reservation> getReservationsForPatient(final Integer patientId) {
          return getHibernateTemplate().execute(new HibernateCallback<List<Reservation>>() {
            @Override
            public List<Reservation> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select r from Reservation r inner join r.patient p where p.id=:patientId order by r.reservationDate desc");
                query.setInteger("patientId", patientId);
                return (List<Reservation>)query.list();
            }
        });
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Reservation> getReservationsForPatientByDates(final Integer patientId,final Date fromDate,final Date toDate) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Reservation>>() {
            @Override
            public List<Reservation> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select r from Reservation r inner join r.patient p where p.id=:patientId and r.reservationDate BETWEEN :fromDate AND :toDate order by r.reservationDate desc");
                query.setInteger("patientId", patientId);
                query.setDate("fromDate", fromDate);
                query.setDate("toDate", toDate);
                return (List<Reservation>)query.list();
            }
        });
    }
    
        
    
    @SuppressWarnings("unchecked")
    @Override
    public List<ReportReservationStatus> getReservationStatus(final Integer patientId) {
            return getHibernateTemplate().execute(new HibernateCallback<List<ReportReservationStatus>>() {
            @Override
            public List<ReportReservationStatus> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select r.status as statusName , count(r.status) as occuranceNumber from Reservation r inner join r.patient p where p.id=:patientId group by r.status");
                query.setInteger("patientId", patientId);
                List<ReportReservationStatus> reportReservationStatuses=query.setResultTransformer(Transformers.aliasToBean(ReportReservationStatus.class)).list();  
                // return reportReservationStatus
                return reportReservationStatuses;
            }
        });
    }

    
    @SuppressWarnings("unchecked")
    @Override
    public List<ReportReservationStatus> getReservationStatusByDates(final Integer patientId,final Date fromDate,final Date toDate) {
                return getHibernateTemplate().execute(new HibernateCallback<List<ReportReservationStatus>>() {
            @Override
            public List<ReportReservationStatus> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select r.status as statusName , count(r.status) as occuranceNumber from Reservation r inner join r.patient p where p.id=:patientId and r.reservationDate BETWEEN :fromDate AND :toDate group by r.status");
                query.setInteger("patientId", patientId);
                query.setDate("fromDate", fromDate);
                query.setDate("toDate", toDate);
                List<ReportReservationStatus> reportReservationStatuses=query.setResultTransformer(Transformers.aliasToBean(ReportReservationStatus.class)).list();  
                // return result List
                return reportReservationStatuses;
            }
        });
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<StatisticReportModule> getTodayReservationReport(final Date today) {
        return getHibernateTemplate().execute(new HibernateCallback<List<StatisticReportModule>>() {
            @Override
            public List<StatisticReportModule> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select ex.nameEn as moduleName ,count(ex.nameEn) as occuranceNumber , sum(r.paid) as moduleSum from Reservation r inner join r.examineType ex where r.status =:status and r.reservationDate = :today group by ex.nameEn");
                query.setString("status", "CONFIRMED");
                query.setDate("today", today);
                List<StatisticReportModule> reportReservationStatuses=query.setResultTransformer(Transformers.aliasToBean(StatisticReportModule.class)).list();  
                // return result List
                return reportReservationStatuses;
            }
        });
     }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<StatisticReportModule> getTodayInsurranceReport(final Date today) {
        return getHibernateTemplate().execute(new HibernateCallback<List<StatisticReportModule>>() {
            @Override
            public List<StatisticReportModule> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select i.nameEn as moduleName ,count(i.nameEn) as occuranceNumber , sum(r.paid) as moduleSum from Reservation r inner join r.patient p inner join p.insuranceCompany i where r.status =:status and r.reservationDate = :today group by i.nameEn");
                query.setString("status", "CONFIRMED");
                query.setDate("today", today);
                List<StatisticReportModule> reportReservationStatuses=query.setResultTransformer(Transformers.aliasToBean(StatisticReportModule.class)).list();  
                // return result List
                return reportReservationStatuses;
            }
        });        
    }
   
    @SuppressWarnings("unchecked")
    @Override
    public List<StatisticReportModule> getReservationReportWithRange(final Date fromDate,final Date toDate) {
        return getHibernateTemplate().execute(new HibernateCallback<List<StatisticReportModule>>() {
            @Override
            public List<StatisticReportModule> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select ex.nameEn as moduleName ,count(ex.nameEn) as occuranceNumber , sum(r.paid) as moduleSum from Reservation r inner join r.examineType ex where r.status =:status and r.reservationDate BETWEEN :fromDate AND :toDate group by ex.nameEn");
                query.setString("status", "CONFIRMED");
                query.setDate("fromDate", fromDate);
                query.setDate("toDate", toDate);
                List<StatisticReportModule> reportReservationStatuses=query.setResultTransformer(Transformers.aliasToBean(StatisticReportModule.class)).list();  
                // return result List
                return reportReservationStatuses;
            }
        });
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<StatisticReportModule> getInsuranceReportWithRange(final Date fromDate,final Date toDate) {
        return getHibernateTemplate().execute(new HibernateCallback<List<StatisticReportModule>>() {
            @Override
            public List<StatisticReportModule> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select i.nameEn as moduleName ,count(i.nameEn) as occuranceNumber , sum(r.paid) as moduleSum from Reservation r inner join r.patient p inner join p.insuranceCompany i where r.status =:status and r.reservationDate BETWEEN :fromDate AND :toDate group by i.nameEn");
                query.setString("status", "CONFIRMED");
                query.setDate("fromDate", fromDate);
                query.setDate("toDate", toDate);
                List<StatisticReportModule> reportReservationStatuses=query.setResultTransformer(Transformers.aliasToBean(StatisticReportModule.class)).list();  
                // return result List
                return reportReservationStatuses;
            }
        });
    }

    @Override
    public List<Reservation> getDoneReservationsForShift(final Date day,final Integer shift) {
           return getHibernateTemplate().execute(new HibernateCallback<List<Reservation>>() {
            @Override
            public List<Reservation> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("select r from Reservation r inner join r.workingTime wt where r.reservationDate = :day and wt.id= :shift and r.status= :status order by attendenceTimeTo asc");
                query.setDate("day", day);
                query.setString("status", "CONFIRMED");
                query.setInteger("shift", shift);
                return (List<Reservation>)query.list();
            }
        });
    }


    
}
