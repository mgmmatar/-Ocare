/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.oclinic.domain;

import com.omedico.obook.domain.ExamineType;
import com.omedico.obook.domain.Patient;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.ForeignKey;

/**
 *
 * @author khaledeng
 */
@Entity
@Table(name="patient_visit")
public class PatientVisit {
    
    private Integer id;
    private String temperature;
    private String pressure;
    private Date visitDate;
    private Patient patient;
    private ExamineType examineType;
    private List<PatientComplain> patientComplains;
    private List<PatientDiagnosis> patientDiagnosises;
    private List<PatientMedication> patientMedications;
    private List<PatientPrescription> patientPrescriptions;
    private List<PatientMeasurement> patientMeasurements;

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name="temperature",nullable =true)
    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    @Column(name="pressure",nullable =true)
    public String getPressure() {
        return pressure;
    }

    public void setPressure(String pressure) {
        this.pressure = pressure;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="visitDate",nullable =true)
    public Date getVisitDate() {
        return visitDate;
    }

    public void setVisitDate(Date visitDate) {
        this.visitDate = visitDate;
    }

    @ForeignKey(name="patientId")
    @JoinColumn(name="patientId" , nullable=true)
    @OneToOne(fetch = FetchType.LAZY)  
    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    @ForeignKey(name="examineTypeId")
    @JoinColumn(name="examineTypeId" , nullable=true)
    @OneToOne(fetch = FetchType.LAZY)  
    public ExamineType getExamineType() {
        return examineType;
    }

    public void setExamineType(ExamineType examineType) {
        this.examineType = examineType;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "patientVisit", cascade = javax.persistence.CascadeType.ALL)
    public List<PatientComplain> getPatientComplains() {
        return patientComplains;
    }

    public void setPatientComplains(List<PatientComplain> patientComplains) {
        this.patientComplains = patientComplains;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "patientVisit", cascade = javax.persistence.CascadeType.ALL)
    public List<PatientDiagnosis> getPatientDiagnosises() {
        return patientDiagnosises;
    }

    public void setPatientDiagnosises(List<PatientDiagnosis> patientDiagnosises) {
        this.patientDiagnosises = patientDiagnosises;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "patientVisit", cascade = javax.persistence.CascadeType.ALL)
    public List<PatientMedication> getPatientMedications() {
        return patientMedications;
    }

    public void setPatientMedications(List<PatientMedication> patientMedications) {
        this.patientMedications = patientMedications;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "patientVisit", cascade = javax.persistence.CascadeType.ALL)
    public List<PatientPrescription> getPatientPrescriptions() {
        return patientPrescriptions;
    }

    public void setPatientPrescriptions(List<PatientPrescription> patientPrescription) {
        this.patientPrescriptions = patientPrescription;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "patientVisit", cascade = javax.persistence.CascadeType.ALL)
    public List<PatientMeasurement> getPatientMeasurements() {
        return patientMeasurements;
    }

    public void setPatientMeasurements(List<PatientMeasurement> patientMeasurements) {
        this.patientMeasurements = patientMeasurements;
    }

    
    
    @Override
    public String toString() {
        String result="PatientVisit{" + "id=" + id + ", temperature=" + temperature + ", pressure=" + pressure + ", visitDate=" + visitDate + ", patient=" + patient + ", examineType=" + examineType ;
        
        result+=", patientComplains = " ;
         
               for(PatientComplain patientComplain:patientComplains){
               
                   result+=patientComplain.getComplain().toString()+" , ";
                   
               }//end for Loopp     
                        
        result+="} , ";
        
        result+=", patientDiagnosises = " ;
         
               for(PatientDiagnosis patientDiagnosis:patientDiagnosises){
               
                   result+=patientDiagnosis.getDiagnosis().toString()+" , ";
                   
               }//end for Loopp     
                        
        result+="} , ";
        
        result+=", patientMeasurements = " ;
         
               for(PatientMeasurement patientMeasurement:patientMeasurements){
               
                   result+=patientMeasurement.getMeasurement().toString()+" , ";
                   
               }//end for Loopp     
                        
        result+="} , ";
                
        result+=", patientMedications = " ;
         
               for(PatientMedication patientMedication:patientMedications){
               
                   result+=patientMedication.getMedication().toString()+" , ";
                   
               }//end for Loopp     
                        
        result+="} , ";
        
        result+=", patientPrescriptions = " ;
         
               for(PatientPrescription patientPrescription:patientPrescriptions){
               
                   result+=patientPrescription.getPrescription().toString()+" , ";
                   
               }//end for Loopp     
                        
        result+="}";
        
        // return toString String
        return result;
    }//end toString Method

    
    
}
