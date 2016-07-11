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
         <title> Examine Type </title>
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
                                   Examine Type
                                </div>
          
                                     <!--- Patient List --->
                                <div class="panel-body">
                                    <form id="aboutChefForm" method="POST" action="/zmed/settings/examineType/process" modelAttribute="examineType"  accept-charset="utf-8" >
                                         <input type="hidden" name="id"  value="${examineType.id}"/>
                                        <div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Name</label>
                                                <input type="text" name="nameEn" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" placeholder="Name" id="User_name" required value="${examineType.nameEn}"/>
                                            </div>
										<div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">الاســم</label>
                                                <input type="text" name="nameAr" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" placeholder=" الاســم" id="User_name" required value="${examineType.nameAr}">
                                        </div>
										<div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Description</label>
                                                <input type="text" name="description" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" placeholder=" Description" id="User_name" required value="${examineType.description}"/>
                                        </div>
                                        <div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Cost</label>
                                                <input type="text" name="Cost" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" placeholder=" Enter Cost" id="User_name" required value="${examineType.cost}"/>
                                        </div>
                                        <div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Estimated Time</label>
                                                 
                                        <select name="estimatedPeriod" id="estimatedPeriod" >
                                            <c:forEach var="loop" begin="5" end="60" step="5">
                                                <c:choose>
                                                    <c:when test="${loop eq examineType.estimatedPeriod}">
                                                        <option  value="<c:out value="${loop}"/>" selected="selected"><c:out value="${loop}"/></option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option  value="<c:out value="${loop}"/>"><c:out value="${loop}"/></option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>

                                        </select>

                    
                                        </div>
                                                                              
                                        <div class="text-right">
                                            <button type="submit" > ${operation} </button>
                                        </div>
                                        
                                    </form>

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
