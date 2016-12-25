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
         <title> Patient Report </title>
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
        <script src="<c:url value='/resources/js/typeahead.jquery.js'/>"></script>
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
                
                var patientId=0;
                var statusInfo =[];
                
                var chart = new CanvasJS.Chart("chartContainer",{   
                            title: { 
                                    text: "Patient Status",
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
                
                /// AutoComplete Search Patient Data    
                $('#patientName').typeahead({
                            onSelect: function(item) {
                                patientId=item.value;
                            },
                            ajax: {
                                    url: "/ocare/patient/fastSearch",
                                    timeout: 500,
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",
                                    displayField: "name",
                                    valueField: "id",
                                    triggerLength: 1,
                                    method: "get",
                                    loadingClass: "loading-circle",
                                    preDispatch: function(query) {

                                        return {
                                            q: query
                                        };
                                    },
                                preProcess: function(data) {
                                        var list = [];
                                        $.each(data, function() {
                                                 console.log(data.toString());
                                                list.push({id: this.id, name: this.fName + ' ' + this.mName + ' '+ this.lName +'   | <b> Code </b>: '+this.code+'   | <b>Phone : </b>'+this.phoneNumber})
                                        });
                                       return list;
                                    }
                            }//end Ajax Request Part
                });
                
                $(".container").on("click","#searchNow", function(e) { 
                 
                    var dateFrom = $('#dateFrom').val();
                    var dateTo = $('#dateTo').val();
                    
                    var request = $.ajax({
                        url: "/ocare/report/patient/search",
                        type: "POST",
                        dataType: 'json',
                        data: {
                            dateFrom:dateFrom,
                            dateTo:dateTo,
                            patientId:patientId
                        },
                        complete: function(data) {
                            
                              var parsedJson = $.parseJSON(data.responseText);
                              console.log("Received "+data.responseText);
                              /// Parsing the Patient Report
                              var reportReservationStatus=parsedJson['reportReservationStatus'];                              
                              // Filling data 
                              $.each( reportReservationStatus, function( index, report){
                                    statusInfo.push({ label: report['statusName'],  y: report['occuranceNumber'], legendText: report['statusName']});
                              });
                               // Viewing Chart
                               chart.render(); 
                               statusInfo=[];
                               console.log(statusInfo);
                               $('#reportResults').show();
                               $('#reportResults').refresh();
                               // empty statusInfo
                               
                        }//end Complete Function
                    });
              });
                
            });  
            </script>
            
        <%@include file="../../OBook/basic/scripts.jsp" %>
    </head>
    <style>
        [type="date"] {
               background:#fff url('/ocare/resources/images/calendar.png')  97% 50% no-repeat ;
               height: 52px;
               width: 24%;}
        [type="date"]::-webkit-inner-spin-button {display: none;}
        [type="date"]::-webkit-calendar-picker-indicator {opacity: 0;}
        [type="date"]{border-color: #c1c1c1; color: #1479b8;}
        [type="date"]:hover{cursor: pointer;box-shadow: 4px 4px 5px #888888;}
    </style>
    
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
                                   Patient Report
                                </div>
                                    <!--- List of XX --->
                                    <div class="panel-body">
                                        <div class="costViewer" >
                                                   
                                               <!-- Search Form -->
                                               <div style="padding-top: 6%;padding-bottom: 3%;padding-left: 10px;margin-left: -11%;border-color: #ffffff; border-radius: 30px;;border-style: groove;border-width: 2px;">
                                                   
                                                   From : <input type="date" style="margin-left: 2%;margin-right:  24%;"  name="dateFrom" id="dateFrom"  />
                                                   To  : <input type="date" style="margin-left: 2%;"  name="dateFrom" id="dateTo" />
                                                   <br>
                                                   Patient 
                                                   <input type="text" id="patientName" name="patientName" class="searchBox" placeholder="Search For Patient"  required />
                                                   <center>
                                                       <button id="searchNow" class="reportButton" style="margin-left: 4%; margin-top: 3%;">Show Report</button>  
                                                   </center> 
                                                   
                                               </div> 
                                               <div style="display: none" id="reportResults"/>
                                                    
                                                            <div id="chartContainer" style="width: 100%; height: 300px"></div>      

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
