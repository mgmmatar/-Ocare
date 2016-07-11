/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.service.impl;

import com.ocare.oclinic.dao.ComplainDao;
import com.ocare.oclinic.domain.Complain;
import com.ocare.oclinic.service.ComplainService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("complainService")
public class ComplainServiceImpl implements ComplainService{
    
    @Autowired
    private ComplainDao complainDao;

    @Override
    public Complain save(Complain complain) {
        return complainDao.save(complain);
    }

    @Override
    public void update(Complain complain) {
        complainDao.update(complain);
    }

    @Override
    public void delete(Complain complain) {
        complainDao.delete(complain);
    }

    @Override
    public Complain get(Integer complainId) {
        return complainDao.get(complainId);
    }

    @Override
    public List<Complain> getAllComplains() {
        return complainDao.getAllComplains();
    }

    @Override
    public List<Complain> getSignedComplains() {
        return complainDao.getSignedComplains();
    }

    @Override
    public List<Complain> getUnSignedComplains() {
        return complainDao.getUnSignedComplains();
    }

    @Override
    public List<Complain> getComplainWithPattern(String namePattern) {
        return complainDao.getComplainWithPattern(namePattern);
    }
    
    
    
}
