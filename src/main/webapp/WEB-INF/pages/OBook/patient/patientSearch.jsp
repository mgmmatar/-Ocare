<%--
    Document   : reservationProcess
    Created on : Sep 24, 2015, 12:54:02 AM
    Author     : khaledeng
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html>
    
    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
         <title> Patient Search </title>
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
                                   Patient Search
                                </div>
          
                                     <!--- Patient List --->
                                    <div class="panel-body">
                                <form method="POST" action="/zmed/patient/doSearch" >

                                <table>
                                    <tr>
                                       <td>
                                              Name : 
                                       </td>
                                       <td>
                                           <input type="text" name="patientName" size="20"/>
                                       </td>
                                    </tr>

                                    <tr>
                                       <td>
                                              Patient Code : 
                                       </td>
                                       <td>
                                           <input type="text" name="patientCode" size="20"/>
                                       </td>
                                    </tr>

                                    <tr>
                                       <td>
                                              Phone Number : 
                                       </td>
                                       <td>
                                           <input type="text" name="patientPhone" size="20"/>
                                       </td>
                                    </tr>

                                     <tr>
                                            <td>
                                                <input type="submit" value="Search">
                                            </td>

                                     </tr> 
                                </table>
                                    </form>
                               
                                <!--- Results --->    
                                <c:choose>
                                    <c:when test="${result == 'done'}">
                                        <center><h1>Search result </h1></center>
                                        <center><h3>Number of patients : ${fn:length(patients)}</h3></center>
                                       <center>
                                       <table>
                                           <thead>
                                               <td style="width: 100px"><center>ID</center></td>
                                               <td style="width: 300px"><center>Full Name</center> </td>
                                               <td style="width: 100px"><center>Gender</center></td>
                                               <td style="width: 100px"><center>Age</center></td>
                                               <td style="width: 200px"><center>Telephone</center></td>
                                               <td style="width: 100px"><center>View</center></td>
                                               <td style="width: 100px"><center>Reserve</center></td>
                                           </thead>
                                           <tbody>

                                                <c:forEach items="${patients}" var="patient">
                                                    <tr>
                                                       <td><center>${patient.id}</center></td>
                                                       <td><center>${patient.fName} ${patient.midName} ${patient.lName}</center></td>
                                                       <td><center>${patient.gender}</center></td>
                                                       <td><center>${patient.age}</center></td>
                                                       <td><center>${patient.phoneNumber1}</center></td>
                                                       <td><center><a href="<c:url value='/patient/view/${patient.id}' />">View</a></center></td>
                                                       <td><center><a href="<c:url value='/reservation/process/${patient.id}' />">Reserve Now</a></center></td>
                                                    </tr>
                                                </c:forEach>

                                           </tbody>
                                       </table>
                                       </center>
                                    </c:when>
                                            <c:otherwise>
                                            
                                            </c:otherwise>
                                       
                                </c:choose>    
                                   
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
