/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.omedico.oclinic.controller;

import com.omedico.oclinic.domain.Complain;
import com.omedico.oclinic.domain.Diagnosis;
import com.omedico.oclinic.domain.MedicalSection;
import com.omedico.oclinic.domain.Medication;
import com.omedico.oclinic.domain.MedicationClass;
import com.omedico.oclinic.domain.Prescription;
import com.omedico.oclinic.domain.PrescriptionType;
import com.omedico.oclinic.service.ComplainService;
import com.omedico.oclinic.service.DiagnosisService;
import com.omedico.oclinic.service.MedicalSectionService;
import com.omedico.oclinic.service.MedicationClassService;
import com.omedico.oclinic.service.MedicationService;
import com.omedico.oclinic.service.PrescriptionService;
import com.omedico.oclinic.service.PrescriptionTypeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author khaledeng
 */
@Controller("monitorSettingController")
@RequestMapping("/monitor/settings")
public class SettingController {

    private String PACKAGE_ROOT = "monitor/";
    
    @Autowired
    private  ComplainService complainService;
    @Autowired
    private MedicationService medicationService;
    @Autowired
    private MedicalSectionService medicalSectionService;
    @Autowired
    private DiagnosisService diagnosisService;
    @Autowired
    MedicationClassService medicationClassService;
    @Autowired
    private PrescriptionService prescriptionService;
    @Autowired
    private PrescriptionTypeService prescriptionTypeService;
            
    
    
    @RequestMapping(value = "/test")
    public String registerPatient(Model model) {

        return "index";
    }//end registerPatient
    
    ////////////////////////////////////////////////////////////////////////////
    ///////////////// Complain controller  /////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
    
        @RequestMapping("/complain/list")
    public String listComplain(Model model) {
        // Define The Operation
        List<Complain> complainType = complainService.getAllComplains();
        /// Modeling
        model.addAttribute("complainType", complainType);
        // Getting List
        return PACKAGE_ROOT+ "complainList";
    }//end

    @RequestMapping("/complain/add")
    public String addComplain(Model model) {
        
        List<MedicalSection> medicalSections=medicalSectionService.getAllMedicalSections();
        // Define The Operation
        model.addAttribute("operation", "Add");
        model.addAttribute("medicalSections", medicalSections);
        // Setting List
        return PACKAGE_ROOT+ "complain";
    }//end

    @RequestMapping("/complain/edit/{id}")
    public String editComplain(@PathVariable("id") Integer complainId, Model model) {
        // Define The Operation
        Complain complain = complainService.get(complainId);
        List<MedicalSection> medicalSections=medicalSectionService.getAllMedicalSections();
        // Adding Data to Model
        model.addAttribute("operation", "Update");
        model.addAttribute("complain", complain);
        model.addAttribute("medicalSections", medicalSections);
        // Getting List
        return PACKAGE_ROOT+ "complain";
    }//end editExamineType

    @RequestMapping("/complain/delete/{id}")
    public String deleteComplain(@PathVariable("id") Integer complainId, Model model) {
        // Define The Operation
        Complain complain = complainService.get(complainId);
        // Deleting Current Examine Type
        complainService.delete(complain);
        // return List Page
        return "redirect:/monitor/complain/list";
    }//end editExamineTypemonitor

    @RequestMapping(value = "/complain/process", method = RequestMethod.POST)
    public String processComplain(Model model, @ModelAttribute("complain") Complain complain, BindingResult result) {
        // TODO Validating Object
        // Saving Result
        if (complain.getId() == null) {
            complainService.save(complain);
        } else {
            complainService.update(complain);
        }//end If-Else Block
        // return List Page
        return "redirect:/" + PACKAGE_ROOT + "complain/list";
    }
    
     ////////////////////////////////////////////////////////////////////////////
    /////////////// Medical Section  /////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
    
       @RequestMapping("/medicalsection/list")
    public String listMedicalSection(Model model) {
        // Define The Operation
        List<MedicalSection> medicalSectionType = medicalSectionService.getAllMedicalSections();
        /// Modeling
        model.addAttribute("medicalSectionType", medicalSectionType);
        // Getting List
        return PACKAGE_ROOT+  "medicalSectionList";
    }//end

    @RequestMapping("/medicalsection/add")
    public String addMedicalSection(Model model) {
        // Define The Operation
        model.addAttribute("operation", "Add");
        // Setting List
        return PACKAGE_ROOT+  "medicalSection";
    }//end

