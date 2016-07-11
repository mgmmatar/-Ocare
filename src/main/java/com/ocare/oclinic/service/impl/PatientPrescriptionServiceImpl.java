/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.service.impl;

import com.ocare.oclinic.dao.PatientPrescriptionDao;
import com.ocare.oclinic.domain.PatientPrescription;
import com.ocare.oclinic.service.PatientPrescriptionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("patientPrescriptionService")
public class PatientPrescriptionServiceImpl implements PatientPrescriptionService{
    
    @Autowired
    private PatientPrescriptionDao patientPrescriptionDao;

    @Override
    public PatientPrescription save(PatientPrescription patientPrescription) {
        return patientPrescriptionDao.save(patientPrescription);
    }

    @Override
    public void update(PatientPrescription patientPrescription) {
        patientPrescriptionDao.update(patientPrescription);
    }

    @Override
    public void delete(PatientPrescription patientPrescription) {
        patientPrescriptionDao.delete(patientPrescription);
    }

    @Override
    public PatientPrescription get(Integer patientPrescriptionId) {
        return patientPrescriptionDao.get(patientPrescriptionId);
    }

    @Override
    public List<PatientPrescription> getAllPatientPrescriptions() {
        return patientPrescriptionDao.getAllPatientPrescriptions();
    }
    
}
