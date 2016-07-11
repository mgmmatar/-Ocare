/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.service.impl;

import com.ocare.oclinic.dao.MedicationClassDao;
import com.ocare.oclinic.domain.MedicationClass;
import com.ocare.oclinic.service.MedicationClassService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("medicationClassService")
public class MedicationClassServiceImpl implements MedicationClassService{
    
    @Autowired
    private MedicationClassDao medicationClassDao;

    @Override
    public MedicationClass save(MedicationClass medicationClass) {
        return medicationClassDao.save(medicationClass);
    }

    @Override
    public void update(MedicationClass medicationClass) {
        medicationClassDao.update(medicationClass);
    }

    @Override
    public void delete(MedicationClass medicationClass) {
        medicationClassDao.delete(medicationClass);
    }

    @Override
    public MedicationClass get(Integer medicationClassId) {
        return medicationClassDao.get(medicationClassId);
    }

    @Override
    public List<MedicationClass> getAllMedicationClasses() {
        return medicationClassDao.getAllMedicationClasses();
    }
    
}