    @RequestMapping("/medicalsection/edit/{id}")
    public String editMedicalSection(@PathVariable("id") Integer medicalSectionId, Model model) {
        // Define The Operation
        MedicalSection medicalSection = medicalSectionService.get(medicalSectionId);
        // Adding Data to Model
        model.addAttribute("operation", "Update");
        model.addAttribute("medicalSectionEdit", medicalSection);
        // Getting List
        return PACKAGE_ROOT+ "medicalSection";
    }//end editExamineType

    @RequestMapping("/medicalsection/delete/{id}")
    public String deleteMedicalSection(@PathVariable("id") Integer medicalSectionId, Model model) {
        // Define The Operation
        MedicalSection medicalSectionDelete = medicalSectionService.get(medicalSectionId);
        // Deleting Current Examine Type
        medicalSectionService.delete(medicalSectionDelete);
        // return List Page
        return "redirect:/"+PACKAGE_ROOT+"medicalsection/list";
    }//end editExamineTypemonitor

    @RequestMapping(value = "/medicalsection/process", method = RequestMethod.POST)
    public String processMedicalSection(Model model, @ModelAttribute("medicalSection") MedicalSection medicalSection, BindingResult result) {
        // TODO Validating Object
        // Saving Result
        if (medicalSection.getId() == null) {
            medicalSectionService.save(medicalSection);
        } else {
            medicalSectionService.update(medicalSection);
        }//end If-Else Block
        // return List Page
        return "redirect:/"+PACKAGE_ROOT+"medicalsection/list";
    }
    
    ////////////////////////////////////////////////////////////////////////////
    /////////////// Medication Controller  /////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
    
       @RequestMapping("/medication/list")
    public String listMedication(Model model) {
        // Define The Operation
        List<Medication> medicationType = medicationService.getAllMedications();
        /// Modeling
        model.addAttribute("medicationType", medicationType);
        // Getting List
        return  PACKAGE_ROOT+ "medicationList";
    }//end

    @RequestMapping("/medication/add")
    public String addMedication(Model model) {
        List<MedicationClass> medicationClass=medicationClassService.getAllMedicationClasses();
        model.addAttribute("medicationClass", medicationClass);
        // Define The Operation
        model.addAttribute("operation", "Add");
        // Setting List
        return  PACKAGE_ROOT+ "medication";
    }//end

    @RequestMapping("/medication/edit/{id}")
    public String editMedication(@PathVariable("id") Integer medicationId, Model model) {
        // Define The Operation
        Medication medicationEdit = medicationService.get(medicationId);
        List<MedicationClass> medicationClass=medicationClassService.getAllMedicationClasses();
        model.addAttribute("medicationClass", medicationClass);
        // Adding Data to Model
        model.addAttribute("operation", "Update");
        model.addAttribute("medicationEdit", medicationEdit);
        // Getting List
        return PACKAGE_ROOT+ "medication";
    }//end editExamineType

    @RequestMapping("/medication/delete/{id}")
    public String deleteMedication(@PathVariable("id") Integer medicationId, Model model) {
        // Define The Operation
        Medication medication = medicationService.get(medicationId);
        // Deleting Current Examine Type
        medicationService.delete(medication);
        // return List Page
        return "redirect:/"+PACKAGE_ROOT+"medication/list";
    }//end editExamineTypemonitor

    @RequestMapping(value = "/medication/process", method = RequestMethod.POST)
    public String processMedication(Model model, @ModelAttribute("medication") Medication medication, BindingResult result) {
        // TODO Validating Object
        // Saving Result
        if (medication.getId() == null) {
            medicationService.save(medication);
        } else {
            medicationService.update(medication);
        }//end If-Else Block
        // return List Page
        return "redirect:/"+PACKAGE_ROOT+"medication/list";
    }
    
     ////////////////////////////////////////////////////////////////////////////
    /////////////// Diagnosis Controller  /////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
    
       @RequestMapping("/diagnosis/list")
    public String listDiagnosis(Model model) {
        // Define The Operation
        List<Diagnosis> diagnosisType = diagnosisService.getAllDiagnosises();
                
        /// Modeling
        model.addAttribute("diagnosisType", diagnosisType);
        // Getting List
        return  PACKAGE_ROOT+ "diagnosisList";
    }//end

    @RequestMapping("/diagnosis/add")
    public String addDiagnosis(Model model) {
        List<MedicalSection> medicalSections=medicalSectionService.getAllMedicalSections();
        model.addAttribute("medicalSections",medicalSections);
        model.addAttribute("operation", "Add");
        
        // Setting List
        return  PACKAGE_ROOT+ "diagnosis";
    }//end

