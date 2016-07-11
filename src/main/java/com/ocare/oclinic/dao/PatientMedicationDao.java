/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.dao;

import com.ocare.oclinic.domain.PatientMedication;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface PatientMedicationDao {
    
    public PatientMedication save(PatientMedication patientMedication);
    
    public  void update(PatientMedication patientMedication);
    
    public void delete(PatientMedication patientMedication);
    
    public PatientMedication get(Integer patientMedicationId);
    
    public List<PatientMedication> getAllPatientMedications();
    
}
