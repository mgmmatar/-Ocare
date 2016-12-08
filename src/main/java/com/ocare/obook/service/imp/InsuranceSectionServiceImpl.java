/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.service.imp;

import com.ocare.obook.dao.InsuranceSectionDao;
import com.ocare.obook.domain.InsuranceSection;
import com.ocare.obook.service.InsuranceSectionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("insuranceSectionService")
public class InsuranceSectionServiceImpl implements InsuranceSectionService{
    
    @Autowired
    private InsuranceSectionDao insuranceSectionDao;

    @Override
    public InsuranceSection save(InsuranceSection insuranceSection) {
        return insuranceSectionDao.save(insuranceSection);
    }

    @Override
    public void update(InsuranceSection insuranceSection) {
        insuranceSectionDao.update(insuranceSection);
    }

    @Override
    public void delete(InsuranceSection insuranceSection) {
        insuranceSectionDao.delete(insuranceSection);
    }

    @Override
    public InsuranceSection get(Integer insuranceSectionId) {
        return insuranceSectionDao.get(insuranceSectionId);
    }

    @Override
    public List<InsuranceSection> getAllInsuranceSections() {
        return insuranceSectionDao.getAllInsuranceSections();
    }
    
}
