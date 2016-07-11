/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.dao;

import com.ocare.obook.domain.Patient;
import com.ocare.obook.holder.FastPatient;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface PatientDao {
    
    public Patient save(Patient patient);
    
    public void update(Patient patient);
    
    public void delete(Patient patient);
    
    public Patient get(Integer patientId);
    
    public List<Patient> getAllPatients();
    
    public Patient getByCode(String code);
    
    public void deletePatient(Patient patient);
    
    public List<FastPatient> getFastPatientList(String patientInfo);
    
    public List<Patient> searchPatient(String patientName,String patientCode,String patientPhone);
    
    public List<Patient> searchForPatient(String patientInfo);
    
}
