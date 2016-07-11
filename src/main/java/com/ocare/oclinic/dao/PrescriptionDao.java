/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.dao;

import com.ocare.oclinic.domain.Prescription;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface PrescriptionDao {
 
    public Prescription save(Prescription prescription);
    
    public  void update(Prescription prescription);
    
    public void delete(Prescription prescription);
    
    public Prescription get(Integer prescriptionId);
    
    public List<Prescription> getAllPrescriptions();    
    
    public List<Prescription> getSignedPrescriptions();
    
    public List<Prescription> getUnSignedPrescriptions();
    
    public List<Prescription> getPrescriptionWithPattern(String namePattern);
    
}
