/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.dao;

import com.ocare.oclinic.domain.MedicalSection;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface MedicalSectionDao {
             
    public MedicalSection save(MedicalSection medicalSection);
    
    public  void update(MedicalSection medicalSection);
    
    public void delete(MedicalSection medicalSection);
    
    public MedicalSection get(Integer medicalSectionId);
    
    public List<MedicalSection> getAllMedicalSections();
    
}
