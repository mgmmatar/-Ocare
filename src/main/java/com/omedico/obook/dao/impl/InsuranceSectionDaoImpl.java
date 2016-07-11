/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.obook.dao.impl;

import com.obird.core.GenericDAO;
import com.omedico.obook.dao.InsuranceSectionDao;
import com.omedico.obook.domain.InsuranceSection;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author khaledeng
 */
@Repository("insuranceSectionDao")
public class InsuranceSectionDaoImpl extends GenericDAO<InsuranceSection> implements InsuranceSectionDao{
    {
        super.setClass(InsuranceSection.class);
    }

    @Override
    public List<InsuranceSection> getAllInsuranceSections() {
        return findAll();
    }
    
    
}
