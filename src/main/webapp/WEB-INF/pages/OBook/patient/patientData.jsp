<%-- 
    Document   : patientData
    Created on : Sep 5, 2016, 11:40:02 PM
    Author     : khaledeng
--%>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<span class="button b-close"><span class="popup_close_icon">X</span></span>
    
   
    <div class="popupMyHeader">
       <c:if test="${mode eq 'Register'}">
            <span class="logo">Register New Patient</span>
        </c:if>
       <c:if test="${mode eq 'Save Changes'}">
           <span class="logo">${patient.fName} ${patient.midName} ${patient.lName} Profile</span>
        </c:if> 
        
    </div> 

    <form id="aboutChefForm" method="POST" action="/ocare/patient/process" modelAttribute="patient" accept-charset="utf-8" >
    <input type="hidden" name="id" value="${patient.id}"/>
    
    <div>
    <img class="patientPopupAvatar" src="<c:url value='/resources/images/avatar.jpg'/>" />
    
    <c:if test="${mode ne 'Register'}">
        <button type="button" class="registerbuttonheader controlAction openProfilePage" id="gotoProfile">Go to Profile</button>
    </c:if>
    
    <c:if test="${patient.gender eq 'Male'||empty patient.gender}">
        <input type="radio" name="gender" value="Male" checked="checked" id="radio1" class="css-checkbox"><label for="radio1" class="css-label radGroup1">Male</label>
        <input type="radio" name="gender" value="Female" id="radio2" class="css-checkbox"><label for="radio2" class="css-label radGroup1">Female</label>
    </c:if>
    <c:if test="${patient.gender eq 'Female'}">
         <input type="radio" name="gender" value="Male" id="radio1" class="css-checkbox"><label for="radio1" class="css-label radGroup1">Male</label>
         <input type="radio" name="gender" value="Female" id="radio2"  checked="checked" class="css-checkbox"><label for="radio2" class="css-label radGroup1">Female</label>
    </c:if>    
        
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
                   <fmt:formatDate value="${patient.birthDate}" pattern="MMMM" var="patientBirthMonth" />
                    <select id="month" name="birthMonth">
                        <c:forEach items="${months}" var="month" varStatus="counter">
                            <c:choose>
                                <c:when test="${month eq patientBirthMonth}">
                                    <option selected="selected">${month}</option>
                                </c:when>
                                <c:otherwise>
                                    <option>${month}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                    
                    
                </div>
                
                
                <div class="styled-select slate day">
                    <fmt:formatDate value="${patient.birthDate}" pattern="dd" var="patientBirthDay" />
                    <select id="day" name="birthDay">
                        <c:forEach items="${days}" var="day">
                            <c:choose>
                                <c:when test="${patientBirthDay eq day}">
                                    <option selected="selected">${day}</option>
                                </c:when>
                                <c:otherwise>
                                    <option>${day}</option>
                                </c:otherwise>
                            </c:choose>                            
                        </c:forEach>
                    </select>
                </div>
                
                
                <div class="styled-select slate year">
                    <fmt:formatDate value="${patient.birthDate}" pattern="yyyy" var="patientBirthYear" />
                    <select id="theYear" name="birthYear">
                        <c:forEach items="${years}" var="year">
                            <c:choose>
                                <c:when test="${patientBirthYear eq year}">
                                    <option selected="selected">${year}</option>
                                </c:when>
                                <c:otherwise>
                                    <option>${year}</option>
                                </c:otherwise>
                            </c:choose>                            
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
                    <label class="patientDataText" style="margin-top: 5px" > Insurance : </label>
                </div>

                <div class="styled-select slate company">
                    <select name="insuranceCompany" id="company" style="margin-left: 8px">
                        <c:forEach items="${companys}" var="company">
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
                </div>
        
            <button id="reserveNow" class="submitPatientData">${mode}</button>  
            
        </div>
                   
          
                
      
     </div>               
                    
    </form>