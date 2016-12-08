/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.service.impl;

import com.ocare.oclinic.dao.MedicalSectionDao;
import com.ocare.oclinic.domain.MedicalSection;
import com.ocare.oclinic.service.MedicalSectionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("medicalSectionService")
public class MedicalSectionServiceImpl implements MedicalSectionService{
    
    @Autowired
    private MedicalSectionDao medicalSectionDao;

    @Override
    public MedicalSection save(MedicalSection medicalSection) {
        return medicalSectionDao.save(medicalSection);
    }

    @Override
    public void update(MedicalSection medicalSection) {
        medicalSectionDao.update(medicalSection);
    }

    @Override
    public void delete(MedicalSection medicalSection) {
        medicalSectionDao.delete(medicalSection);
    }

    @Override
    public MedicalSection get(Integer medicalSectionId) {
        return medicalSectionDao.get(medicalSectionId);
    }

    @Override
    public List<MedicalSection> getAllMedicalSections() {
        return medicalSectionDao.getAllMedicalSections();
    }
    
}
