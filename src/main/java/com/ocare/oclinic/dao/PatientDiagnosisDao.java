/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.dao;

import com.ocare.oclinic.domain.PatientDiagnosis;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface PatientDiagnosisDao {
  
    public PatientDiagnosis save(PatientDiagnosis patientDiagnosis);
    
    public  void update(PatientDiagnosis patientDiagnosis);
    
    public void delete(PatientDiagnosis patientDiagnosis);
    
    public PatientDiagnosis get(Integer patientDiagnosisId);
    
    public List<PatientDiagnosis> getAllPatientDiagnosiss();   
    
}
