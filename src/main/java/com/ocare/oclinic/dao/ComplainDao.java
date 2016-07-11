/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.oclinic.dao;

import com.ocare.oclinic.domain.Complain;
import java.util.List;

/**
 *
 * @author khaledeng
 */
public interface ComplainDao {
    
    public Complain save(Complain complain);
    
    public  void update(Complain complain);
    
    public void delete(Complain complain);
    
    public Complain get(Integer complainId);
    
    public List<Complain> getAllComplains();
    
    public List<Complain> getSignedComplains();
    
    public List<Complain> getUnSignedComplains();
    
    public List<Complain> getComplainWithPattern(String namePattern);
    
}
