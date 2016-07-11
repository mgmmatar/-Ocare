/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.obook.dao;

import com.ocare.obook.domain.ExamineType;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface ExamineTypeDao {
    
    public ExamineType save(ExamineType examineType);
    
    public  void update(ExamineType examineType);
    
    public void delete(ExamineType examineType);
    
    public ExamineType get(Integer examineTypeId);
    
    public List<ExamineType> getAllExamineTypes();
    
    public ExamineType getDefaultExamineType();
    
}
