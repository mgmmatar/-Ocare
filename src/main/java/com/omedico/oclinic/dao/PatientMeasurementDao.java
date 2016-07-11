/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.oclinic.dao;

import com.omedico.oclinic.domain.PatientMeasurement;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface PatientMeasurementDao {
  
    public PatientMeasurement save(PatientMeasurement patientMeasurement);
    
    public  void update(PatientMeasurement patientMeasurement);
    
    public void delete(PatientMeasurement patientMeasurement);
    
    public PatientMeasurement get(Integer patientMeasurementId);
    
    public List<PatientMeasurement> getAllPatientMeasurements();
    
}
