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
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/monitor.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/popup.css'/>">
        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>      
        <script type="text/javascript" src="<c:url value='/resources/js/paging.js'/>"></script>      
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.canvasjs.min.js'/>"></script>
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
               
                 // Max Result 
                var maxResult=10;  
        
                var statusInfo =[];
                    ////////////////////////////////////////////////////////////
                    // filling the Canvas Array
                    function fillChartData(){
                            <c:forEach items="${reportReservationStatus}" var="reportReservation">
                                  statusInfo.push({ label: "${reportReservation.statusName}",  y: ${reportReservation.occuranceNumber}, legendText: "${reportReservation.statusName}"});           
                            </c:forEach>
                    }//fillChartData
        
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
                
                // Viewing Chart
                fillChartData();   
                chart.render();
                
            });
        </script>
            
        <style>
           input[type="text"]:disabled {
            background: #f1f1f1;
            text-align: center;
            }
            .patientDivContainer{
              margin-bottom: -4px;
              margin-right: 10px;
            }
        </style>
            
            <style>
                ul.tabs{
			margin: 0px;
			padding: 0px;
			list-style: none;
		}
		ul.tabs li{
			background: none;
			color: #222;
			display: inline-block;
			padding: 10px 15px;
			cursor: pointer;
		}

		ul.tabs li.current{
			background: #ededed;
			color: #222;
		}

		.tab-content{
			display: none;
			background: #ededed;
			padding: 15px;
		}

		.tab-content.current{
			display: inherit;
		}
                    
                
            </style>
                    <script type="text/javascript">
            $(document).ready(function() {
            //// Tabs  
            $('ul.tabs li').click(function(){
                    var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
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
                    <div class="row">
                        
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                   ${patient.fName} ${patient.lName} _ Profile 
                                </div>
          
                                
                                <div class="container">

                                                                    <ul class="tabs">
                                                                            <li class="tab-link current" data-tab="tab-1">Basic Info</li>
                                                                            <li class="tab-link" data-tab="tab-2">Status</li>
                                                                            <li class="tab-link" data-tab="tab-3">History</li>
                                                                            <li class="tab-link" data-tab="tab-4">Tab Four</li>
                                                                    </ul>
                                
                                
           <!--- Reservation Information --->

           <div id="tab-1" class="tab-content current">
                 <div class="panel-body">
                        <div class="patientInfo">
                            
                                <img class="patientImg"src="<c:url value='/resources/images/avatar.jpg'/>" /> 
                           
                                                 <div class="costViewer">
                                                     <div class="col-md-3 controlButtonContainer" style="padding-top: 15px;padding-left: 300px;">
                                                 <button type="button" id="editPatient" class="registerbuttonheader controlAction" style="width: 150px!important;">Edit</button>
                                                 <button type="button" id="reservePatient" class="registerbuttonheader controlAction" style="width: 150px!important;">Reserve</button>
                                             </div>

                                    </div>                 
                                         </div> 
                                             
                                <div class="patientDivContainer" style="margin-left: -10px;">
            <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 45px;"> Name : </label>
            </div>
            <div class="PatientInputFields">
                <input type="text" disabled="disabled"  class="patientInputFieldDesign" style="width: 360px;" required  value="${patient.fName} ${patient.midName} ${patient.lName}"/>
            </div>
            
             <div class="patientLabelTitle">
                <label class="patientDataText">Gender : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" disabled="disabled"  class="patientInputFieldDesign" style="width:160px!important" required  value="${patient.gender}"/>
            </div>
            </div>
            
            
            <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 50px;">Code : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" disabled="disabled" name="code" class="patientInputFieldDesign" style="width:140px!important" required  value="${patient.code}"/>
            </div>
            
           <div class="patientLabelTitle">
                <label class="patientDataText">BirthDate : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text"  disabled="disabled" name="BirthDate" placeholder="BirthDate" class="patientInputFieldDesign" style="width:150px!important" required value="${patient.birthDate}"/>
            </div>
            
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 18px;">Age : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text"  disabled="disabled" name="age" placeholder="Age" class="patientInputFieldDesign" style="width:110px!important" required value="${patient.age}"/>
            </div>
            </div>
            
            <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 26px;">Phone 1 : </label>
            </div>
            <div class="PatientInputFields">
               <input type="text"  disabled="disabled" name="phoneNumber1" placeholder="Telephone-1" class="patientInputFieldDesign" style="width: 256px;" required  value="${patient.phoneNumber1}"/>
            </div>
            
            <div class="patientLabelTitle">
                <label class="patientDataText">Phone 2 : </label>
            </div>
            <div class="PatientInputFields">
                <input type="text"  disabled="disabled" name="phoneNumber2" placeholder="Telephone-2" class="patientInputFieldDesign" style="width: 256px;" required  value="${patient.phoneNumber2}"/>
            </div>
            </div>
            
            <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 0px;"> Address : </label>
            </div>
            <div class="PatientInputFields">
                <input type="text"  disabled="disabled" name="address" placeholder="Address" class="patientInputFieldDesign" style="width:640px!important; margin-left: 25px;" required value="${patient.address}"/>
            </div>
            </div>
            
            <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: -22px;">Insurance : </label>
            </div>
            <div class="PatientInputFields">
               <input type="text" disabled="disabled" name="email" placeholder="Insurance" class="patientInputFieldDesign" style="width:270px!important; margin-left: 33px;" required  value="${patient.insuranceCompany.nameEn}"/>
            </div>   
                
            <div class="patientLabelTitle">
                <label class="patientDataText" >Email : </label>
            </div>
            <div class="PatientInputFields">
               <input type="text" disabled="disabled" name="email" placeholder="E-mail" class="patientInputFieldDesign" style="width:270px!important; margin-left: -6px;" required  value="${patient.email}"/>
            </div>
            </div>
                            
             <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 8px;">Created : </label>
            </div>
            <div class="PatientInputFields">
               <input type="text"  disabled="disabled" name="phoneNumber1" placeholder="Telephone-1" class="patientInputFieldDesign" style="margin-left: 21px;width: 260px;" required  value="${patient.creationDate}"/>
            </div>
            <div class="patientLabelTitle">
                <label class="patientDataText">By   <a href="/ums/user/profile/${patient.registeredBy.id}">${patient.registeredBy.firstName} ${patient.registeredBy.lastName}</a></label>
            </div>
             </div>
            
             <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 2px;">Modified : </label>
            </div>
            <div class="PatientInputFields">
                <input type="text"  disabled="disabled" name="phoneNumber2" placeholder="Telephone-2" class="patientInputFieldDesign" style="margin-left: 21px;width: 260px;" required  value="${patient.lastModifiedDate}"/>
            </div>
            <div class="patientLabelTitle">
                <label class="patientDataText">By   <a href="/ums/user/profile/${patient.modifiedBy.id}">${patient.modifiedBy.firstName} ${patient.modifiedBy.lastName}</a></label>
            </div>
            </div>
  
            
             </div>
             </div>
             </div>
            
            
             <div id="tab-2" class="tab-content">
                                                                   
                              <div class="panel-body">                                     
                            <div class="costViewer" style="width: 100%; height:500px;">
                                    <div id="chartContainer" ></div>      
                            </div> 
             </div>   
                 </div>   
                   
            <div id="tab-3" class="tab-content">
                <div class="panel-body">  
                            <div  class="panel-heading" style="width: 50%;margin-left: 36%;margin-top: 2%;margin-bottom: 3%;background-color: transparent!important;border-style: groove;border-color: transparent;">
                                <h3 style="color: #3a3a3a;"/>     Reservation History
                                </div> 
                          
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
            <div id="tab-4" class="tab-content">
                                                                            Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                               </div>
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
