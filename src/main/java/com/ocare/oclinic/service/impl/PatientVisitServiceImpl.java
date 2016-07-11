/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.service.impl;

import com.ocare.oclinic.dao.PatientVisitDao;
import com.ocare.oclinic.domain.PatientVisit;
import com.ocare.oclinic.service.PatientVisitService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("patientVisitService")
public class PatientVisitServiceImpl implements PatientVisitService{
    
    @Autowired
    private PatientVisitDao patientVisitDao;

    @Override
    public PatientVisit save(PatientVisit patientVisit) {
        return patientVisitDao.save(patientVisit);
    }

    @Override
    public void update(PatientVisit patientVisit) {
        patientVisitDao.update(patientVisit);
    }

    @Override
    public void delete(PatientVisit patientVisit) {
        patientVisitDao.delete(patientVisit);
    }

    @Override
    public PatientVisit get(Integer patientVisitId) {
        return patientVisitDao.get(patientVisitId);
    }

    @Override
    public List<PatientVisit> getAllPatientVisits() {
        return patientVisitDao.getAllPatientVisits();
    }

    @Override
    public PatientVisit getLastVisitForPatient(Integer patientId) {
        return patientVisitDao.getLastVisitForPatient(patientId);
    }

    @Override
    public List<PatientVisit> getNofLastVisit(Integer patientId, Integer nOfVisits) {
        return patientVisitDao.getNofLastVisit(patientId, nOfVisits);
    }
    
    
    
}
