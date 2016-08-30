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
         <title> Reservation Way List </title>
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
        
        <script type="text/javascript" src="<c:url value='/resources/js/mindmup-editabletable.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/reservationWay-editable.js'/>"></script>
        
        

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
            <link href="<c:url value='/resources/css/animation.css'/>" rel="stylesheet" />
            <!-- Custom Styles-->
            <!-- Google Fonts-->
            <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <style>
			
			.current-row{background-color:#B24926;color:#FFF;}
			.current-col{background-color:#1b1b1b;color:#FFF;}
			.tbl-qa{width: 100%;font-size:0.9em;background-color: #f5f5f5;}
			.tbl-qa th.table-header {padding: 5px;text-align: left;padding:10px;}
			.tbl-qa .table-row td {padding:10px;background-color: #FDFDFD;}
	</style>        
        <script type="text/javascript">
            $(document).ready(function() {
                var newClicked=0;
            $('#mainTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).reservationWayEditable().find('td:first').focus();            
              //////////////////////////////////////////////////////////////////////////////////
              //// Delete Operation 
              //////////////////////////////////////////////////////////////////////////////////
              $(".container").on("click",".reservationWayDeleteButton", function(e) {
                   var reservationWayID = $(this).closest("tr").find('input[type="hidden"][name="reservationWayId"]').val();
                   // Sending Delete Request 
                    var b;
                    var request = $.ajax({
                        url: "/zmed/settings/reservationWay/delete",
                        type: "POST",
                        dataType: 'json',
                        data: {
                            reservationWayID:reservationWayID
                        },
                        complete: function(data) {
                            $('.panel-body').empty();
                            // Draw New Search Results
                            $('.panel-body').append(data.responseText);
                            ///// Adding the Action Again 
                            $('#mainTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).reservationWayEditable().find('td:first').focus();            
                        }//end Complete Function
                    });
                }); 
             //////////////////////////////////////////////////////////////////////////////////////////
             // Assign Default reservationWay
             ////////////////////////////////////////////////////////////////////////////////
              $(".container").on("click",".defaultReservationWayChecker", function(e) {
                // this function will get executed every time the #home element is clicked (or tab-spacebar changed)
                if($(this).is(":checked")) // "this" refers to the element that fired the event
                {  /// Send Assign Default Request 
                    var reservationWayID = $(this).closest("tr").find('input[type="hidden"][name="reservationWayId"]').val();
                    var b;
                    var request = $.ajax({
                        url: "/zmed/settings/reservationWay/defaultOne",
                        type: "POST",
                        dataType: 'json',
                        data: {
                            reservationWayID:reservationWayID
                        },
                        complete: function(data) {
                              $('.panel-body').empty();
                            // Draw New Search Results
                            $('.panel-body').append(data.responseText);
                            ///// Adding the Action Again 
                            $('#mainTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).reservationWayEditable().find('td:first').focus();            
                        }//end Complete Function
                    });
                }//end if Condition 
            });
           //////////////////////////////////////////////////////////////////////////////////////////
           // Add New ExamineType
           //////////////////////////////////////////////////////////////////////////////// 
           $(".container").on("click","#AddNewReservationWay", function(e) {
               if(newClicked===0){
               // Draw the New Row     
               $('#mainTable').append("<tr id='newReservation'>"
                            +"<th> # </th>"
                            +"<td id='nameAr'> </td>"
                            +"<td id='nameEn'> </td>"
                            +"<td id='description'> </td>"
                            +"<th id='isDefault'> <input type='checkbox' name='examineDefault' value='default'></th>"
                            +"<th><img src='<c:url value='/resources/images/save-icon.png'/>' id='saveNewReservationWay' class='reservationWayCancelButton'/> <img src='<c:url value='/resources/images/cancel-icon.png'/>' id='cancelAddReservationWay' class='reservationWayCancelButton'/></th>"
                            +"</tr>");
                            // refresh Table
                            $('#mainTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).reservationWayEditable().find('td:last').focus();            
                                $('#saveNewReservationWay').on("click", function(e) {
                                    var nameAr=$('#nameAr').text();
                                    var nameEn=$('#nameEn').text();
                                    var description=$('#description').text();
                                        var b;
                                        var request = $.ajax({
                                            url: "/zmed/settings/reservationWay/save",
                                            type: "POST",
                                            dataType: 'json',
                                            data: {
                                                nameAr:nameAr,
                                                nameEn:nameEn,
                                                description:description
                                            },
                                            complete: function(data) {
                                                $('.panel-body').empty();
                                                // Draw New Search Results
                                                $('.panel-body').append(data.responseText);
                                                ///// Adding the Action Again 
                                                $('#mainTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).reservationWayEditable().find('td:first').focus();             
                                                /// Rising Flag
                                                newClicked = 0 ; 
                                                
                                            }//end Complete Function
                                        });  // End AJax call for Save 
                                        //////////////// Adding Action fpr Cancel Add Button
                                        
                                    }); // Save Button Click Action 
                                    
                                    
                                    $('#cancelAddReservationWay').on("click", function(e) {
                                            $(this).closest('tr').remove();
                                            newClicked=0;    
                                    }); // Cancel Save Button Click Action   
                                   
                                    // Flag that Add Button Clicked
                                    newClicked=1;
                        }//end if  
                    });
                   // Scrol Top Again
                    document.body.scrollIntoView();                         

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
                                   Reservation Way List
                                </div>
          
                                     <!---Examine Type List --->
                                <div class="panel-body">
                                    <c:import  url="/settings/reservationWay/loadReservationWayTable" />
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
