/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.obook.service;

import com.omedico.obook.domain.ReservationWay;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface ReservationWayService {

    public ReservationWay save(ReservationWay reservationWay);

    public void update(ReservationWay reservationWay);

    public void delete(ReservationWay reservationWay);

    public ReservationWay get(Integer reservationWayId);

    public List<ReservationWay> getAllReservationWays();
    
    public ReservationWay getDefaultReservationWay();
    
    public void assignDefaultReservationWay(Integer reservationWayId);

}
