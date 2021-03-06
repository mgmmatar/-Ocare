/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.service.imp;

import com.ocare.obook.dao.InsuranceCompanyDao;
import com.ocare.obook.domain.InsuranceCompany;
import com.ocare.obook.service.InsuranceCompanyService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("insuranceCompanyService")
public class InsuranceCompanyServiceImpl implements InsuranceCompanyService{
    
    @Autowired
    private InsuranceCompanyDao insuranceCompanyDao;

    @Override
    public InsuranceCompany save(InsuranceCompany insuranceCompany) {
        return insuranceCompanyDao.save(insuranceCompany);
    }  
    
 

    @Override
    public void update(InsuranceCompany insuranceCompany) {
        insuranceCompanyDao.update(insuranceCompany);
    }

    @Override
    public void delete(InsuranceCompany insuranceCompany) {
        insuranceCompany.setIsDeleted(true);
        update(insuranceCompany);
    }

    @Override
    public InsuranceCompany get(Integer insuranceCompanyId) {
        return insuranceCompanyDao.get(insuranceCompanyId);
    }

    @Override
    public List<InsuranceCompany> getAllInsuranceCompanys() {
        return insuranceCompanyDao.getAllInsuranceCompanys();
    }

    @Override
    public List<InsuranceCompany> getInsurranceCompaniesWithPattern(String pattern) {
        return insuranceCompanyDao.getInsurranceCompaniesWithPattern(pattern);
    }

}
