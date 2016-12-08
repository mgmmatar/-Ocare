/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.oclinic.service.impl;

import com.ocare.oclinic.dao.PatientMeasurementDao;
import com.ocare.oclinic.domain.PatientMeasurement;
import com.ocare.oclinic.service.PatientMeasurementService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("patientMeasurementService")
public class PatientMeasurementServiceImpl implements PatientMeasurementService{
    
    @Autowired
    private PatientMeasurementDao patientMeasurementDao;

    @Override
    public PatientMeasurement save(PatientMeasurement patientMeasurement) {
        return patientMeasurementDao.save(patientMeasurement);
    }

    @Override
    public void update(PatientMeasurement patientMeasurement) {
        patientMeasurementDao.update(patientMeasurement);
    }

    @Override
    public void delete(PatientMeasurement patientMeasurement) {
        patientMeasurementDao.delete(patientMeasurement);
    }

    @Override
    public PatientMeasurement get(Integer patientMeasurementId) {
        return patientMeasurementDao.get(patientMeasurementId);
    }

    @Override
    public List<PatientMeasurement> getAllPatientMeasurements() {
        return patientMeasurementDao.getAllPatientMeasurements();
    }
    
    
    
}
