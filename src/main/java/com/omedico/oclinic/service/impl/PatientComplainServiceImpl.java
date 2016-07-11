/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.oclinic.service.impl;

import com.omedico.oclinic.dao.PatientComplainDao;
import com.omedico.oclinic.domain.PatientComplain;
import com.omedico.oclinic.service.PatientComplainService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("patientComplainService")
public class PatientComplainServiceImpl implements PatientComplainService{
    
    @Autowired
    private PatientComplainDao patientComplainDao;

    @Override
    public PatientComplain save(PatientComplain patientComplain) {
        return patientComplainDao.save(patientComplain);
    }

    @Override
    public void update(PatientComplain patientComplain) {
        patientComplainDao.update(patientComplain);
    }

    @Override
    public void delete(PatientComplain patientComplain) {
        patientComplainDao.delete(patientComplain);
    }

    @Override
    public PatientComplain get(Integer patientComplainId) {
        return patientComplainDao.get(patientComplainId);
    }

    @Override
    public List<PatientComplain> getAllPatientComplains() {
        return patientComplainDao.getAllPatientComplains();
    }
    
}
