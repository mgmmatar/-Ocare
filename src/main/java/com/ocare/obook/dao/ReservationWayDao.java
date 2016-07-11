/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.dao;

import com.ocare.obook.domain.ReservationWay;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface ReservationWayDao {
     
    public ReservationWay save(ReservationWay reservationWay);
    
    public  void update(ReservationWay reservationWay);
    
    public void delete(ReservationWay reservationWay);
    
    public ReservationWay get(Integer reservationWayId);
    
    public List<ReservationWay> getAllReservationWays();
     
    public ReservationWay getDefaultReservationWay();
    
}
