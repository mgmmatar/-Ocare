/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.dao;

import com.ocare.oclinic.domain.Diagnosis;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface DiagnosisDao {
    
        
    public Diagnosis save(Diagnosis diagnosis);
    
    public  void update(Diagnosis diagnosis);
    
    public void delete(Diagnosis diagnosis);
    
    public Diagnosis get(Integer diagnosisId);
    
    public List<Diagnosis> getAllDiagnosises();
    
    public List<Diagnosis> getSignedDiagnisises();
    
    public List<Diagnosis> getUnSignedDiagnisises();
    
    public List<Diagnosis> getDiagnosisWithPattern(String namePattern);
    
    
}
