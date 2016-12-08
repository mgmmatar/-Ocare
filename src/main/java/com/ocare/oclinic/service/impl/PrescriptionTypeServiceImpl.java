/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.service.impl;

import com.ocare.oclinic.dao.PrescriptionTypeDao;
import com.ocare.oclinic.domain.PrescriptionType;
import com.ocare.oclinic.service.PrescriptionTypeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("prescriptionTypeService")
public class PrescriptionTypeServiceImpl implements PrescriptionTypeService{
    
    @Autowired
    private PrescriptionTypeDao prescriptionTypeDao;

    @Override
    public PrescriptionType save(PrescriptionType prescriptionType) {
        return prescriptionTypeDao.save(prescriptionType);
    }

    @Override
    public void update(PrescriptionType prescriptionType) {
        prescriptionTypeDao.update(prescriptionType);
    }

    @Override
    public void delete(PrescriptionType prescriptionType) {
        prescriptionTypeDao.delete(prescriptionType);
    }

    @Override
    public PrescriptionType get(Integer prescriptionTypeId) {
        return prescriptionTypeDao.get(prescriptionTypeId);
    }

    @Override
    public List<PrescriptionType> getAllPrescriptionTypes() {
        return prescriptionTypeDao.getAllPrescriptionTypes();
    }
    
    
}
