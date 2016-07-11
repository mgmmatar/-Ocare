/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.oclinic.service;

import com.omedico.oclinic.domain.PatientExtra;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface PatientExtraService {
    
        
    public PatientExtra save(PatientExtra patientExtra);
    
    public  void update(PatientExtra patientExtra);
    
    public void delete(PatientExtra patientExtra);
    
    public PatientExtra get(Integer patientExtraId);
    
    public List<PatientExtra> getAllPatientExtra();    
    
}
