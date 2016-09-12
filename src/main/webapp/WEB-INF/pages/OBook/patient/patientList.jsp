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
         <title> Patient List </title>
        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.carousel.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.theme.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ssd-confirm.css'/>">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/popup.css'/>">
        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.ssd-confirm.js'/>"></script>
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
            <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />


        <script type="text/javascript">
            $(document).ready(function() {
              ///// Registering Actions  
             
              $('[data-ssd-confirm-trigger]').ssdConfirm();
              
              //$('#patientDataPopup').bPopup();
              
               $(".container").on("click","#registerNew", function(e) { 
                    window.location.href = "/zmed/patient/register";   
                });
              
               $(".container").on("click","#AddNewPatient", function(e) {
                    window.location.href = "/zmed/patient/register";   
                }); 
                
               $(".container").on("click",".deletePatient", function(e) { 
                   // var patientId=$(this).parents("tr").find('input[type="hidden"][name="patientId"]').val();
                    // delete Current Patient
                    alert("Hello");
                   // deletePatient(patientId);
               }); 
               
               $(".container").on("click",".thePatientProfile", function(e) { 
                    // delete Current Patient
                    var patientId=$(this).parents("tr").find('input[type="hidden"][name="patientId"]').val();
                     // URL for insurrance Profile
                    var profileURL = "/zmed/patient/data/"+patientId;
                    // getting visit
                    var request = $.ajax({
                        url: profileURL,
                        type: "GET",
                        dataType: 'json',
                        data: {
                        },
                        complete: function(data) {
                            $('#patientDataPopup').empty();
                            // Filling Last Information
                            $('#patientDataPopup').append(data.responseText);
                        }//end onComplete Method
                     });/// end Ajax Call Request
                     // Showing the Popup After Call
                     $('#patientDataPopup').bPopup();  
                     $('#birthDatePicker').datepicker();    
                }); 
               
               //////////////////////////////////////////////////////////////////////
               // Functions 
               ////////////////////////////////////////////////////////////////////////
               function deletePatient(patientId) {
                    var b;
                    var request = $.ajax({
                        url: "/zmed/patient/delete/" + patientId,
                        data: {
                        },
                        async: false
                    });

                    request.done(function(msg) {
                        b = (msg == "true" ? true : false);
                    });

                    request.fail(function(jqXHR, textStatus) {
                        b = false;
                    });
                    if (b == true) {
                        LoadPatientTableFor("");
                    }//end if    
                }//end DeleteUserFunction
               ////////////////////////////////////////////////////////////////////////
               function reloadReservations(){
                   // LoadPatientTableFor("");
                   alert("welcome");
               }//end reloadReservations
                ///////////////////////////////////////////////////////////////////////
                $( "#searchForPatient" ).keyup(function() {
                    var searchValue=$(this).val();
                    /// Reloading Patient Table Result
                      LoadPatientTableFor(searchValue);
                 });
                 ///////////////////////////////////////////////////////////////////////
                 function LoadPatientTableFor(searchValue){
                      /// Sending Ajax Request To Reload Table
                        var request = $.ajax({
                        url: "/zmed/patient/loadPatientTable",
                        type: "POST",
                        dataType: 'json',
                        data: {
                            query:searchValue
                        },
                        complete: function(data) {
                            $('.panel-body').empty();
                            // Draw New Search Results
                            $('.panel-body').append(data.responseText);
                            ///// Adding the Action Again 
                            $('#mainTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).examineTypeEditable().find('td:first').focus();            
                            // Adding New examineType 
                        }//end Complete Function
                    });
                 }//end SearchForPatient 
                 ///////////////////////////////////////////////////////////////////////
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
                                   Patient List
                                </div>
          
                                <div class="patientListSearchBox"> 
                                    <input type="text" id="searchForPatient" name="Search" class="patientSearchBox" placeholder="Search For Patient"  required />    
                                    <input type="submit" value="Submit" id="searchPatientButton">
                                </div>
                                
                                    <!--- Patient List --->
                                    <div class="panel-body">
                                        <c:import  url="/patient/loadPatientTable" />
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

<div data-ssd-confirm-overlay></div>
    
    <!-- Popup-->

     <div id="patientDataPopup" class="popupDesign popup">
        <c:import  url="/patient/data/0" />
    </div>
    
    </body>
</html>
