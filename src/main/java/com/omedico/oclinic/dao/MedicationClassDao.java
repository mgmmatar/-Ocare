/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.oclinic.dao;

import com.omedico.oclinic.domain.MedicationClass;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface MedicationClassDao {
    
    public MedicationClass save(MedicationClass medicationClass);
    
    public  void update(MedicationClass medicationClass);
    
    public void delete(MedicationClass medicationClass);
    
    public MedicationClass get(Integer medicationClassId);
    
    public List<MedicationClass> getAllMedicationClasses();
    
}
