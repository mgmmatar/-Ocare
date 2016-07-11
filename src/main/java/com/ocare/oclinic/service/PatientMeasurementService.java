/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.oclinic.service;

import com.ocare.oclinic.domain.PatientMeasurement;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface PatientMeasurementService {
 
    public PatientMeasurement save(PatientMeasurement patientMeasurement);
    
    public  void update(PatientMeasurement patientMeasurement);
    
    public void delete(PatientMeasurement patientMeasurement);
    
    public PatientMeasurement get(Integer patientMeasurementId);
    
    public List<PatientMeasurement> getAllPatientMeasurements();
  
}