    @RequestMapping("/diagnosis/edit/{id}")
    public String editDiagnosis(@PathVariable("id") Integer diagnosisId, Model model) {
          List<MedicalSection> medicalSections=medicalSectionService.getAllMedicalSections();
        model.addAttribute("medicalSections",medicalSections);
        Diagnosis diagnosis = diagnosisService.get(diagnosisId);
        // Adding Data to Model
        model.addAttribute("operation", "Update");
        model.addAttribute("diagnosis", diagnosis);
        // Getting List
        return PACKAGE_ROOT+ "diagnosis";
    }//end editExamineType

    @RequestMapping("/diagnosis/delete/{id}")
    public String deleteDiagnosis(@PathVariable("id") Integer diagnosisId, Model model) {
        // Define The Operation
        Diagnosis diagnosis = diagnosisService.get(diagnosisId);
        // Deleting Current Examine Type
        diagnosisService.delete(diagnosis);
        // return List Page
        return "redirect:/"+PACKAGE_ROOT+"diagnosis/list";
    }//end editExamineTypemonitor

    @RequestMapping(value = "/diagnosis/process", method = RequestMethod.POST)
    public String processDiagnosis(Model model, @ModelAttribute("diagnosis") Diagnosis diagnosis, BindingResult result) {
        // TODO Validating Object
        // Saving Result
        if (diagnosis.getId() == null) {
            diagnosisService.save(diagnosis);
        } else {
            diagnosisService.update(diagnosis);
        }//end If-Else Block
        // return List Page
        return "redirect:/"+PACKAGE_ROOT+"diagnosis/list";
    }

    
     ////////////////////////////////////////////////////////////////////////////
    /////////////// MedicationClass Controller  /////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
    
       @RequestMapping("/medicationclass/list")
    public String listMedicationClass(Model model) {
        // Define The Operation
        List<MedicationClass> medicationClassType = medicationClassService.getAllMedicationClasses();
        /// Modeling
        model.addAttribute("medicationClassType", medicationClassType);
        // Getting List
        return  PACKAGE_ROOT+ "medicationClassList";
    }//end

    @RequestMapping("/medicationclass/add")
    public String addMedicationClass(Model model) {
        // Define The Operation
        model.addAttribute("operation", "Add");
        // Setting List
        return  PACKAGE_ROOT+ "medicationClass";
    }//end

    @RequestMapping("/medicationclass/edit/{id}")
    public String editMedicationClass(@PathVariable("id") Integer medicationclassId, Model model) {
        // Define The Operation
        MedicationClass medicationClassEdit = medicationClassService.get(medicationclassId);
        // Adding Data to Model
        model.addAttribute("operation", "Update");
        model.addAttribute("medicationClassEdit", medicationClassEdit);
        // Getting List
        return PACKAGE_ROOT+ "medicationClass";
    }//end editExamineType

    @RequestMapping("/medicationclass/delete/{id}")
    public String deleteMedicationClass(@PathVariable("id") Integer medicationClassId, Model model) {
        // Define The Operation
        MedicationClass medicationClass = medicationClassService.get(medicationClassId);
        // Deleting Current Examine Type
       medicationClassService.delete(medicationClass);
        // return List Page
        return "redirect:/"+PACKAGE_ROOT+"medicationclass/list";
    }//end editExamineTypemonitor

    @RequestMapping(value = "/medicationclass/process", method = RequestMethod.POST)
    public String processMedicationClass(Model model, @ModelAttribute("medicationClass") MedicationClass medicationClass, BindingResult result) {
        // TODO Validating Object
        // Saving Result
        if (medicationClass.getId() == null) {
            medicationClassService.save(medicationClass);
        } else {
            medicationClassService.update(medicationClass);
        }//end If-Else Block
        // return List Page
        return "redirect:/"+PACKAGE_ROOT+"medicationclass/list";
    }

     ////////////////////////////////////////////////////////////////////////////
    /////////////// Prescription Controller  /////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
    
       @RequestMapping("/prescription/list")
    public String listPrescription(Model model) {
        // Define The Operation
        List<Prescription> prescriptionType = prescriptionService.getAllPrescriptions();
        /// Modeling
        model.addAttribute("prescriptionType", prescriptionType);
        // Getting List
        return  PACKAGE_ROOT+ "prescriptionList";
    }//end

