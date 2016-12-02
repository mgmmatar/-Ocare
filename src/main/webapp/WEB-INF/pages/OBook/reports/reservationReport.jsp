<%-- 
    Document   : users
    Created on : Nov 3, 2016, 9:36:08 PM
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
         <title> Reservation Report </title>
        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.carousel.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.theme.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ssd-confirm.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/font-awesome.min.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/popup.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/paging.css'/>">
        
        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.ssd-confirm.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.bpopup.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/paging.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.canvasjs.min.js'/>"></script>

        <!-- NEW -->
        <script type="text/javascript" src="<c:url value='/resources/js/nprogress.js'/>"></script>
        <script>
            NProgress.start();
        </script>
            <!-- FontAwesome Styles-->
            <link href="<c:url value='/resources/css/font-awesome.css'/>" rel="stylesheet" />
            <!-- Morris Chart Styles-->
            <link href="<c:url value='/resources/css/animation.css'/>" rel="stylesheet" />
            <!-- Google Fonts-->
            <link href="<c:url value='/resources/css/googlefonts.css'/>" rel="stylesheet" />
                
            <script type="text/javascript">
            $(document).ready(function() {
               
                var reservationInfo =[];
                var insurranceInfo =[];
                ////////////////////////////////////////////////////////////
                     var reservationChart = new CanvasJS.Chart("reservationChartContainer",{   
                            title: { 
                                    text: "Today Reservation Report",
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
                                    indexLabel: "({label} , {name} L.E , {y} Patients)", 
                                    dataPoints: reservationInfo
                            }   
                            ] 
                    }); 
                    
                    ////////////////////////////////////////////////////////////
                     var insurranceChart = new CanvasJS.Chart("insurranceChartContainer",{   
                            title: { 
                                    text: "Today Insurrance Report",
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
                                    indexLabel: "({label} , {name} L.E , {y} Times)", 
                                    dataPoints: insurranceInfo
                            }   
                            ] 
                    }); 
             
                $(".container").on("click","#searchNow", function(e) { 
                 
                    var dateFrom = $('#dateFrom').val();
                    var dateTo = $('#dateTo').val();
                 
                    var request = $.ajax({
                        url: "/zmed/report/reservation/search",
                        type: "POST",
                        dataType: 'json',
                        data: {
                            dateFrom:dateFrom,
                            dateTo:dateTo
                        },
                        complete: function(data) {
                              // Getting Reponse JSON
                              var parsedJson = $.parseJSON(data.responseText);
                              var reservationReports=parsedJson['myReservationReport'];
                              var insuranceReports=parsedJson['myInsurranceReport'];
                              
        
                              var totalPatient=parsedJson['totalPatient'];
                              var totalProfit=parsedJson['totalProfit'];
                              
                              var totalInsurredPatient=parsedJson['totalInsurredPatient'];
                              var totalInsurranceProfit=parsedJson['totalInsurranceProfit'];
                              /// Filling Reservation Report
                              $.each( reservationReports, function( index, report){
                                    reservationInfo.push({ label: report['moduleName'], name: report['moduleSum'], y: report['occuranceNumber'], legendText: report['moduleName']});           
                              });

                              /// Filling Insurrance Report
                              $.each( insuranceReports, function( index, report){
                                    insurranceInfo.push({ label: report['moduleName'], name: report['moduleSum'], y: report['occuranceNumber'], legendText: report['moduleName']});           
                              });
                              
                              $('#totalPatient').text(totalPatient);
                              $('#totalProfit').text(totalProfit);
                              $('#totalInsurredPatient').text(totalInsurredPatient);
                              $('#totalInsurranceProfit').text(totalInsurranceProfit);
                              
                              $('#reportResults').show();
                              //// Generate Charts 
                              reservationChart.render();	  
                              insurranceChart.render();
                              
                              reservationInfo=[];
                              insurranceInfo=[];
                              
                        }//end Complete Function
                    });
              });
             
            });  
            </script>
            
        <%@include file="../../OBook/basic/scripts.jsp" %>
    </head>
    <body class="nav-md">

            <div class="container body">

                <div class="main_container">
 
                    <!---  Importing SideBar --->

                    <%@include file="../../OBook/basic/sidebar.jsp" %>

                    <!-- Header -->

                    <%@include file="../../OBook/basic/header.jsp" %>

                     <div class="right_col" role="main">
     
                    <div class="clearfix"></div>   
           
                  <!-- Content --->
          
             <div id="page-wrapper">
                <div id="page-inner">
                    <div class="page-title">
                    </div>
                    <!-- /. ROW  -->
                    <div id="notifaction" class="alert alert-success hidden" role="alert">Operation done successfully</div>
                    <div class="row">
                        
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                   Reservation Report
                                </div>
                                    <!--- List of XX --->
                                    <div class="panel-body">
                                           <div class="costViewer">
                                                   
                                               <!-- Search Form -->
                                               <div>
                                                   From : <input type="text" name="dateFrom" id="dateFrom" value="2016-01-01"/>
                                                   To  : <input type="text" name="dateFrom" id="dateTo" value="2016-12-03"/>
                                                   
                                                   <center>
                                                        <button id="searchNow" class="reserveButton">Show Report</button>  
                                                   </center> 
                                                   
                                               </div> 
                                               
                                            <div style="display: none" id="reportResults"/>
                                                    <!-- Reservation Report-->
                                                    <div id="reservationChartContainer" style="width: 100%; height: 300px"></div>     
                                                    <div> 
                                                        <h3> Total Patients : <span id="totalPatient"></span></h3>   
                                                        <h3> Total Profit :  <span id="totalProfit"></h3>  
                                                    </div>
                                                    
                                                    <hr>
                                                    <!-- Insurance Report-->
                                                    <div id="insurranceChartContainer" style="width: 100%; height: 300px"></div>      
                                                    <div> <h3> Insured Patients : <span id="totalInsurredPatient"></h3>
                                                        <h3> Insurance Profit : <span id="totalInsurranceProfit"></h3>  
                                                    </div>    
                                           </div>
                                                    
                                            </div>      
                                    </div>
                            </div>        
                            <!-- Widget -->
                            <%@include file="../../OBook/basic/widgets.jsp" %>
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
                    <!-- Custom Js -->
                    <script src="<c:url value='/resources/js/custom-scripts.js'/>"></script>   
                 </div>
            </div><!--End Main Container-->
    </div><!--End Body Container-->

    
    <div id="patientDataPopup" class="popupDesign popup">
        <c:import  url="/ums/admin/data/0" />
    </div>
    
    <!-- Confirm Delete Popup -->
    <div data-ssd-confirm-overlay></div>
    
    <div data-ssd-confirm>
        
    <div data-ssd-confirm-block="remove">

        <p class="confirmMessage" data-ssd-confirm-content></p>

        <nav>

            <span data-button-wrapper>

                <span
                    class="alert confirmMessageYesButton deletePatient"
                    data-ssd-confirm-yes
                    data-trigger
                >YES</span>

                <span
                    class="small alert disabled button hide"
                    data-processing
                ><i class="fa fa-spinner fa-spin fa-fw"></i></span>

            </span>

            <span class="small confirmMessageNoButton" data-ssd-confirm-no>NO</span>

        </nav>

    </div>

</div>
    
  </body>      
</html>
