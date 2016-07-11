/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.service.impl;

import com.ocare.oclinic.dao.MedicationDao;
import com.ocare.oclinic.domain.Medication;
import com.ocare.oclinic.service.MedicationService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("medicationService")
public class MedicationServiceImpl implements MedicationService{
    
    @Autowired
    private MedicationDao medicationDao;

    @Override
    public Medication save(Medication medication) {
        return medicationDao.save(medication);
    }

    @Override
    public void update(Medication medication) {
        medicationDao.update(medication);
    }

    @Override
    public void delete(Medication medication) {
        medicationDao.delete(medication);
    }

    @Override
    public Medication get(Integer medicationId) {
        return medicationDao.get(medicationId);
    }

    @Override
    public List<Medication> getAllMedications() {
       return medicationDao.getAllMedications();
    }

    @Override
    public List<Medication> getSignedMedications() {
        return medicationDao.getSignedMedications();
    }

    @Override
    public List<Medication> getUnSignedMedications() {
        return medicationDao.getUnSignedMedications();
    }

    @Override
    public List<Medication> getMedicationWithPattern(String namePattern) {
        return medicationDao.getMedicationWithPattern(namePattern);
    }
    
    
}
