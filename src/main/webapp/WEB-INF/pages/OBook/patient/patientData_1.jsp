<%-- 
    Document   : patientData
    Created on : Sep 5, 2016, 11:40:02 PM
    Author     : khaledeng
--%>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<style>
  
</style>

<!DOCTYPE html>
<span class="button b-close"><span class="popup_close_icon">X</span></span>
    
   
    <div class="popupMyHeader">
        <span class="logo">${patient.fName} ${patient.midName} ${patient.lName} Profile</span>
    </div> 

    <form id="aboutChefForm" method="POST" action="/zmed/patient/process" modelAttribute="patient" accept-charset="utf-8" >
    <input type="hidden" name="id" value="${patient.id}"/>
    
    
    <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText">Full Name : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="fName" placeholder="First name" class="patientInputFieldDesign" required value="${patient.fName}"/>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="midName" placeholder="Middle name" class="patientInputFieldDesign" required value="${patient.midName}"/> 
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="lName" placeholder="Last name" class="patientInputFieldDesign" required value="${patient.lName}"/>
            </div>
    </div>
            
    <div class="patientDivContainer">
            
            <div class="patientLabelTitle">
                <label class="patientDataText"> Birth Date : </label>
            </div>
        
            <div class="PatientInputFields">
                
                <div class="styled-select slate month">
                   
                    <select id="month">
                        <c:forEach items="${months}" var="month">
                                <option>${month}</option>
                        </c:forEach>
                    </select>
                    
                    
                </div>
                
                
                <div class="styled-select slate day">
                    <select id="day">
                        <c:forEach items="${days}" var="day">
                                <option>${day}</option>
                        </c:forEach>
                    </select>
                </div>
                
                
                <div class="styled-select slate year">
                    <select id="theYear">
                        <c:forEach items="${years}" var="year">
                                <option>${year}</option>
                        </c:forEach>
                    </select>
                </div>
                
            </div>
            
        
            <div class="patientLabelTitle">
                <label class="patientDataText"> Age : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="age" placeholder="Age" class="patientInputFieldDesign" style="width:120px!important" required value="${patient.age}"/>
            </div>
           
        </div>     
            
        
        <div class="patientDivContainer">
                 
                <div class="patientLabelTitle">
                    <label class="patientDataText"> Phone-1 : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="text" name="phoneNumber1" placeholder="Telephone-1" class="patientInputFieldDesign" style="margin-left: 21px;width: 167px;" required value="${patient.phoneNumber1}"/>
                </div>
                
                <div class="patientLabelTitle">
                    <label class="patientDataText" style="margin-left: 50px;"> Phone-2 : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="text" name="phoneNumber2" placeholder="Telephone-2" class="patientInputFieldDesign" style="margin-left: 21px;width: 167px;" required value="${patient.phoneNumber2}"/>
                </div>
                
        </div>        
        
        
                
        <div class="patientDivContainer">
                 
                <div class="patientLabelTitle">
                    <label class="patientDataText"> Address : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="text" name="address" placeholder="Address" class="patientInputFieldDesign" style="width:505px!important; margin-left: 25px;" required value="${patient.address}"/>
                </div>
        </div>        
                
        <div class="patientDivContainer">
                 
                <div class="patientLabelTitle">
                    <label class="patientDataText"> E-mail : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="email" name="email" placeholder="E-mail" class="patientInputFieldDesign" style="width:505px!important; margin-left: 33px;" required value="${patient.email}"/>
                </div>
        </div>        
                
                
                
        <div class="patientDivContainer">
                 
                <div class="patientLabelTitle">
                    <label class="patientDataText"> Gender : </label>
                </div>

                <div class="patientRadio">
                    Here is Gender
                </div>
               
            
                
        </div>
                   
                
       <table class="registerationTable">
       
            <tr>
                 <td>
                     <label class="registerLable">Gender  </label>
                 </td>
                 <td>
                        <c:if test="${patient.gender eq 'Male'||empty patient.gender}">
                            <input type="radio" name="gender" value="Male" checked="checked" class="registerField">Male
                            <input type="radio" name="gender" value="Female" class="registerField">Female
                        </c:if>
                        <c:if test="${patient.gender eq 'Female'}">
                             <input type="radio" name="gender" value="Male" class="registerField">Male
                             <input type="radio" name="gender" value="Female" checked="checked" class="registerField">Female
                        </c:if>  
                 </td>    
            </tr>

            
            
            
            <tr>
                 <td>
                     <label class="registerLable">Email </label>
                 </td>
                 <td>
                     <input type="email" name="email" id="email" placeholder="E-mail" class="registerField" required value="${patient.email}"/>
                 </td>    
            </tr>
            
            
            
            <tr>
                 <td>
                     <label class="registerLable">Insurance Company</label>
                 </td>
                 <td>
                     <select name="insuranceCompany" id="insuranceCompany" class="registerField">
                        <option value="0" selected="selected">--Select--</option>
                            <c:forEach items="${insuranceCompanies}" var="company">
                                <c:choose>
                                    <c:when test="${company.nameEn eq patient.insuranceCompany.nameEn}">
                                        <option value="${company.id}" selected="selected">${company.nameEn}</option>            
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${company.id}">${company.nameEn}</option>            
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach> 
                    </select>
                 </td>    
            </tr>
            <tr>
                <td>
                    <button type="submit">${operation}<i class=""></i></button>
                </td> 
            </tr>
            
        </table>
    </form>