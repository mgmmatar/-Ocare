/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.obook.service.imp;

import com.omedico.obook.dao.InsuranceCompanyDao;
import com.omedico.obook.domain.InsuranceCompany;
import com.omedico.obook.service.InsuranceCompanyService;
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
        insuranceCompanyDao.delete(insuranceCompany);
    }

    @Override
    public InsuranceCompany get(Integer insuranceCompanyId) {
        return insuranceCompanyDao.get(insuranceCompanyId);
    }

    @Override
    public List<InsuranceCompany> getAllInsuranceCompanys() {
        return insuranceCompanyDao.getAllInsuranceCompanys();
    }

}
