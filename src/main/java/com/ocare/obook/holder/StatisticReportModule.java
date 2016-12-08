/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.holder;

/**
 *
 * @author khaledeng
 */
public class StatisticReportModule {
    
    private String moduleName;
    
    private long occuranceNumber;

    private double moduleSum;
    
    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public long getOccuranceNumber() {
        return occuranceNumber;
    }

    public void setOccuranceNumber(long occuranceNumber) {
        this.occuranceNumber = occuranceNumber;
    }

    public double getModuleSum() {
        return moduleSum;
    }

    public void setModuleSum(double moduleSum) {
        this.moduleSum = moduleSum;
    }

    @Override
    public String toString() {
        return "StatisticReportModule{" + "moduleName=" + moduleName + ", occuranceNumber=" + occuranceNumber + ", moduleSum=" + moduleSum + '}';
    }

    
}
