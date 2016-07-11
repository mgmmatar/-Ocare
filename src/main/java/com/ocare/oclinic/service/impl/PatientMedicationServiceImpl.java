/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.service.impl;

import com.ocare.oclinic.dao.PatientMedicationDao;
import com.ocare.oclinic.domain.PatientMedication;
import com.ocare.oclinic.service.PatientMedicationService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("patientMedicationService")
public class PatientMedicationServiceImpl implements PatientMedicationService{
    
    @Autowired
    private PatientMedicationDao patientMedicationDao;

    @Override
    public PatientMedication save(PatientMedication patientMedication) {
        return patientMedicationDao.save(patientMedication);
    }

    @Override
    public void update(PatientMedication patientMedication) {
        patientMedicationDao.update(patientMedication);
    }

    @Override
    public void delete(PatientMedication patientMedication) {
        patientMedicationDao.delete(patientMedication);
    }

    @Override
    public PatientMedication get(Integer patientMedicationId) {
        return patientMedicationDao.get(patientMedicationId);
    }

    @Override
    public List<PatientMedication> getAllPatientMedications() {
        return patientMedicationDao.getAllPatientMedications();
    }
    
}
