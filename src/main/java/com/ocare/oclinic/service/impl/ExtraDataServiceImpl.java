/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.oclinic.service.impl;

import com.ocare.oclinic.dao.ExtraDataDao;
import com.ocare.oclinic.domain.ExtraData;
import com.ocare.oclinic.service.ExtraDataService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("extraDataService")
public class ExtraDataServiceImpl implements ExtraDataService{

    @Autowired
    private ExtraDataDao patientExtraDao;

    @Override
    public ExtraData save(ExtraData extraData) {
        return patientExtraDao.save(extraData);
    }

    @Override
    public void update(ExtraData extraData) {
        patientExtraDao.update(extraData);
    }

    @Override
    public void delete(ExtraData extraData) {
       patientExtraDao.delete(extraData);
    }

    @Override
    public ExtraData get(Integer extraDataId) {
        return patientExtraDao.get(extraDataId);
    }

    @Override
    public List<ExtraData> getAllExtraData() {
        return patientExtraDao.getAllExtraData();
    }

    
    
}
