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

        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        

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
            <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />


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
                                           <table class="registerationTable">
                                                    <tr>
                                                      <td>
                                                         <label class="registerLable">First Name  </label>
                                                     </td>
                                                     <td>
                                                         <input type="text" name="fName" placeholder="First name" class="registerField" id="User_name" required value="${patient.fName}"/>
                                                     </td>    
                                                </tr>   
                                                <tr>
                                                     <td>
                                                         <label class="registerLable">Middle Name  </label>
                                                     </td>
                                                     <td>
                                                           <input type="text" name="midName" placeholder="Middle name" class="registerField" id="User_name" required value="${patient.midName}"/> 
                                                     </td>    
                                                </tr>

                                                <tr>
                                                     <td>
                                                         <label class="registerLable">Last Name  </label>
                                                     </td>
                                                     <td>
                                                            <input type="text" name="lName" placeholder="Last name" id="User_name" class="registerField" required value="${patient.lName}"/>
                                                     </td>    
                                                </tr>
                                                
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
                                                         <label class="registerLable">Address  </label>
                                                     </td>
                                                     <td>
                                                           <input type="text" name="address" placeholder="Address" id="address" class="registerField" required value="${patient.address}"/>  
                                                     </td>    
                                                </tr>
                                                
                                                <tr>
                                                     <td>
                                                         <label class="registerLable">Phone 1  </label>
                                                     </td>
                                                     <td>
                                                            <input type="tel" name="phoneNumber1" id="phoneNumber1" class="registerField"placeholder="Phone Number1" required value="${patient.phoneNumber1}"/>
                                                     </td>    
                                                </tr>
                                                
                                                <tr>
                                                     <td>
                                                         <label class="registerLable">Phone 2  </label>
                                                     </td>
                                                     <td>
                                                            <input type="tel" name="phoneNumber2" id="phoneNumber2" class="registerField" placeholder="Phone Number2" required value="${patient.phoneNumber2}"/>
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
                                                         <label class="registerLable">Birth-Date  </label>
                                                     </td>
                                                     <td>
                                                         <input type="date" name="birthDate" id="birthDate" placeholder="birthDate" class="registerField" required value="${patient.birthDate}"/>
                                                     </td>    
                                                </tr>
                                                
                                                <tr>
                                                     <td>
                                                         <label class="registerLable">Age </label>
                                                     </td>
                                                     <td>
                                                         <input type="number" name="age" id="age" placeholder="Age" class="registerField" required value="${patient.age}"/>
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
