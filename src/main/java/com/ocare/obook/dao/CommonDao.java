/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.dao;

import com.ocare.obook.domain.Common;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface CommonDao {
  
    public Common save(Common common);
    
    public  void update(Common common);
    
    public void delete(Common common);
    
    public Common get(Integer commonId);
    
    public List<Common> getAllCommons();
    
}
