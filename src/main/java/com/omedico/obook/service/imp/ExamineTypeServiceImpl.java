/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.obook.service.imp;

import com.omedico.obook.dao.ExamineTypeDao;
import com.omedico.obook.domain.ExamineType;
import com.omedico.obook.service.ExamineTypeService;
import java.util.List;
import javax.persistence.Temporal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author khaledeng
 */
@Service("examineTypeService")
public class ExamineTypeServiceImpl implements ExamineTypeService {

    @Autowired
    private ExamineTypeDao examineTypeDao;

    @Override
    public List<ExamineType> getAllExamineTypes() {
        return examineTypeDao.getAllExamineTypes();
    }

    @Override
    public ExamineType get(Integer examineTypeId) {
        return examineTypeDao.get(examineTypeId);
    }

    @Override
    @Transactional
    public void save(ExamineType examineType) {
        examineTypeDao.save(examineType);
    }

    @Override
    @Transactional
    public void update(ExamineType examineType) {
        examineTypeDao.update(examineType);
    }

    @Override
    @Transactional
    public void delete(ExamineType examineType) {
        examineType.setIsDeleted(true);
        examineTypeDao.update(examineType);
    }

    @Override
    public ExamineType getDefaultExamineType() {
       return examineTypeDao.getDefaultExamineType();
    }

    @Override
    @Transactional
    public void assignDefaultExamineType(Integer examineTypeId) {
        /// remove Default from Old 
        ExamineType  examineType= getDefaultExamineType();
        if(examineType !=null){
            examineType.setDefaultOne(false);
            // save Changes 
            save(examineType);
        }//end if
        //// Getting the New 
        ExamineType  newDefaultExamine=get(examineTypeId);
        newDefaultExamine.setDefaultOne(true);
        save(newDefaultExamine);
    }

}
