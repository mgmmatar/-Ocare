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
         <title> Reservation </title>
        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/calendar.css'/>" >
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
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.canvasjs.min.js'/>"></script>
        <script type="text/javascript"> 
          $(document).ready(function() {
                var statusInfo =[];
//                  // filling the Canvas Array
                    function fillChartData(){
                            <c:forEach items="${examineTypePatients}" var="examineTypeReport">
                                  statusInfo.push({ label: "${examineTypeReport.moduleName}",  y: ${examineTypeReport.occuranceNumber}, legendText: "${examineTypeReport.moduleName}"});           
                            </c:forEach>
                    }//fillChartData
                    
                    ////////////////////////////////////////////////////////////
                     var chart = new CanvasJS.Chart("chartContainer",{   
                            title: { 
                                    text: "Examine Type Report",
                                    fontSize: 24
                            }, 
                            axisY: { 
                                    title: "Products in %" 
                            }, 
                            legend :{ 
                                    verticalAlign: "bottom", 
                                    horizontalAlign: "center" 
                            }, 
                            data: [ 
                            { 
                                    type: "pie", 
                                    showInLegend: true, 
                                    toolTipContent: "{label} <br/> #percent%", 
                                    //indexLabel: "#percent% - {label}", 
                                    indexLabel: "{label} - {y} Times", 
                                    dataPoints: statusInfo
                            }   
                            ] 
                    }); 
             
             fillChartData();   
             chart.render();	         
            }); 
            </script>     
        
            
        <%@include file="../basic/scripts.jsp" %>
        
    </head>
    
       
         <body class="nav-md" >

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


                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="page-header" style="padding-top: 15px;">
                                Patient Report
                            </h1>
                        </div>
                    </div>
                    <!-- /. ROW  -->
                    <!-- /. ROW  -->
                    <div id="notifaction" class="alert alert-success hidden" role="alert">Operation done successfully</div>
                    <div class="row expandUp">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                   Reservation Report
                                </div>
          
                            <input type="hidden" id="currentDate" value="${currentDate}">   
          <!--- ==============================================================================================--->
            <!--- Calendar Section --->
            <!--- ==============================================================================================--->
                      
                                            <div id="chartContainer" style="width: 100%; height: 300px"></div>      
                                      
                     
                           

                            </div>

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
           
            
            <!-- POPUPs Here ---->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                             <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                             <h4 class="modal-title" id="myModalLabel">Patient Name</h4>
                                     </div>
                 <div class="modal-body">

                       <div class="row">
                          <div class="userImgContainer"><img class="userImg"src="<c:url value='/resources/images/khaled.jpg'/>" /></div>
                                            <div class="details">
                                            <h3 class="name">Name</h3>
                                            <h3 class="code">Code</h3>
                                            <h3 class="examineType">Examine Type</h3>
                                            <h3 class="date">07:15 PM 12/1/2016</h3>
                                    </div>
                                    <div class="actions">
                                            <a href="#" class="delete"><img src="<c:url value='/resources/images/Cancel.png'/>" /></a>
                                            <a href="#" class="check"><img src="<c:url value='/resources/images/checkround.png'/>" /></a>
                                    </div>			
                            </div>
                        </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div> 
            
             </div>
            </div><!--End Main Container-->

    </div><!--End Body Container-->
            
    </body>
</html>
