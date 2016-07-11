/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ocare.oclinic.service.impl;

import com.ocare.oclinic.dao.MeasurementDao;
import com.ocare.oclinic.domain.Measurement;
import com.ocare.oclinic.service.MeasurementService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author khaledeng
 */
@Service("measurementService")
public class MeasurementServiceImpl implements MeasurementService{
    
    @Autowired
    private MeasurementDao measurementDao;

    @Override
    public Measurement save(Measurement measurement) {
        return measurementDao.save(measurement);
    }

    @Override
    public void update(Measurement measurement) {
        measurementDao.update(measurement);
    }

    @Override
    public void delete(Measurement measurement) {
        measurementDao.delete(measurement);
    }

    @Override
    public Measurement get(Integer measurementId) {
        return measurementDao.get(measurementId);
    }

    @Override
    public List<Measurement> getAllMeasurements() {
        return measurementDao.getAllMeasurements();
    }
    
}
