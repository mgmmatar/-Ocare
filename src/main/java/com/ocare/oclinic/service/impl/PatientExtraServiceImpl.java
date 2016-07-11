/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.oclinic.service.impl;

import com.ocare.oclinic.dao.PatientExtraDao;
import com.ocare.oclinic.domain.PatientExtra;
import com.ocare.oclinic.service.PatientExtraService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("patientExtraService")
public class PatientExtraServiceImpl implements PatientExtraService{
    
    @Autowired
    private PatientExtraDao patientExtraDao;

    @Override
    public PatientExtra save(PatientExtra patientExtra) {
        return patientExtraDao.save(patientExtra);
    }

    @Override
    public void update(PatientExtra patientExtra) {
        patientExtraDao.update(patientExtra);
    }

    @Override
    public void delete(PatientExtra patientExtra) {
       patientExtraDao.delete(patientExtra);
    }

    @Override
    public PatientExtra get(Integer patientExtraId) {
        return patientExtraDao.get(patientExtraId);
    }

    @Override
    public List<PatientExtra> getAllPatientExtra() {
        return patientExtraDao.getAllPatientExtra();
    }
    
    
    
    
}
