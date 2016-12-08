/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.service.imp;

import com.ocare.obook.dao.CommonDao;
import com.ocare.obook.domain.Common;
import com.ocare.obook.service.CommonService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author khaledeng
 */
@Service("commonService")
public class CommonServiceImpl implements CommonService{
    
    @Autowired
    private CommonDao commonDao;

    @Override
    @Transactional
    public Common save(Common common) {
        return commonDao.save(common);
    }

    @Override
    @Transactional
    public void update(Common common) {
        commonDao.update(common);
    }

    @Override
    public void delete(Common common) {
        commonDao.delete(common);
    }

    @Override
    public Common get(Integer commonId) {
        return commonDao.get(commonId);
    }

    @Override
    public List<Common> getAllCommons() {
        return commonDao.getAllCommons();
    }
    
    
    
}
