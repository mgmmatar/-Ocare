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
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/font-awesome.min.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/paging.css'/>">
        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/paging.js'/>"></script>        
        
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
        
                // Max Result 
                var maxResult=10;  

                $('#reservationTable').paging({
                       limit:maxResult,
                       rowDisplayStyle: 'block'
                 }); 
            
                $('#editPatient').on("click", function(e) {
                   var patientId = '${patient.id}';
                    window.location.href = "/ocare/patient/edit/"+patientId;   
                });
                
                $('#reservePatient').on("click", function(e) {
                    var patientId = '${patient.id}';
                    window.location.href = "/ocare/reservation/process/"+patientId;  
                });
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
                                   ${patient.fName} ${patient.lName} Profile 
                                </div>
          
           <!--- Reservation Information --->

                        <div class="patientInfo">

                                <img class="patientImg"src="<c:url value='/resources/images/avatar.jpg'/>" />
                                
                                <div class="patientData">
                                    <table>
                                        <tr>
                                             <td>
                                                 <label style="width: 150px;">Patient Name : </label>
                                             </td>
                                             <td>
                                                 ${patient.fName} ${patient.midName} ${patient.lName}
                                             </td>    
                                        </tr>   
                                        <tr>
                                             <td>
                                                 <label>Patient Code : </label>
                                             </td>
                                             <td>
                                                     ${patient.code}
                                             </td>    
                                        </tr>

                                        <tr>
                                             <td>
                                                 <label>Gender: </label>
                                             </td>
                                             <td>
                                                    ${patient.gender}
                                             </td>    
                                        </tr>

                                        <tr>
                                             <td>
                                                 <label>Age: </label>
                                             </td>
                                             <td>
                                                    ${patient.age} Years Old.
                                             </td>    
                                        </tr>

                                        <tr>
                                             <td>
                                                 <label>Address : </label>
                                             </td>
                                             <td>
                                                    ${patient.address} 
                                             </td>    
                                        </tr>

                                        <tr>
                                             <td>
                                                 <label>Phone Numbers : </label>
                                             </td>
                                             <td>
                                                    ${patient.phoneNumber1} - ${patient.phoneNumber2}  
                                                      
                                             </td>    
                                        </tr>
                                        
                                        <tr>
                                             <td>
                                                 <label>Email : </label>
                                             </td>
                                             <td>
                                                    ${patient.email} 
                                             </td>    
                                        </tr>
                                        
                                        <tr>
                                             <td>
                                                 <label>BirthDate : </label>
                                             </td>
                                             <td>
                                                    <fmt:formatDate type="date" value="${patient.birthDate}" pattern="dd MMM ,yyyy" /> 
                                             </td>    
                                        </tr>
                                        
                                        <tr>
                                             <td>
                                                 <label>Created : </label>
                                             </td>
                                             <td>
                                                <fmt:formatDate type="date" value="${patient.creationDate}" pattern="dd MMM ,yyyy" /> <b>By</b> <a href="/ums/user/profile/${patient.registeredBy.id}">${patient.registeredBy.firstName} ${patient.registeredBy.lastName}</a> 
                                             </td>    
                                        </tr>
                                        
                                        <td>
                                                 <label>Modified : </label>
                                        </td>
                                             <td>
                                                 <fmt:formatDate type="date" value="${patient.lastModifiedDate}" pattern="dd MMM ,yyyy" /> <b>By</b> <a href="/ums/user/profile/${patient.modifiedBy.id}">${patient.modifiedBy.firstName} ${patient.modifiedBy.lastName}</a> 
                                             </td>    
                                        </tr>
                                        
                                        <tr>
                                             <td>
                                                 <label>Insurred : </label>
                                             </td>
                                             <td>
                                                 <c:choose>
                                                     <c:when test="${not empty patient.insuranceCompany}">
                                                          ${patient.insuranceCompany.nameEn}  
                                                     </c:when>
                                                     <c:otherwise>
                                                           NONE 
                                                     </c:otherwise>
                                                 </c:choose>
                                             </td>    
                                        </tr>
                                        
                                    </table>    
                                </div>

                                    <div class="costViewer">
                                             <div class="col-md-3 controlButtonContainer">
                                                 <button type="button" id="editPatient" class="registerbuttonheader controlAction">Edit</button>
                                                 <button type="button" id="reservePatient" class="registerbuttonheader controlAction">Reserve</button>
                                             </div>

                                    </div>                 
                                             
                             </div>
                            
                             <center>
                                 <h3>Reservation History</h3>
                             </center>     
                             <div class="panel-body">
                                 <table id="reservationTable" class="table table-striped" style="cursor: pointer;">
                                <thead>
                                    <tr>
                                        <th style="font-size: 18px">#</th>
                                        <th style="font-size: 16px">Date</th>
                                        <th style="font-size: 16px">Time</th>
                                        <th style="font-size: 16px">ExamineType</th>
                                        <th style="font-size: 16px">ReservationWay</th>
                                        <th style="font-size: 16px">Status</th>                                        
                                    </tr>
                                </thead>
                                <tbody>
                                        <c:choose>
                                            <c:when test="${empty reservations}">
                                                <tr><td  colspan="8"><center><lable>No Reservation Found</lable></center></td></tr>
                                            </c:when>
                                            <c:otherwise>
                                                    <c:forEach items="${reservations}" var="reservation" varStatus="counter">
                                                        <tr class="examineRow">
                                                            <input type="hidden" name="reservation" value="${reservation.id}"/>
                                                            <th>${counter.count}</th>
                                                            <td tabindex="1"><fmt:formatDate type="time" pattern="dd MMM yyyy " value="${reservation.reservationDate}"/></td>
                                                            <td><fmt:formatDate type="time" pattern="hh:mm a" value="${reservation.attendenceTimeFrom}"/> - <fmt:formatDate type="time" pattern="hh:mm a" value="${reservation.attendenceTimeTo}"/></td>
                                                            <td>${reservation.examineType.nameEn}</td>
                                                            <td>${reservation.reservationWay.nameEn}</td>                                                   
                                                            <td>${reservation.status}</td>
                                                        </tr>
                                                    </c:forEach>
                                        </c:otherwise> 
                                    </c:choose>     
                                    </tbody>
                                </table>
                                 
                                </div>
                                             
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
