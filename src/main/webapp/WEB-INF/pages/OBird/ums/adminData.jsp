<%-- 
    Document   : adminData
    Created on : Nov 11, 2016, 10:55:47 PM
    Author     : khaledeng
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script>
     $( "#addAdminUser" ).click(function() {   
        /// Getting Admin Information
        var userHolder = $('#submitAdminForm').serializeObject();
        var error=[];
        var errorField=[];
        // Submit Request 
        var request = $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/ocare/ums/admin/createOrUpdate",
                data: JSON.stringify(userHolder),
                dataType: "json"                
            }); // Ending Json Request
            /// Check When Submition Done
            request.done(function(errors) {
                if(errors.length > 0){                
                    processErrors(errors);
                }else{
                   // window.location.href = "/ocare/ums/admin";  
                }// end if-Else
            });
           
            function processErrors(errors){
                $.each(errors, function(idx, obj) {
                    var fieldError=obj.propertyName+"Error";  
                    var errorMessage=obj.errorMessage;
                    console.log(fieldError+" : "+errorMessage);
                    showError(fieldError,errorMessage);
                });
            }//end showErrors
           // console.log("ERRORS :   "+errors.size());
           function showError(errorField,errorMessage){
                console.log("EEEX");
                $("."+errorField+"").append(errorMessage);
           }//end showError Function
           
     });
</script>

<!DOCTYPE html>
<span class="button b-close"><span class="popup_close_icon">X</span></span>
    
   
        <c:choose>
            <c:when test="${register}">
                    <span class="logo">Register Admin</span>
            </c:when>   
            <c:otherwise>
                    <span class="logo">${myUser.firstName} ${myUser.middleName} ${myUser.lastName} Profile</span>
            </c:otherwise>
        </c:choose>

  <form id="submitAdminForm" method="POST" action="/ocare/ums/admin/createOrUpdate" modelAttribute="userHolder" accept-charset="utf-8">                
    <input type="hidden" name="userId" value="${myUser.id}"/>
    <input type="hidden" name="roleName" value="ADMIN"/>
    <div>
    <img class="userPopupAvatar" src="<c:url value='/resources/images/admin1.png'/>" />
    
        <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText">Full Name* : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="firstName" placeholder="First name" class="patientInputFieldDesign" value="${myUser.firstName}"/>
            </div>
            
            <div class="PatientInputFields">
                <input type="text" name="middleName" placeholder="Middle name" class="patientInputFieldDesign" value="${myUser.middleName}"/> 
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="lastName" placeholder="Last name" class="patientInputFieldDesign" style="width:158px!important;" value="${myUser.lastName}"/>
            </div>
        </div>
        <div class="firstNameError">
                
        </div>    
            
        <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText"> UserName* : </label>
            </div>
            
            <div class="PatientInputFields">
                <input type="text" name="userName" placeholder="UserName" class="patientInputFieldDesign" style="width:180px!important;margin-left: 3px;" value="${myUser.auth.userName}"/>
            </div>  
            <div class="userNameError">
            </div>
            
             <div class="patientLabelTitle">
                <label class="patientDataText"> Email : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="email" placeholder="E-mail" class="patientInputFieldDesign" style="width:220px!important;margin-left: 1px;" value="${myUser.email}"/>
            </div>
            <div class="emailError">
            </div> 

        </div>
        <c:if test="${register}">
           <div class="patientDivContainer">
                <div class="patientLabelTitle">
                    <label class="patientDataText"> Password* : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="password" name="password" placeholder="password" class="patientInputFieldDesign" style="width:150px!important;margin-left: 10px;"  />
                </div>
                <div class="passwordError">
                 </div>
               
                <div class="patientLabelTitle">
                    <label class="patientDataText"> Retype-Password* : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="password" name="rePassword" placeholder="Retype Password" class="patientInputFieldDesign" style="width:160px!important;margin-left: 10px;" />
                </div>
                <div class="rePasswordError">
                 </div>
            </div>        
        </c:if> 
        <div class="patientDivContainer">
                 
                <div class="patientLabelTitle">
                    <label class="patientDataText"> Phone-1* : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="text" name="phoneNumber1" placeholder="Telephone-1" class="patientInputFieldDesign" style="margin-left: 18px;width: 167px;" value="${myUser.phoneNumber1}"/>
                </div>
                
                <div class="patientLabelTitle">
                    <label class="patientDataText" style="margin-left: 50px;"> Phone-2 : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="text" name="phoneNumber2" placeholder="Telephone-2" class="patientInputFieldDesign" style="margin-left: 25px;width: 167px;" value="${myUser.phoneNumber2}"/>
                </div>
                
        </div>        
        
        
                
        <div class="patientDivContainer">
                 
                <div class="patientLabelTitle">
                    <label class="patientDataText"> Address : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="text" name="address" placeholder="Address" class="patientInputFieldDesign" style="width:507px!important; margin-left: 22px;" value="${myUser.address}"/>
                </div>
        </div>        
                  
     </div>               
     </form>
     <div class="patientDivContainer">
              
            <button id="addAdminUser" class="submitPatientData">${mode}</button>  
            
        </div>           
