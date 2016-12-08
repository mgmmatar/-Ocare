/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.service.impl;

import com.ocare.oclinic.dao.PatientDiagnosisDao;
import com.ocare.oclinic.domain.PatientDiagnosis;
import com.ocare.oclinic.service.PatientDiagnosisService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("patientDiagnosis")
public class PatientDiagnosisServiceImpl implements PatientDiagnosisService{
  
    @Autowired
    private PatientDiagnosisDao patientDiagnosisDao;

    @Override
    public PatientDiagnosis save(PatientDiagnosis patientDiagnosis) {
        return patientDiagnosisDao.save(patientDiagnosis);
    }

    @Override
    public void update(PatientDiagnosis patientDiagnosis) {
        patientDiagnosisDao.update(patientDiagnosis);
    }

    @Override
    public void delete(PatientDiagnosis patientDiagnosis) {
        patientDiagnosisDao.delete(patientDiagnosis);
    }

    @Override
    public PatientDiagnosis get(Integer patientDiagnosisId) {
        return patientDiagnosisDao.get(patientDiagnosisId);
    }

    @Override
    public List<PatientDiagnosis> getAllPatientDiagnosiss() {
        return patientDiagnosisDao.getAllPatientDiagnosiss();
    }
    
}
