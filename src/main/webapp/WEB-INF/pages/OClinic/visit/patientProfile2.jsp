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
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/monitor.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/popup.css'/>">
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
            <!-- FontAwesome Styles-->
            <link href="<c:url value='/resources/css/font-awesome.css'/>" rel="stylesheet" />
            <!-- Morris Chart Styles-->
            <link href="<c:url value='/resources/css/animation.css'/>" rel="stylesheet" />
            <!-- Custom Styles-->
            <!-- Google Fonts-->
            <link href="<c:url value='/resources/css/googlefonts.css'/>" rel="stylesheet" />
            <style type="text/css">
                            #menu {width:auto;}
                            #controls {float:left;}

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

            $('#clickMe').click(function(){
                $('#popup').bPopup();    
              });
            /// Visit Button Actions
            $('.patientVisit').click(function(){
                 // Getting the Clicked VisitId
                    var visitId =  $(this).closest('tr').find('input[type="hidden"][name="visitId"]').val();
                    var visitPageURL = "/zmed/monitor/visitPage/"+visitId;
                    // getting visit
                    var b;
                    var request = $.ajax({
                        url: visitPageURL,
                        type: "GET",
                        dataType: 'json',
                        data: {
                        },
                        complete: function(data) {
                            $('#popup').empty();
                            // Filling Last Information
                            $('#popup').append(data.responseText);
                        }//end onComplete Method
                     });/// end Ajax Call Request
                     // Showing the Popup
                     $('#popup').bPopup(); 
                     
                }); //end Click Function 
              
            //////////////////// visit List Booklet
            $('#visitBooklet').click(function(){
                // Open Booklet of All Visits    
                $('#popupBooklet').bPopup();    
            });
            
            $('#visitBooklet').click(function(){
                // Open Booklet of All Visits    
                var visitListBookletURL = "/zmed/monitor/visitBooklet";
                    // getting visit
                    var b;
                    var request = $.ajax({
                        url: visitListBookletURL,
                        type: "GET",
                        dataType: 'json',
                        data: {
                        },
                        complete: function(data) {
                            $('#popup').empty();
                            // Filling Last Information
                            $('#popup').append(data.responseText);
                        }//end onComplete Method
                     });/// end Ajax Call Request 
            
            });
            
       });
        </script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.booklet.latest.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.easing.1.3.js'/>"></script>
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery.booklet.latest.css'/>" media="screen, projection, tv">
        <script type="text/javascript">
	    $(function () {
		
			// Init
			
			var updateSelect = function (event, data) {
				var pageTotal = data.options.pageTotal;
				$('#gotoIndex, #addIndex, #removeIndex').children().remove();
				$('#gotoIndex, #addIndex, #removeIndex').append('<option value="start">start</option><option value="end">end</option>');						
				for(i = 0; i < pageTotal; i++) {
					$('#gotoIndex, #addIndex, #removeIndex').append('<option value="'+ i +'">'+ i +'</option>');						
				}
			};
			
			var options = $.extend({}, $.fn.booklet.defaults, {
			    pagePadding: 15,
			    menu: "#menu",
			    pageSelector: true,
			    chapterSelector: true,
			    arrows: true,
			    tabs: true,
                arrowsHide:true
			});
			var updateOptions = function () {
				$('#options-list').children().remove();
				$.each(options, function(key, value){
					$('#options-list').append('<li>'+key+' <input value="'+value+'" id="option-'+key+'" /></li>');
					$('#option-'+key).on('change', function(e){
						e.preventDefault();
						var value = $(this).val();
						var intValue = parseInt(value);
						
						if(!isNaN(intValue)) {
							options[key] = intValue;
							return;
						}

						options[key] = value;
					});
				});
			};
			updateOptions();
			
			var config = $.extend({}, options, {
				create: updateSelect,
				add: updateSelect,
				remove: updateSelect
			});
	        var mybook = $("#mybook").booklet(config);
	
			$('#gotoIndex').on('change', function(e){
				e.preventDefault();
				$('#custom-gotopage').click();
			});
	
			// New Page Default HTML
	
			var newPageCount = 0;
	        var newPageHtml = function() {
				newPageCount++;
				return "<div rel='new chapter'>New Page \#"+newPageCount+"</div>";
			};
			
			
			// Display
			
	        var display = $("#display");
			var updateDisplay = function(message) {
				display.text(message + '\r\n' + display.text());
			};

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
                    
                                    <div class="row expandUp">

                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="panel panel-default">
                                                                    <div class="panel-heading">
                                                                         ${patient.fName} ${patient.midName} ${patient.lName} Profile
                                                                    </div>
                                                                          
                                                                    <div class="controller-panel">
                                                                      
                                                                        
                                                                        <h3>
                                                                            Control Area
                                                                        </h3>
                                                                       <a href="#"  id="visitBooklet">Visit Booklet</a>
                                                                    </div>
                                                                    
                                                                    
                                                               <div class="container">

                                                                    <ul class="tabs">
                                                                            <li class="tab-link current" data-tab="tab-1">Basic Info</li>
                                                                            <li class="tab-link" data-tab="tab-2">Extra Info</li>
                                                                            <li class="tab-link" data-tab="tab-3">Visits</li>
                                                                            <li class="tab-link" data-tab="tab-4">Tab Four</li>
                                                                    </ul>

                                                                    <div id="tab-1" class="tab-content current">
                                                                                <div class="panel-body">
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
                                                                                      </div>
                                                                    </div>
                                                                    <div id="tab-2" class="tab-content">
                                                                        To be Implemented           
                                                                    </div>
                                                                    <div id="tab-3" class="tab-content">
                                                                            <table>
                                                                                    <thead>
                                                                                        <td style="width: 100px"><center>ID</center></td>
                                                                                        <td style="width: 300px"><center>Date </center> </td>
                                                                                        <td style="width: 100px"><center>Examine</center></td>
                                                                                        <td style="width: 200px"><center>Temperature</center></td>
                                                                                        <td style="width: 100px"><center>Pressure</center></td>
                                                                                        <td style="width: 100px"><center>Details</center></td>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <c:forEach items="${allVisits}" var="visit" varStatus="counter">
                                                                                            <tr>
                                                                                                     <input type="hidden" name="visitId" value="${visit.id}" />
                                                                                                    <td><center>${counter.count}</center></td>
                                                                                                    <td><center>${visit.visitDate}</center></td>
                                                                                                    <td><center>${visit.examineType.nameEn}</center></td>        
                                                                                                    <td><center>${visit.temperature}</center></td>
                                                                                                    <td><center>${visit.pressure}</center></td>       
                                                                                                    <td><center><a href="#"  class="patientVisit">Show</a></center></td>
                
                                                                                                </tr>
                                                                                        </c:forEach>
                                                                                    </tbody>
                                                                                </table>    
                                                                    </div>
                                                                    <div id="tab-4" class="tab-content">
                                                                            Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                                                    </div>

                                                                </div><!-- container -->


                                                        </div>   

                                                    <%@include file="../basic/widgets.jsp" %>

                                                </div>
                                    </div>
                
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

    <div id="popupBooklet" class="popupDesign popup">
        <section id="content" class="sub-content">
	
	    <div id="menu"></div>
	    <div id="mybook">
                
                <c:forEach items="${allVisits}" var="visit" varStatus="counter">
                    
                <div style="border:1px solid #000000;" title="first page" rel="January visits" >
	            <h3>Date ${visit.visitDate}</h3>
				
	        </div>    
                    
                <div title="Complains">
	            <h3>Complains</h3>
                    <c:forEach items="${visit.patientComplains}" var="complain" varStatus="counter">
                        ${complain.complain.name}</br>
                    </c:forEach>
	        </div>    
                    
                <div title="Diagnosis">
	            <h3>Diagnosis</h3>
                    <c:forEach items="${visit.patientDiagnosises}" var="diagnosis" varStatus="counter">
                        ${diagnosis.diagnosis.name}</br>
                    </c:forEach>
	        </div>    
                
                <div title="prescription">
	            <h3>Prescription</h3>
                    <c:forEach items="${visit.patientPrescriptions}" var="prescription" varStatus="counter">
                        ${prescription.prescription.name}</br>
                    </c:forEach>
	        </div>
                    
                <div title="Medication">
	            <h3>Medication</h3>
                    <c:forEach items="${visit.patientMedications}" var="medication" varStatus="counter">
                        ${medication.medication.name}</br>
                    </c:forEach>
	        </div>
                    
                    
                </c:forEach>
                
	    </div>
	</section>

    </div>
    
    <!--- POPUP -->
    <div id="popup" class="popupDesign popup">
        
    </div>
    
    </body>
</html>
