/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.service.imp;

import com.ocare.obook.dao.InsuranceProfileDao;
import com.ocare.obook.domain.InsuranceProfile;
import com.ocare.obook.service.InsuranceProfileService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("insuranceProfileService")
public class InsuranceProfileServiceImpl implements InsuranceProfileService{
    
    @Autowired
    private InsuranceProfileDao insuranceProfileDao;

    @Override
    public InsuranceProfile save(InsuranceProfile insuranceProfile) {
        return insuranceProfileDao.save(insuranceProfile);
    }

    @Override
    public void update(InsuranceProfile insuranceProfile) {
        insuranceProfileDao.update(insuranceProfile);
    }

    @Override
    public void delete(InsuranceProfile insuranceProfile) {
        insuranceProfileDao.delete(insuranceProfile);
    }

    @Override
    public InsuranceProfile get(Integer insuranceProfileId) {
        return insuranceProfileDao.get(insuranceProfileId);
    }

    @Override
    public List<InsuranceProfile> getAllInsuranceProfiles() {
        return insuranceProfileDao.getAllInsuranceProfiles();
    }

    @Override
    public InsuranceProfile getProfileForCompanyAndExamine(Integer insurranceCompanyId, Integer examineTypeId) {
        System.out.println(">>>>>>> Insurrance "+insurranceCompanyId+" , Examine : "+examineTypeId);
        return insuranceProfileDao.getProfileForCompanyAndExamine(insurranceCompanyId, examineTypeId);
    }
    
    
}
