/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.service;

import com.ocare.obook.domain.ExamineType;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface ExamineTypeService {

    public void save(ExamineType examineType);

    public void delete(ExamineType examineType);

    public void update(ExamineType examineType);

    public List<ExamineType> getAllExamineTypes();

    public ExamineType get(Integer examineTypeId);
    
    public ExamineType getDefaultExamineType();
    
    public void assignDefaultExamineType(Integer examineTypeId);

}
