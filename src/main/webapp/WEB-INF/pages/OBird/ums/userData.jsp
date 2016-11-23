<%-- 
    Document   : adminData
    Created on : Nov 11, 2016, 10:55:47 PM
    Author     : khaledeng
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<span class="button b-close"><span class="popup_close_icon">X</span></span>
    
   
    <div class="popupMyHeader">
        <c:choose>
            <c:when test="${register}">
                    <span class="logo">Register User</span>
            </c:when>   
            <c:otherwise>
                    <span class="logo">${myUser.firstName} ${myUser.middleName} ${myUser.lastName} Profile</span>
            </c:otherwise>
        </c:choose>
        
    </div> 

    <form id="aboutChefForm" method="POST" action="/zmed/ums/user/createOrUpdate" modelAttribute="userHolder" accept-charset="utf-8" >
    <input type="hidden" name="userId" value="${myUser.id}"/>
    <div>
        
                <div class="patientLabelTitle">
                    
                    <div class="userDivContainer">
                   <img class="userPopupAvatar" src="<c:url value='/resources/images/avatar.jpg'/>" />
            </div>
            
            <label class="userDataText" > User Type : </label>
              
                <div class="styled-select slate usertype">
                    <select id="roleName" name="roleName" style="margin-left: 8px">
                        <c:forEach items="${roles}" var="role">
                            <option value="${role.name}">${role.displayName}</option>    
                            <%-- <c:choose>
                                    <c:when test="${company.nameEn eq patient.insuranceCompany.nameEn}">
                                        <option value="${company.id}" selected="selected">${company.nameEn}</option>            
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${company.id}">${company.nameEn}</option>            
                                    </c:otherwise>
                                </c:choose>  --%>
                        </c:forEach>
                    </select>
                
                </div>        
            
                    </div>
            
        </div>   
    
    
        <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText">Full Name : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="firstName" placeholder="First name" class="patientInputFieldDesign" required value="${myUser.firstName}"/>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="middleName" placeholder="Middle name" class="patientInputFieldDesign" required value="${myUser.middleName}"/> 
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="lastName" placeholder="Last name" class="patientInputFieldDesign" style="width:158px!important;" required value="${myUser.lastName}"/>
            </div>
        </div>
        
        <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText"> UserName : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="userName" placeholder="UserName" class="patientInputFieldDesign" style="width:180px!important;margin-left: 3px;" required value="${myUser.auth.userName}"/>
            </div>
            
             <div class="patientLabelTitle">
                <label class="patientDataText"> Email : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="email" placeholder="E-mail" class="patientInputFieldDesign" style="width:220px!important;margin-left: 1px;" required value="${myUser.email}"/>
            </div>    
        </div>
        <c:if test="${register}">
           <div class="patientDivContainer">
                <div class="patientLabelTitle">
                    <label class="patientDataText"> Password : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="password" name="password" placeholder="password" class="patientInputFieldDesign" style="width:150px!important;margin-left: 10px;" required />
                </div>

                <div class="patientLabelTitle">
                    <label class="patientDataText"> Retype-Password : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="password" name="rePassword" placeholder="Retype Password" class="patientInputFieldDesign" style="width:160px!important;margin-left: 10px;" required />
                </div>
            </div>        
        </c:if> 
        <div class="patientDivContainer">
                 
                <div class="patientLabelTitle">
                    <label class="patientDataText"> Phone-1 : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="text" name="phoneNumber1" placeholder="Telephone-1" class="patientInputFieldDesign" style="margin-left: 18px;width: 167px;" required value="${myUser.phoneNumber1}"/>
                </div>
                
                <div class="patientLabelTitle">
                    <label class="patientDataText" style="margin-left: 50px;"> Phone-2 : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="text" name="phoneNumber2" placeholder="Telephone-2" class="patientInputFieldDesign" style="margin-left: 25px;width: 167px;" required value="${myUser.phoneNumber2}"/>
                </div>
                
        </div>        
        
        
                
        <div class="patientDivContainer">
                 
                <div class="patientLabelTitle">
                    <label class="patientDataText"> Address : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="text" name="address" placeholder="Address" class="patientInputFieldDesign" style="width:507px!important; margin-left: 22px;" required value="${myUser.address}"/>
                </div>
        </div>        
                      
                
        <div class="patientDivContainer">
              
            <button id="reserveNow" class="submitPatientData">${mode}</button>  
            
        </div>
                  
     </div>               
                    
    </form>
