/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.service.imp;

import com.ocare.obook.dao.ReservationWayDao;
import com.ocare.obook.domain.ReservationWay;
import com.ocare.obook.service.ReservationWayService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author khaledeng
 */
@Service("reservationWayService")
public class ReservationWayServiceImpl implements ReservationWayService {

    @Autowired
    private ReservationWayDao reservationWayDao;

    @Override
    public List<ReservationWay> getAllReservationWays() {
        return reservationWayDao.getAllReservationWays();
    }

    @Override
    @Transactional
    public ReservationWay save(ReservationWay reservationWay) {
        return reservationWayDao.save(reservationWay);
    }

    @Override
    public void update(ReservationWay reservationWay) {
        reservationWayDao.update(reservationWay);
    }

    @Override
    public void delete(ReservationWay reservationWay) {
        reservationWay.setIsDeleted(true);
        reservationWayDao.update(reservationWay);
    }

    @Override
    public ReservationWay get(Integer reservationWayId) {
        return reservationWayDao.get(reservationWayId);
    }

    @Override
    public ReservationWay getDefaultReservationWay() {
        return reservationWayDao.getDefaultReservationWay();
    }
    
    @Override
    @Transactional
    public void assignDefaultReservationWay(Integer reservationWayId) {
         /// remove Default from Old 
        ReservationWay  reservationWay= getDefaultReservationWay();
        if(reservationWay !=null){
            reservationWay.setDefaultOne(false);
            // save Changes 
            save(reservationWay);
        }//end if
        //// Getting the New 
        ReservationWay  newDefaultReservationWay=get(reservationWayId);
        newDefaultReservationWay.setDefaultOne(true);
        save(newDefaultReservationWay);
    }

    @Override
    public List<ReservationWay> getReservationWaysWithPattern(String pattern) {
        return reservationWayDao.getReservationWaysWithPattern(pattern);
    }

}
