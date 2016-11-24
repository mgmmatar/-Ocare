
<%--
    Document   : reservationProcess
    Created on : Sep 24, 2015, 12:54:02 AM
    Author     : khaledeng
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
    
    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
         <title> Patient Profile </title>
        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.carousel.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.theme.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/popup.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/font-awesome.min.css'/>">
         
        
        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.bpopup.min.js'/>"></script>
       
         

        <!-- NEW -->
        <script type="text/javascript" src="<c:url value='/resources/js/nprogress.js'/>"></script>
        <script>
            NProgress.start();
        </script>
        <!--- Page Styles--->
        <!-- Bootstrap Styles-->
            <!-- FontAwesome Styles-->
            <link href="<c:url value='/resources/css/font-awesome.css'/>" rel="stylesheet" />
            <!-- Morris Chart Styles-->
            <link href="<c:url value='/resources/js/morris/morris-0.4.3.min.css'/>" rel="stylesheet" />
            <link href="<c:url value='/resources/css/animation.css'/>" rel="stylesheet" />
            <!-- Custom Styles-->
            <!-- Google Fonts-->
            <link href="<c:url value='/resources/css/googlefonts.css'/>" rel="stylesheet" />


        <script type="text/javascript">
            $(document).ready(function() {
              
            });
        </script>
            
        <%@include file="../basic/scripts.jsp" %>
        
    </head>
    
       
         <body class="nav-md">

            <div class="container body">

                <div class="main_container">
 
                    <!---  Importing SideBar --->

                    <%@include file="../basic/sidebar.jsp" %>

                    <!-- Header -->

                    <%@include file="../basic/header.jsp" %>

                     <div class="right_col" role="main">
     
                    <div class="clearfix"></div>   
           
                  <!-- Content --->
          
             <div id="page-wrapper">
                <div id="page-inner">
                    <div class="page-title">
                    </div>
                    <!-- /. ROW  -->
                    <div id="notifaction" class="alert alert-success hidden" role="alert">Operation done successfully</div>
                    <div class="row expandUp">
                        
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                   Personal Data
                                </div>
          
                                      <form id="aboutChefForm" method="POST" action="/zmed/patient/process" modelAttribute="patient" accept-charset="utf-8" >
                                        <input type="hidden" name="id" value="${patient.id}"/>
                                           
                                        <div>
    <img class="patientPopupAvatar" src="<c:url value='/resources/images/avatar.jpg'/>" />
    
                                                 <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 52px;"> Name : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="fName" placeholder="First name" class="patientInputFieldDesign" style="width: 220px !important; " id="User_name" required value="${patient.fName}"/>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="midName" placeholder="Middle name" class="patientInputFieldDesign" style="width: 220px !important;" id="User_name" required value="${patient.midName}"/> 
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="lName" placeholder="Last name" class="patientInputFieldDesign" style="width: 220px !important;"  id="User_name"  required value="${patient.lName}"/>
            </div>
        </div>   
                                     
          <div class="patientDivContainer">
                 
                <div class="patientLabelTitle">
                    <label class="patientDataText" style="margin-right: 45px;"> Phone : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="text" name="phoneNumber1" class="patientInputFieldDesign" style="width: 220px !important;"  id="phoneNumber1"  placeholder="Phone Number1" required value="${patient.phoneNumber1}"/>
                </div>
                

                <div class="PatientInputFields">
                    <input type="text" name="phoneNumber2" class="patientInputFieldDesign" style="width: 220px !important;" id="phoneNumber2"  placeholder="Phone Number2" required value="${patient.phoneNumber2}"/>
                </div>
                
        </div>                   
                <div class="patientDivContainer">
                                             <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 20px;"> Gender : </label>
            
                                                    
                                                            <c:if test="${patient.gender eq 'Male'||empty patient.gender}">
                                                                <input type="radio" name="gender" value="Male" checked="checked" id="radio1" class="css-checkbox"><label for="radio1" class="css-label radGroup1">Male</label>
                                                                <input type="radio" name="gender" value="Female" id="radio2" class="css-checkbox"><label for="radio2" class="css-label radGroup1">Female</label>
                                                            </c:if>
                                                            <c:if test="${patient.gender eq 'Female'}">
                                                                 <input type="radio" name="gender" value="Male" id="radio1" class="css-checkbox"><label for="radio1" class="css-label radGroup1">Male</label>
                                                                 <input type="radio" name="gender" value="Female" id="radio2"  checked="checked" class="css-checkbox"><label for="radio2" class="css-label radGroup1">Female</label>
                                                            </c:if>  
                                                    
                                             </div>      </div>
                                                         
             <div class="patientDivContainer">
                                  
                <div class="patientLabelTitle">
                    <label class="patientDataText" style="margin-right: 30px"> Address : </label>
                </div>

                <div class="PatientInputFields">
                    <input type="text" name="address" placeholder="Address" class="patientInputFieldDesign" style="width:280px!important;" id="address" required value="${patient.address}"/>  
                </div>
            
             <div class="patientLabelTitle">
                 <label class="patientDataText" style="margin-right: 30px;margin-left: 30px;"> Email : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="email" placeholder="E-mail" class="patientInputFieldDesign" style="width:280px!important;" id="email" required value="${patient.email}"/>  
            </div>    
        </div>
                                                       
            <div class="patientDivContainer">
                    
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 66px;"> Age : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" name="age" placeholder="Age" class="patientInputFieldDesign" style="width:120px!important" required value="${patient.age}"/>
            </div>
                
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 20px;margin-left: 140px"> Birth Date : </label>
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
            
        
           
        </div>     
            
                                                         
             <div class="patientDivContainer">
                 
                <div class="patientLabelTitle">
                    <label class="patientDataText"  > Insurance : </label>
                </div>
            <div class="styled-select slate company">
                    <select id="insuranceCompany" style="margin-left: 8px">
                        <option value="0" selected="selected">-- Select --</option>
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
            </div></div>
                                               
                                        <div style="margin-top: -2%;">
                                                        <button class="registerbutton" >${operation}</button>
                                        
                                        </div>
                                        </div>
                                        
                                    </form>
      
                            </div>          
                            
                            <!-- Widget -->
                            <%@include file="../basic/widgets.jsp" %>                            
                                                    
                        </div>
                         
                    </div>
                    <!-- /. ROW  -->

                    <!-- /. PAGE INNER  -->
                </div>
                <!-- /. PAGE WRAPPER  -->
                 
            </div>
        
            <!-- Metis Menu Js -->
            <script src="<c:url value='/resources/js/jquery.metisMenu.js'/>"></script>
            <!-- Morris Chart Js -->
            <script src="<c:url value='/resources/js/raphael-2.1.0.min.js'/>"></script>
            <script src="<c:url value='/resources/js/morris.js'/>"></script>
            <!-- Custom Js -->
            <script src="<c:url value='/resources/js/custom-scripts.js'/>"></script>   
           
            
             </div>
            
            </div><!--End Main Container-->

    </div><!--End Body Container-->
          
    </body>
</html>
