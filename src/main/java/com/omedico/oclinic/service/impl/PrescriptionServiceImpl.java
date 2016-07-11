/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.oclinic.service.impl;

import com.omedico.oclinic.dao.PrescriptionDao;
import com.omedico.oclinic.domain.Prescription;
import com.omedico.oclinic.service.PrescriptionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("prescriptionService")
public class PrescriptionServiceImpl implements PrescriptionService{
    
    @Autowired
    private PrescriptionDao prescriptionDao;

    @Override
    public Prescription save(Prescription prescription) {
         return prescriptionDao.save(prescription);
    }

    @Override
    public void update(Prescription prescription) {
        prescriptionDao.update(prescription);
    }

    @Override
    public void delete(Prescription prescription) {
        prescriptionDao.delete(prescription);
    }

    @Override
    public Prescription get(Integer prescriptionId) {
        return prescriptionDao.get(prescriptionId);
    }

    @Override
    public List<Prescription> getAllPrescriptions() {
        return prescriptionDao.getAllPrescriptions();
    }

    @Override
    public List<Prescription> getSignedPrescriptions() {
        return prescriptionDao.getSignedPrescriptions();
    }

    @Override
    public List<Prescription> getUnSignedPrescriptions() {
        return prescriptionDao.getUnSignedPrescriptions();
    }

    @Override
    public List<Prescription> getPrescriptionWithPattern(String namePattern) {
       return prescriptionDao.getPrescriptionWithPattern(namePattern);
    }
    
}
