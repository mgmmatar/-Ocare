/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.service;

import com.ocare.obook.domain.InsuranceProfile;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface InsuranceProfileService {
 
    public InsuranceProfile save(InsuranceProfile insuranceProfile);
    
    public  void update(InsuranceProfile insuranceProfile);
    
    public void delete(InsuranceProfile insuranceProfile);
    
    public InsuranceProfile get(Integer insuranceProfileId);
    
    public List<InsuranceProfile> getAllInsuranceProfiles();
    
    public InsuranceProfile getProfileForCompanyAndExamine(Integer insurranceCompanyId,Integer examineTypeId);
    
}
