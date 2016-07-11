/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.obook.service;

import com.omedico.obook.domain.Common;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface CommonService {
    
    public Common save(Common common);
    
    public  void update(Common common);
    
    public void delete(Common common);
    
    public Common get(Integer commonId);
    
    public List<Common> getAllCommons();
    
}
