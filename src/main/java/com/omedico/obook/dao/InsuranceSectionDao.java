/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.obook.dao;

import com.omedico.obook.domain.InsuranceSection;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface InsuranceSectionDao {
 
    public InsuranceSection save(InsuranceSection insuranceSection);
    
    public  void update(InsuranceSection insuranceSection);
    
    public void delete(InsuranceSection insuranceSection);
    
    public InsuranceSection get(Integer insuranceSectionId);
    
    public List<InsuranceSection> getAllInsuranceSections();
    
}
