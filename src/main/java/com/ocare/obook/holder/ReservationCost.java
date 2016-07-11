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
public class ReservationCost {

    private String integerString;
    private String fractionString;
    private float totalCost;
    private float insurrancePercentage;

    public ReservationCost(float totalCost ,float insurrancePercentage){
         this.totalCost = totalCost;
         this.insurrancePercentage=  insurrancePercentage;
         // Calculate result 
         if(insurrancePercentage>0){
             this.totalCost = this.totalCost-calculateDiscount();
         }//end if Condition
    }//end 
    
    public String getIntegerString() {
        String totalCostString=totalCost+"";
        // return result
        return totalCostString.substring(0,totalCostString.indexOf("."));
    }//end 

    
    public String getFractionString() {
        String totalCostString=totalCost+"";
        String fractionCost = totalCostString.substring(totalCostString.indexOf(".")+1);
        fractionCost+= (fractionCost.length()>1)?"":"0";
        /// return result
        return fractionCost;
    }//end getFractionString

    
    public float getTotalCost() {
        return totalCost;
    }//end getTotalCost

    private float calculateDiscount(){
         return (float) ((totalCost * insurrancePercentage) / 100.0);
    }//end calculateDiscount

    @Override
    public String toString() {
        return "ReservationCost{" + "integerString=" + integerString + ", fractionString=" + fractionString + ", totalCost=" + totalCost + ", insurrancePercentage=" + insurrancePercentage + '}';
    }
    
    
    
}
