/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.oclinic.service;

import com.omedico.oclinic.domain.PatientPrescription;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface PatientPrescriptionService {
    
    public PatientPrescription save(PatientPrescription patientPrescription);
    
    public  void update(PatientPrescription patientPrescription);
    
    public void delete(PatientPrescription patientPrescription);
    
    public PatientPrescription get(Integer patientPrescriptionId);
    
    public List<PatientPrescription> getAllPatientPrescriptions();
    
}
