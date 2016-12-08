/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.service;

import com.ocare.oclinic.domain.PatientComplain;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface PatientComplainService {
    
    public PatientComplain save(PatientComplain patientComplain);
    
    public  void update(PatientComplain patientComplain);
    
    public void delete(PatientComplain patientComplain);
    
    public PatientComplain get(Integer patientComplainId);
    
    public List<PatientComplain> getAllPatientComplains();
    
}