    @RequestMapping("/prescription/add")
    public String addPrescription(Model model) {
       List<PrescriptionType> prescriptionType=prescriptionTypeService.getAllPrescriptionTypes();
       model.addAttribute("prescriptionType", prescriptionType);
        // Define The Operation
        model.addAttribute("operation", "Add");
        // Setting List
        return  PACKAGE_ROOT+ "prescription";
    }//end

    @RequestMapping("/prescription/edit/{id}")
    public String editPrescription(@PathVariable("id") Integer prescriptionId, Model model) {
        // Define The Operation
        Prescription prescriptionEdit = prescriptionService.get(prescriptionId);
        List<PrescriptionType> prescriptionType=prescriptionTypeService.getAllPrescriptionTypes();
       model.addAttribute("prescriptionType", prescriptionType);
        // Adding Data to Model
        model.addAttribute("operation", "Update");
        model.addAttribute("prescriptionEdit", prescriptionEdit);
        // Getting List
        return PACKAGE_ROOT+ "prescription";
    }//end editExamineType

    @RequestMapping("/prescription/delete/{id}")
    public String deletePrescription(@PathVariable("id") Integer prescriptionId, Model model) {
        // Define The Operation
        Prescription prescriptionClass = prescriptionService.get(prescriptionId);
        // Deleting Current Examine Type
       prescriptionService.delete(prescriptionClass);
        // return List Page
        return "redirect:/"+PACKAGE_ROOT+"prescription/list";
    }//end editExamineTypemonitor

    @RequestMapping(value = "/prescription/process", method = RequestMethod.POST)
    public String processPrescription(Model model, @ModelAttribute("prescription") Prescription prescription, BindingResult result) {
        // TODO Validating Object
        // Saving Result
        if (prescription.getId() == null) {
            prescriptionService.save(prescription);
        } else {
            prescriptionService.update(prescription);
        }//end If-Else Block
        // return List Page
        return "redirect:/"+PACKAGE_ROOT+"prescription/list";
    }

    ////////////////////////////////////////////////////////////////////////////
    /////////////// PrescriptionType Controller  /////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
    
       @RequestMapping("/prescriptiontype/list")
    public String listPrescriptionType(Model model) {
        // Define The Operation
        List<PrescriptionType> prescriptionTypee = prescriptionTypeService.getAllPrescriptionTypes();
        /// Modeling
        model.addAttribute("prescriptionTypee", prescriptionTypee);
        // Getting List
        return  PACKAGE_ROOT+ "prescriptionTypeList";
    }//end

    @RequestMapping("/prescriptiontype/add")
    public String addPrescriptionType(Model model) {
        // Define The Operation
        model.addAttribute("operation", "Add");
        // Setting List
        return  PACKAGE_ROOT+ "prescriptionType";
    }//end

    @RequestMapping("/prescriptiontype/edit/{id}")
    public String editPrescriptionType(@PathVariable("id") Integer prescriptionTypeId, Model model) {
        // Define The Operation
        PrescriptionType prescriptionTypes = prescriptionTypeService.get(prescriptionTypeId);
        // Adding Data to Model
        model.addAttribute("operation", "Update");
        model.addAttribute("prescriptionTypes", prescriptionTypes);
        // Getting List
        return PACKAGE_ROOT+ "prescriptionType";
    }//end editExamineType

    @RequestMapping("/prescriptiontype/delete/{id}")
    public String deletePrescriptionType(@PathVariable("id") Integer prescriptionTypeId, Model model) {
        // Define The Operation
        PrescriptionType prescriptiontype = prescriptionTypeService.get(prescriptionTypeId);
        // Deleting Current Examine Type
       prescriptionTypeService.delete(prescriptiontype);
        // return List Page
        return "redirect:/"+PACKAGE_ROOT+"prescriptiontype/list";
    }//end editExamineTypemonitor

    @RequestMapping(value = "/prescriptiontype/process", method = RequestMethod.POST)
    public String processPrescriptionType(Model model, @ModelAttribute("prescriptiontype") PrescriptionType prescriptiontype, BindingResult result) {
        // TODO Validating Object
        // Saving Result
        if (prescriptiontype.getId() == null) {
            prescriptionTypeService.save(prescriptiontype);
        } else {
            prescriptionTypeService.update(prescriptiontype);
        }//end If-Else Block
        // return List Page
        return "redirect:/"+PACKAGE_ROOT+"prescriptiontype/list";
    }


}
