package com.ocare.obook.domain;

import com.ocare.UMS.domain.MyUser;
import com.ocare.oclinic.domain.PatientExtra;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.ForeignKey;
import org.hibernate.annotations.Where;

@Entity
@Table(name="patient")
public class Patient {
///////////////////////////////	
//// Patient Attributes 
//////////////////////////////    
	private Integer id;
	private String code;
	private String fName;
	private String midName;
	private String lName;
	private String gender;
	private String address;
	private String phoneNumber1;
	private String phoneNumber2;
	private String email;
	private Date creationDate;
	private Date lastModifiedDate;
	private Date birthDate;
	private String age;
	private MyUser registeredBy;
	private MyUser modifiedBy;
        private InsuranceCompany insuranceCompany;
        private boolean isDeleted;
        private List<PatientExtra> patientExtras;
//////////////////////////////////////////////////////
//  Getters and Setters
//////////////////////////////////	
        
        @Id
        @Column(name="id")
        @GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="code",nullable =true)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name="fName",nullable =true)
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	
	@Column(name="midName",nullable =true)
	public String getMidName() {
		return midName;
	}
	public void setMidName(String midName) {
		this.midName = midName;
	}
	
	@Column(name="lName",nullable =true)
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	
	@Column(name="gender",nullable =true)
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	@Column(name="address",nullable =true)
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(name="phone1",nullable =true)
	public String getPhoneNumber1() {
		return phoneNumber1;
	}
	public void setPhoneNumber1(String phoneNumber1) {
		this.phoneNumber1 = phoneNumber1;
	}
	
	@Column(name="phone2",nullable =true)
	public String getPhoneNumber2() {
		return phoneNumber2;
	}
	public void setPhoneNumber2(String phoneNumber2) {
		this.phoneNumber2 = phoneNumber2;
	}
	
	@Column(name="email",nullable =true)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
        @Temporal(TemporalType.TIMESTAMP)
	@Column(name="creationDate",nullable =true)
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	
        @Temporal(TemporalType.TIMESTAMP)
	@Column(name="lastModifiedDate",nullable =true)
	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}
	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	
        @Temporal(TemporalType.DATE)
	@Column(name="birthDate",nullable =true)
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	
	@Column(name="age",nullable =true)
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
        @ForeignKey(name="registeredBy")
        @JoinColumn(name="registeredBy" , nullable=true)
        @ManyToOne(fetch = FetchType.LAZY)
	public MyUser getRegisteredBy() {
		return registeredBy;
	}
	public void setRegisteredBy(MyUser registeredBy) {
		this.registeredBy = registeredBy;
	}
	
        @ForeignKey(name="modifiedBy")
        @JoinColumn(name="modifiedBy" , nullable=true)
        @ManyToOne(fetch = FetchType.LAZY)
	public MyUser getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(MyUser modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

        @ForeignKey(name="insuranceId")
        @JoinColumn(name="insuranceId" , nullable=true)
        @ManyToOne(fetch = FetchType.LAZY)        
        public InsuranceCompany getInsuranceCompany() {
            return insuranceCompany;
        }

        public void setInsuranceCompany(InsuranceCompany insuranceCompany) {
            this.insuranceCompany = insuranceCompany;
        }

        @Column(name="isDeleted",nullable =true)
        public boolean getIsDeleted() {
            return isDeleted;
        }

        public void setIsDeleted(boolean isDelted) {
            this.isDeleted = isDelted;
        }

        @OneToMany( mappedBy = "patient", fetch = FetchType.EAGER)
        @Cascade(CascadeType.SAVE_UPDATE)
        public List<PatientExtra> getPatientExtras() {
            return patientExtras;
        }

        public void setPatientExtras(List<PatientExtra> patientExtras) {
            this.patientExtras = patientExtras;
        }

   
        
	
}