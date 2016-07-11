/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.dao;

import com.ocare.oclinic.domain.PatientVisit;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface PatientVisitDao {
    
    public PatientVisit save(PatientVisit patientVisit);
    
    public  void update(PatientVisit patientVisit);
    
    public void delete(PatientVisit patientVisit);
    
    public PatientVisit get(Integer patientVisitId);
    
    public List<PatientVisit> getAllPatientVisits();
    
    public PatientVisit getLastVisitForPatient(Integer patientId);
    
    public List<PatientVisit> getNofLastVisit(Integer patientId,Integer nOfVisits);
    
}
