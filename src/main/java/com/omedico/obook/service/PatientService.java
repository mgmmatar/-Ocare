package com.omedico.obook.service;

import com.omedico.obook.domain.Patient;
import com.omedico.obook.holder.FastPatient;
import com.omedico.obook.holder.PatientHolder;
import java.util.List;
import net.sf.jasperreports.engine.JasperPrint;

public interface PatientService {
	 
    public Patient register(PatientHolder patientHolder);
    public Patient update(PatientHolder patientHolder);
    public void delete(Patient patient);
    // Getters 
    public Patient getPatientById(Integer patientID);
    public Patient getPatientByCode(String patientCode);
    public List<Patient> getAllPatients();
    //// search Keys
    public List<FastPatient> getFastPatientList(String patientInfo);
    
    public List<Patient> searchForPatient(String patientName,String patientCode,String patientPhone);    
   
    public List<Patient> searchForPatient(String patientInfo);
    
    public JasperPrint patientReport();
   
    
 }
