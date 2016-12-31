/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.obird.utility;

/**
 *
 * @author khaledeng
 */
public class OFault {
   
    private String propertyName;
    private String errorMessage;

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    @Override
    public String toString() {
        return "OFault{" + "propertyName=" + propertyName + ", errorMessage=" + errorMessage + '}';
    }
    
}
