/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.omedico.obook.service.imp;

import com.omedico.obook.dao.InsuranceCompanyDao;
import com.omedico.obook.dao.PatientDao;
import com.omedico.obook.domain.InsuranceCompany;
import com.omedico.obook.domain.Patient;
import com.omedico.obook.holder.FastPatient;
import com.omedico.obook.holder.PatientHolder;
import com.omedico.obook.report.PatientReport;
import com.omedico.obook.report.ReportField;
import com.omedico.obook.service.PatientService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import net.sf.jasperreports.engine.JasperPrint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author khaledeng
 */
@Service("patientService")
@Transactional(readOnly = false)
public class PatientServiceImp implements PatientService{

    @Autowired
    private PatientDao patientDao;

    @Autowired
    private InsuranceCompanyDao insuranceCompanyDao;
    
    @Override
    @Transactional
    public Patient register(PatientHolder patientHolder) {
        // creating the Patient Object 
        Patient patient= new Patient();
        patient = fillPatient(patient,patientHolder);
        patient.setCode(patient.getfName());  // TODO CODE 
        patient.setCreationDate(new Date());
        patient.setIsDeleted(false);
        patient.setRegisteredBy(1);  // TODO USER
        // save Patient 
        patientDao.save(patient);
        // return result
        return patient;
    }//end register
    
    @Override
    @Transactional
    public Patient update(PatientHolder patientHolder) {
        /// Getting Patient to Update
        System.out.println(" >>> "+patientHolder.getId());
        Patient patient = patientDao.get(patientHolder.getId());
        System.out.println("<<<<<<<<<<<<<"+patient.toString());
        patient=fillPatient(patient, patientHolder);
        patient.setLastModifiedDate(new Date());
        patient.setModifiedBy(1);  // TODO 
        // Update Patient 
        patientDao.update(patient);
        // return Patient
        return patient;
    }//end Patient
    
    @Override
    public List<Patient> getAllPatients() {
        return patientDao.getAllPatients();
    }

    private Patient fillPatient(Patient patient,PatientHolder holder){
        // create new Object
        if(holder.getFName()!=null){
            patient.setfName(holder.getFName());
        }//end if Condition 
        
        if(holder.getMidName()!=null){
            patient.setMidName(holder.getMidName());
        }//end if Condition 
        
        if(holder.getLName()!=null){
            patient.setlName(holder.getLName());
        }//end if Condition 
        
        if(holder.getAddress()!=null){
            patient.setAddress(holder.getAddress());
        }//end if Condition 
        
        if(holder.getAge()!=null){
            patient.setAge(holder.getAge());
        }//end if Condition 
        
        if(holder.getBirthDate()!=null){
            // Convert String to Date Format 
            String expectedPattern = "yyyy-MM-dd";
            SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
               try
                {
                    Date birthDate = formatter.parse(holder.getBirthDate());
                    patient.setBirthDate(birthDate);
                }
                catch (ParseException e)
                {
                  e.printStackTrace();
                }//end try_catch
        }//end if Condition 
        
        if(holder.getEmail()!=null){
            patient.setEmail(holder.getEmail());
        }//end if Condition 
        
        if(holder.getPhoneNumber1()!=null){
            patient.setPhoneNumber1(holder.getPhoneNumber1());
        }//end if Condition 
        
        if(holder.getPhoneNumber2()!=null){
            patient.setPhoneNumber2(holder.getPhoneNumber2());
        }//end if Condition 
        
        if(holder.getInsuranceCompany()!=null){
            // create New Insurance
            System.out.println(">>>>>  "+holder.getInsuranceCompany());
            InsuranceCompany insuranceCompany = insuranceCompanyDao.get(holder.getInsuranceCompany());
            // set insurance Company
            patient.setInsuranceCompany(insuranceCompany);
            
        }//end if Condition 
        
        if(holder.getGender()!=null){
           patient.setGender(holder.getGender());
        }//end if Condition 
        
        // return result
    return patient;
    }//end fill Patient 
    
    @Override
    public Patient getPatientById(Integer patientID) {
        return patientDao.get(patientID);
    }

    @Override
    public Patient getPatientByCode(String patientCode) {
        return patientDao.getByCode(patientCode);
    }

    @Override
    public void delete(Patient patient) {
         patientDao.deletePatient(patient);
    }

    @Override
    public List<Patient> searchForPatient(String patientName, String patientCode, String patientPhone) {
        return patientDao.searchPatient(patientName, patientCode, patientPhone);
    }

    @Override
    public JasperPrint patientReport() {
       List<Patient> patients =patientDao.getAllPatients();
       PatientReport report = new PatientReport(patients);
       // Creating the List of Fields 
       List<ReportField> fields=new ArrayList<ReportField>();
       fields.add(new ReportField("id", "ID", 30, Integer.class));
       fields.add(new ReportField("fName", "First Name", 30, String.class));
       fields.add(new ReportField("midName", "Mid Name", 30, String.class));
       fields.add(new ReportField("lName", "Last Name", 30, String.class));

       
       JasperPrint jp=null;
        try {
            
            System.out.println(">>>>> "+fields.toString());
             //jp = report.getReport(fields, "Patient Report", "List of Patient Information");
             jp = report.getReport();
        } 
        catch (Exception ex){
            ex.printStackTrace();
        }
        //return report 
        return jp;
    }

    @Override
    public List<FastPatient> getFastPatientList(String patientInfo) {
        return patientDao.getFastPatientList(patientInfo);
    }

    @Override
    public List<Patient> searchForPatient(String patientInfo) {
        return patientDao.searchForPatient(patientInfo);
    }

   
}
