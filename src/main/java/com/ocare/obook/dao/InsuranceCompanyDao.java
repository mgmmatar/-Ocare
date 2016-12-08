/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.dao;

import com.ocare.obook.domain.InsuranceCompany;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface InsuranceCompanyDao {
    
    public InsuranceCompany save(InsuranceCompany insuranceCompany);
    
    public  void update(InsuranceCompany insuranceCompany);
    
    public void delete(InsuranceCompany insuranceCompany);
    
    public InsuranceCompany get(Integer insuranceCompanyId);
    
    public List<InsuranceCompany> getAllInsuranceCompanys();
    
    public List<InsuranceCompany> getInsurranceCompaniesWithPattern(String pattern);
    
}
