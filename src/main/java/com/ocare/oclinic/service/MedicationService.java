/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.service;

import com.ocare.oclinic.domain.Medication;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface MedicationService {
 
    public Medication save(Medication medication);
    
    public  void update(Medication medication);
    
    public void delete(Medication medication);
    
    public Medication get(Integer medicationId);
    
    public List<Medication> getAllMedications();
    
    public List<Medication> getSignedMedications();

    public List<Medication> getUnSignedMedications();
    
    public List<Medication> getMedicationWithPattern(final String namePattern);
}
