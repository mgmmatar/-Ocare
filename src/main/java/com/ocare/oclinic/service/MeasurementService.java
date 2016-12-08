/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.oclinic.service;

import com.ocare.oclinic.domain.Measurement;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface MeasurementService {
          
    public Measurement save(Measurement measurement);
    
    public  void update(Measurement measurement);
    
    public void delete(Measurement measurement);
    
    public Measurement get(Integer measurementId);
    
    public List<Measurement> getAllMeasurements();
    
}
