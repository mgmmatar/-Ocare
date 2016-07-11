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
         <title> Examine Type List </title>
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
              $('#addNewExamine').on("click", function(e) {
                    window.location.href = "/zmed/settings/examineType/add";   
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
                                   Examine Type List
                                </div>
          
                                     <!--- Patient List --->
                                <div class="panel-body">
                                
                                <table border=2>
                                    <thead style="background-color: #C0392B" >
                                        <td style="width: 50px"><center>ID</center></td>
                                        <td style="width: 200px"><center>Name Ar</center> </td>
                                        <td style="width: 200px"><center>Name En</center></td>
                                        <td style="width: 200px"><center>Description</center></td>
                                        <td style="width: 100px"><center>Cost</center></td>
                                        <td style="width: 100px"><center>Period</center></td>
                                        <td style="width: 100px"><center>Edit</center></td>
                                        <td style="width: 100px"><center>Delete</center></td>
                                    </thead>
                                    <c:forEach items="${examineTypes}" var="examineType" varStatus="counter">
                                        <tr>
                                                <td><center>${counter.count}</center></td>
                                                <td><center>${examineType.nameAr} </center></td>
                                                <td><center>${examineType.nameEn}</center></td>
                                                <td><center>${examineType.description}</center></td>
                                                <td><center>${examineType.cost}</center></td>
                                                <td><center>${examineType.estimatedPeriod}</center></td>
                                                <td><center><a href="<c:url value='/settings/examineType/edit/${examineType.id}' />">Edit</a></center></td>
                                                <td><center><a href="<c:url value='/settings/examineType/delete/${examineType.id}' />">Delete</a></center></td>
                                        </tr>
                                    </c:forEach>                                                                                                        
                                </table>
                                    
                                <center>
                                        <button type="button" id="addNewExamine" class="registerbuttonheader controlAction">Add New</button>
                                </center>
                                    
                                </div>
                                    
                            </div>          
                        </div>
                      
                        <!-- Widget -->
                        <%@include file="../basic/widgets.jsp" %>
                                        
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
            
            <%@include file="../basic/widgets.jsp" %>
            
            </div><!--End Main Container-->

    </div><!--End Body Container-->
          
    </body>
</html>
