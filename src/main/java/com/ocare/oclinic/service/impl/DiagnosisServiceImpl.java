/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.service.impl;

import com.ocare.oclinic.dao.DiagnosisDao;
import com.ocare.oclinic.domain.Diagnosis;
import com.ocare.oclinic.service.DiagnosisService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("diagnosisService")
public class DiagnosisServiceImpl implements DiagnosisService{
    
    @Autowired
    private DiagnosisDao diagnosisDao;

    @Override
    public Diagnosis save(Diagnosis diagnosis) {
        return diagnosisDao.save(diagnosis);
    }

    @Override
    public void update(Diagnosis diagnosis) {
        diagnosisDao.update(diagnosis);
    }

    @Override
    public void delete(Diagnosis diagnosis) {
        diagnosisDao.delete(diagnosis);
    }

    @Override
    public Diagnosis get(Integer diagnosisId) {
        return diagnosisDao.get(diagnosisId);
    }

    @Override
    public List<Diagnosis> getAllDiagnosises() {
        return diagnosisDao.getAllDiagnosises();
    }

    @Override
    public List<Diagnosis> getSignedDiagnisises() {
        return diagnosisDao.getSignedDiagnisises();
    }

    @Override
    public List<Diagnosis> getUnSignedDiagnisises() {
        return diagnosisDao.getUnSignedDiagnisises();
    }

    @Override
    public List<Diagnosis> getDiagnosisWithPattern(String namePattern) {
        return diagnosisDao.getDiagnosisWithPattern(namePattern);
    }
    
    
    
}
