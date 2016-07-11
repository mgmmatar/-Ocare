/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.dao.impl;

import com.obird.core.GenericDAO;
import com.ocare.obook.dao.PatientDao;
import com.ocare.obook.domain.Patient;
import com.ocare.obook.holder.FastPatient;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate4.HibernateCallback;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author khaledeng
 */
@Repository("patientDao")
public class PatientDaoImpl extends GenericDAO<Patient> implements PatientDao {

    {
        super.setClass(Patient.class);
    }

    @Override
    public List<Patient> getAllPatients() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Patient>>() {
            @Override
            public List<Patient> doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Patient p where p.isDeleted = :deleted");
                query.setBoolean("deleted", false);
                return query.list();
            }
        });
    }

    @Override
    public Patient getByCode(final String code) {
        return getHibernateTemplate().execute(new HibernateCallback<Patient>() {
            @Override
            public Patient doInHibernate(Session sn) throws HibernateException {
                Query query = sn.createQuery("from Patient p where p.code = :code and p.isDeleted = :deleted");
                query.setString("code", code);
                query.setBoolean("deleted", false);
                return (Patient) query.uniqueResult();
            }
        });
    }

    @Override
    @Transactional
    public void deletePatient(Patient patient) {
        patient.setIsDeleted(true);
        // Update Patient Information
        update(patient);
    }

    @Override
    public List<Patient> searchPatient(final String patientName, final String patientCode, final String patientPhone) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Patient>>() {
            @Override
            public List<Patient> doInHibernate(Session sn) throws HibernateException {
                /// creating Query String
                String queryString = "from Patient p where p.isDeleted = :deleted ";
                /// checker for Input
                if ((!patientName.isEmpty()) && (patientName != null)) {
                    queryString += " and (p.fName like :patientName or p.midName like :patientName or p.lName like :patientName ) ";
                    System.out.println(">>> " + patientName);
                }//end if condition
                if ((!patientCode.isEmpty()) && (patientCode != null)) {
                    queryString += " and p.code = :patientCode ";
                    System.out.println(">>> " + patientCode);
                }//end if condition
                if ((!patientPhone.isEmpty()) && (patientPhone != null)) {
                    queryString += " and (p.phoneNumber1 = :patientPhone or p.phoneNumber2 = :patientPhone) ";
                    System.out.println(">>> " + patientPhone);
                }//end if condition
                System.out.println(">> " + queryString);
                Query query = sn.createQuery(queryString);
                query.setBoolean("deleted", false);
                if ((!patientName.isEmpty()) && (patientName != null)) {
                    query.setString("patientName", '%' + patientName + '%');
                }//end if condition
                if ((!patientCode.isEmpty()) && (patientCode != null)) {
                    query.setString("patientCode", patientCode);
                }//end if condition
                if ((!patientPhone.isEmpty()) && (patientPhone != null)) {
                    query.setString("patientPhone", patientPhone);
                }//end if condition

                // return result
                return (List<Patient>) query.list();
            }
        });
    }

    @Override
    public List<FastPatient> getFastPatientList(final String patientInfo) {
        return getHibernateTemplate().execute(new HibernateCallback<List<FastPatient>>() {
            @Override
            public List<FastPatient> doInHibernate(Session sn) throws HibernateException {
                /// creating Query String
                Query query = sn.createQuery("select p.id as id , p.fName as fName , p.midName as mName , p.lName as lName , p.code as code "
                        + " , p.phoneNumber1 as phoneNumber from Patient p "
                        + " where p.isDeleted = :deleted and ( p.code like :patientCode or p.fName like :patientFName or p.midName like :PatientMidName "
                        + " or p.lName like :PatientLName or p.phoneNumber1 like :patientPhoneNumber1 or p.phoneNumber2 like :patientPhoneNumber2  "
                        + " ) ");
                query.setString("patientCode","%"+patientInfo+"%");
                query.setString("patientFName","%"+patientInfo+"%");
                query.setString("PatientMidName","%"+patientInfo+"%");
                query.setString("PatientLName","%"+patientInfo+"%");
                query.setString("patientPhoneNumber1","%"+patientInfo+"%");
                query.setString("patientPhoneNumber2","%"+patientInfo+"%");
                query.setBoolean("deleted", false);
                // transform the Returned Results
                List<FastPatient> fastPatientList=query.setResultTransformer(Transformers.aliasToBean(FastPatient.class)).list();  
                // return Transformed List
                return fastPatientList;
            }
        });
    }

    @Override
    public List<Patient> searchForPatient(final String patientInfo) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Patient>>() {
            @Override
            public List<Patient> doInHibernate(Session sn) throws HibernateException {
                /// creating Query String
                Query query = sn.createQuery("select p from Patient p "
                        + " where p.isDeleted = :deleted and ( p.code like :patientCode or p.fName like :patientFName or p.midName like :PatientMidName "
                        + " or p.lName like :PatientLName or p.phoneNumber1 like :patientPhoneNumber1 or p.phoneNumber2 like :patientPhoneNumber2  "
                        + " ) ");
                query.setString("patientCode","%"+patientInfo+"%");
                query.setString("patientFName","%"+patientInfo+"%");
                query.setString("PatientMidName","%"+patientInfo+"%");
                query.setString("PatientLName","%"+patientInfo+"%");
                query.setString("patientPhoneNumber1","%"+patientInfo+"%");
                query.setString("patientPhoneNumber2","%"+patientInfo+"%");
                query.setBoolean("deleted", false);
                // return Transformed List
                return (List<Patient>)query.list();
            }
        });
    }

}//end
