/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.dao;

import com.ocare.oclinic.domain.PrescriptionType;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface PrescriptionTypeDao {
 
    public PrescriptionType save(PrescriptionType prescriptionType);
    
    public  void update(PrescriptionType prescriptionType);
    
    public void delete(PrescriptionType prescriptionType);
    
    public PrescriptionType get(Integer prescriptionTypeId);
    
    public List<PrescriptionType> getAllPrescriptionTypes();   
    
}
