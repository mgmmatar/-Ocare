/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.obook.dao;

import com.omedico.obook.domain.Reservation;
import com.omedico.obook.holder.ReportReservationStatus;
import com.omedico.obook.holder.StatisticReportModule;
import java.util.Date;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface ReservationDao {
    
    public Reservation save(Reservation reservation);
    
    public  void update(Reservation reservation);
    
    public void delete(Reservation reservation);
    
    public Reservation get(Integer reservationId);
    
    public List<Reservation> getAllReservations();
    
    public Reservation getLastReservation(Date day);
    
    public Reservation getLastReservationwithPeriod(Date day,Date start,Date end);
    
    public List<Reservation> getReservationsForShift(Date day,Integer shift);
    
    public List<Reservation> getReservationsForPatient(Integer patientId);
    
    public List<Reservation> getReservationsForPatientByDates(Integer patientId,Date fromDate,Date toDate);
 
    public List<ReportReservationStatus> getReservationStatus(Integer patientId);
    
    public List<ReportReservationStatus> getReservationStatusByDates(Integer patientId,Date fromDate,Date toDate);
    
    public List<StatisticReportModule> getReservationExamineTypeMoneyStatistic(Date fromDate,Date toDate);
    
    public List<StatisticReportModule> getReservationExamineTypePatientsStatistic(Date fromDate,Date toDate);
 
  }
