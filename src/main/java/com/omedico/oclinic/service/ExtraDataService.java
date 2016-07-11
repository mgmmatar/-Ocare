/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.oclinic.service;

import com.omedico.oclinic.domain.ExtraData;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface ExtraDataService {
    
    
    public ExtraData save(ExtraData extraData);
    
    public  void update(ExtraData extraData);
    
    public void delete(ExtraData extraData);
    
    public ExtraData get(Integer extraDataId);
    
    public List<ExtraData> getAllExtraData();
    
}
