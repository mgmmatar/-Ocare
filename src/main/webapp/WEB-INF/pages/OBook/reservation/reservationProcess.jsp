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
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery.fancybox.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/popup.css'/>">
        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/calender.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/calendarTemplate.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.fancybox.pack.js'/>"></script>
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
            <link href="<c:url value='/resources/css/animation.css'/>" rel="stylesheet" />
            <!-- Custom Styles-->
            <!-- Google Fonts-->
            <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        
            <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/timeRanges.css'/>">
        <script type="text/javascript" src="<c:url value='/resources/js/timeRanges.js'/>"></script>

        <script type="text/javascript">
            $(document).ready(function() {
                
                /// Global Variables To Be Used 
                var oldReservation = "";
                var newReservation = "";
                var cancelledReservation= "";
                //////////////////////////////////
                 $("a.reservedBefore").fancybox({
                    'hideOnContentClick': true,
                    'transitionIn': 'elastic',
                    'transitionOut': 'elastic',
                    'speedIn': 600,
                    'speedOut': 200,
                    'overlayShow': false
                });
                ///////////////////////////////////
                $("a.alreadyReserved").fancybox({
                    'hideOnContentClick': true,
                    'transitionIn': 'elastic',
                    'transitionOut': 'elastic',
                    'speedIn': 600,
                    'speedOut': 200,
                    'overlayShow': false
                });
                /////////////////////////////////////////////////////////////
                /////////////////////////////////////////////////////////////
                $('#leaveReservation').on("click", function(e) {
                    $.fancybox.close();
                });
                
                $('#cancelReservation').on("click", function(e) {
                    $(cancelledReservation).addClass("type-11 cat-4 Available");
                    $(cancelledReservation).removeClass("type-9 cat-3 reserved");
                    $(cancelledReservation).children('span').html("Available");
                    $.fancybox.close();
                });
                ////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////
                $('#leaveOldReservation').on("click", function(e) {
                    $.fancybox.close();
                });
                
                $('#cancelOldReservation').on("click", function(e) {
                    /// Modify the Old reservation
                    $(newReservation).removeClass("type-11 cat-4 Available");
                    $(newReservation).addClass("type-9 cat-3 reserved");
                    $(newReservation).children('span').html("To Be Reserved");
                    /// Modify the New Reservation
                    $(oldReservation).addClass("type-11 cat-4 Available");
                    $(oldReservation).removeClass("type-9 cat-3 reserved");
                    $(oldReservation).children('span').html("Available");
                    // Close the PopUp Message
                    $.fancybox.close();
                });
                    
                $(".Slice").click(function() {
                    ///// Checking the Item Clicked Class
                    if($(this).hasClass("reserved")){
                        /// assign the reservation to be cancelled 
                        cancelledReservation=$(this);
                        $("a[href='#popup2']").trigger("click");
                    }//end if Condition 
                    ////////////////////////////////////////////
                    if ($(this).hasClass("Available")) {
                        // check if Time Chosed Before
                        var reserveBefore= $(this).parents(".no_matches").find('.reserved');
                            if(reserveBefore.size() > 0) {
                                 var reservedTime=reserveBefore.clone().children().remove().end().text();
                                  /// Save the Old Reservation 
                                  oldReservation =  reserveBefore;
                                  newReservation = $(this);
                                  $("a[href='#popup1']").trigger("click");
                            }else{
                                $(this).removeClass("type-11 cat-4");
                                $(this).addClass("type-9 cat-3 reserved");
                                $(this).children('span').html("To Be Reserved");
                            }//end Else 
                    }//end if Condition
                });

                $('#examineTypeId').on('change', function() {
                    ///// Getting Data
                    var examineTypeId = $("#examineTypeId").val();
                    var currentDate = $("#currentDate").val();
                    var patientId = $("#patientId").val();   // Gertting Patient Information

                    var reservationURL = "/zmed/reservation/timeSlice/" + currentDate + "," + examineTypeId;

                    //alert(reservationURL);
                    // Getting Ajax
                    var b;
                    var request = $.ajax({
                        url: reservationURL,
                        type: "GET",
                        dataType: 'json',
                        data: {
                        },
                        complete: function(data) {
//                            // Empty Slider
                            console.log('done :' + JSON.stringify(data));
                            $('.no_matches').empty();
                            // Draw New Search Results
//
                            $('.no_matches').append(data.responseText);
                            //    $('.slider>div').css('display', 'block');
                            //
                            //////////////////////////////////////////////////
                            //// Registering Slice Click Action
                            $(".Slice").click(function() {
                            ///// Checking the Item Clicked Class
                            if($(this).hasClass("reserved")){
                                /// assign the reservation to be cancelled 
                                cancelledReservation=$(this);
                                $("a[href='#popup2']").trigger("click");
                            }//end if Condition 
                            ////////////////////////////////////////////
                            if ($(this).hasClass("Available")) {
                                // check if Time Chosed Before
                                var reserveBefore= $(this).parents(".no_matches").find('.reserved');
                                    if(reserveBefore.size() > 0) {
                                         var reservedTime=reserveBefore.clone().children().remove().end().text();
                                          /// Save the Old Reservation 
                                          oldReservation =  reserveBefore;
                                          newReservation = $(this);
                                          $("a[href='#popup1']").trigger("click");
                                    }else{
                                        $(this).removeClass("type-11 cat-4");
                                        $(this).addClass("type-9 cat-3 reserved");
                                        $(this).children('span').html("To Be Reserved");
                                    }//end Else 
                            }//end if Condition
                        });
                        
                            //////////////////////////////////////////////////////
                        }
                    });
                    
                    //// Change Cost according to ExamineType
                    var reservationCostURL = "/zmed/reservation/examineCost/" + patientId + "," + examineTypeId;
                    var b;
                    var request = $.ajax({
                        url: reservationCostURL,
                        type: "GET",
                        dataType: 'json',
                        data: {
                        },
                        complete: function(data) {
                            $('.costViewer').empty();
                            $('.costViewer').append(data.responseText);
                        }//complete Function
                       
                    });
                    
                });

                $('#reserveNow').click(function() {
                    // Months and days 
                    var days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
                    var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
                    /////// For Reservation Confirmation
                    var reservationWay = $("#reservationWayId").find(":selected").text();
                    var examineType = $("#examineTypeId").find(":selected").text();   // Getting ExamineType 
                    var reservationDate= $("#currentDate").val();
                    var attendenceTime = $(".reserved").clone().children().remove().end().text();
                   // var dateFormat = require('dateformat');
                    var formattedDate = new Date(reservationDate);
                    var fullDateInfo=days[formattedDate.getDay()]+" , "+ formattedDate.getDate() +" "+ months[formattedDate.getMonth()]+" "+formattedDate.getFullYear();
                    var paidCost= $("#paidCost").val();
                    var totalCost = $("#totalCost").val();
                    //// Formulate the Confirmation Message
                           $('#confirmationMessage').empty();
                            // Draw New Search Results
                            var messageBody="<table class='confirmationDesign'>"
                                                +"<tr>"
                                                      +"<td><b>Date </b></td>"
                                                      +"<td>"+fullDateInfo+"</td>"
                                                +"<tr>" 
                                                +"<tr>"
                                                      +"<td><b>Time </b></td>"
                                                      +"<td>"+attendenceTime+"</td>"
                                                +"<tr>" 
                                                +"<tr>"
                                                      +"<td><b>Examine </b></td>"
                                                      +"<td>"+examineType+"</td>"
                                                +"<tr>" 
                                                +"<tr>"
                                                      +"<td><b>Way </b></td>"
                                                      +"<td>"+reservationWay+"</td>"
                                                +"<tr>" 
                                                +"<tr>"
                                                      +"<td><b>Cost </b></td>"
                                                      +"<td>"+totalCost+" LE "+"</td>"
                                                +"<tr>" 
                                                +"<tr>"
                                                      +"<td><b>Paid </b></td>"
                                                      +"<td>"+paidCost+" LE "+"</td>"
                                                +"<tr>"     
                                                +"<tr>"
                                                      +"<td><b>Remain </b></td>"
                                                      +"<td>"+(totalCost-paidCost)+" LE "+"</td>"
                                                +"<tr>"     
                                            +"</table>";
                                    
                            $('#confirmationMessage').append(messageBody);
                    ///////////////////////////////////////////////////////////////
                             $('#reservationConfirmPopup').bPopup(); 
                                
                });
                
                 $('#confirmAction').click(function(){
                      $("#reservationConfirmPopup").bPopup().close();
                      reserveNow();  
                 }); 
                
                function reserveNow(){
                    //// Collect Reservation Confirmation Data  
                    var reservationURL = "/zmed/reservation/processReservation";
                    // Getting Reservation Information
                    var patientId = $("#patientId").val();   // Gertting Patient Information
                    var examineTypeId = $("#examineTypeId").val();   // Getting ExamineType 
                    var reservationWayId = $("#reservationWayId").val();
                    var reservationDate = $("#currentDate").val();
                    var attendenceTime = $(".reserved").clone().children().remove().end().text();
                    var workingTimeId=$(".nav-tabs").find("li.active").find('input[type="hidden"][name="workingTimeId"]').val();
                    var paidCost= $("#paidCost").val();
                    var totalCost = $("#totalCost").val();
                    /// Send Reservation To Server
                    var b;
                    var request = $.ajax({
                        url: reservationURL,
                        type: "POST",
                        dataType: 'json',
                        data: {
                            patientId:patientId,
                            reservationWayId:reservationWayId,
                            examineTypeId:examineTypeId,
                            workingTimeId:workingTimeId,
                            reservationDate:reservationDate,
                            attendenceTime:attendenceTime,
                            paidCost:paidCost,
                            totalCost:totalCost
                        },
                        complete: function(data) {
                            // Show Success Message 
                              var doneMessage=$("#reservationDone").bPopup();
                              setTimeout(function () { 
                                  doneMessage.close();
                                  window.location.href = "/zmed/reservation/list";
                              }, 1000);
                              
                        }//end Complete Function
                    });
                }//end Function reserveNow
                
                
                /// Paid Button Click 
                $(".container").on("click",".paid", function(e) {
                                 //$('.paid').on("click", function(e) {
                                // Getting the totalCost
                                var totalCost = $("#totalCost").val();                     
                                // Getting Paid Cost
                                var paidCost= $("#paidCost");
                                var paidButton= $("#paidButton");
                                // Check if already Paid or Not
                                if(paidCost.hasClass("donePaid")){
                                    paidCost.removeClass("donePaid");
                                    paidButton.addClass("agreePayment");
                                    paidButton.removeClass("cancelPayment");
                                    paidCost.val("0");
                                    paidButton.text("Paid").button("refresh");
                                }else{
                                    paidCost.addClass("donePaid");
                                    paidCost.val(totalCost);
                                    paidButton.removeClass("agreePayment");
                                    paidButton.addClass("cancelPayment");
                                    paidButton.text("Cancel").button("refresh");
                                }//end if-else Block 
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
                                   Reservation Process
                                </div>
          
           <!--- Reservation Information --->
           
                   <div class="patientInfo">
                            
                            <input name="patientId" id="patientId" type="hidden" value="${patient.id}"/>

                            <input name="currentDate" id="currentDate" type="hidden" value="${currentDate}"/>

               
                           <img class="patientImg"src="<c:url value='/resources/images/avatar.jpg'/>" />
                           <div>
                               <table class="patientInfoViwer">
                                   <tr class="infoData">
                                        <td>
                                            <label style="width: 150px;">Patient Name : </label>
                                        </td>
                                        <td>
                                            ${patient.fName} ${patient.midName} ${patient.lName}
                                        </td>    
                                   </tr>   
                                   <tr class="infoData">
                                        <td>
                                            <label>Patient Code : </label>
                                        </td>
                                        <td>
                                                ${patient.code}
                                        </td>    
                                   </tr>
                                   <c:if test="${insurred}">
                                           <tr class="infoData">
                                                <td>
                                                    <label>Insurrance: </label>
                                                </td>
                                                <td>
                                                        ${patient.insuranceCompany.nameEn}
                                                </td>    
                                            </tr>
                                    </c:if> 
                                   <tr class="infoData">
                                        <td>
                                            <label>Examine Type: </label>
                                        </td>
                                        <td>
                                               <select name="examineTypeId" id="examineTypeId" class="dropDownList" >
                                                    <c:forEach items="${examineTypes}" var="examineType">
                                                        <c:choose>
                                                            <c:when test="${examineType.defaultOne eq true}">
                                                                <option value="${examineType.id}" selected>${examineType.nameEn}</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${examineType.id}">${examineType.nameEn}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                        </td>    
                                   </tr>
                                   <tr class="infoData">
                                        <td>
                                            <label>Reservation Way: </label>
                                        </td>
                                        <td>
                                               <select name="reservationWayId" id="reservationWayId" class="dropDownList">
                                                    <c:forEach items="${reservationWays}" var="reservationWay">
                                                        <c:choose>
                                                            <c:when test="${reservationWay.defaultOne eq true}">
                                                                <option value="${reservationWay.id}" selected>${reservationWay.nameEn}</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${reservationWay.id}">${reservationWay.nameEn}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                        </td>  
                                    </tr>
                                    
                               </table>   
                           </div>
                           <div class="costViewer">
                                   <c:import  url="/reservation/examineCost/${patient.id},${defaultExamineType.id}" />
                            </div>             
                     </div>
           
           
                              
          <!--- ==============================================================================================--->
            <!--- Calendar Section --->
            <!--- ==============================================================================================--->
            <section class="bg_container calendar_head calender_body">
                <div class="calendar-wrap">
                    <!-- TEMPLATES -->
                    <script type="text/html" id='calender-days-template'>
                        <@
                        /*if ( selectedMonth === currentMonth && selectedYear === currentYear ) {
                        data = data.slice(currentDay-1).concat( data.slice(0, currentDay-1) );
                        console.log( data );
                        }*/
                        _.each(data, function (element, index, list) {
                        var __ = ( ! Helper.dateLinkFormat )? '//localhost/{date}':Helper.dateLinkFormat;
                        __ = __.replace("{date}", element.date);
                        @>

                        <div class='item <@ if (currentDay === element.number && selectedMonth === currentMonth && selectedYear === currentYear) print("today") @>' data-date='<@= element.number @>'>
                            <h1><@= element.number @></h1>
                            <h4><@= element.name @></h4>
                        </div>

                        <@
                        });
                        @>
                        </script>

                        <script type="text/html" id='calender-years-template'>
                            <@
                            for( var i=currentYear-range; i<=currentYear; i++ ) {
                            @>
                            <div class='item month_year_color' data-year='<@= i @>'>
                                <h4>  <@= i @> </h4>
                            </div>
                            <@
                            };
                            @>
                            <@
                            for( var i=currentYear+1; i<=currentYear+range; i++ ) {
                            @>
                            <div class='item' data-year='<@= i @>'>
                                <h4><@= i @></h4>
                            </div>
                            <@
                            };
                            @>
                            </script>

                            <script type="text/html" id='calender-months-template'>
                                <@
                                var monthsName = [
                                {
                                index: 1,
                                name: 'يناير',
                                },
                                {
                                index: 2,
                                name: 'فبراير'
                                },
                                {
                                index: 3,
                                name: 'مارس'
                                },
                                {
                                index: 4,
                                name: 'ابريل'
                                },
                                {
                                index: 5,
                                name: 'مايو'
                                },
                                {
                                index: 6,
                                name: 'يونية'
                                },
                                {
                                index: 7,
                                name: 'يوليو'
                                },
                                {
                                index: 8,
                                name: 'اغسطس'
                                },
                                {
                                index: 9,
                                name: 'سبتمبر'
                                },
                                {
                                index: 10,
                                name: 'اكتوبر'
                                },
                                {
                                index: 11,
                                name: 'نوفمبر'
                                },
                                {
                                index: 12,
                                name: 'ديسمبر'
                                }
                                ];

                                <!--monthsName = monthsName.slice(currentMonth-1).concat( monthsName.slice(0, currentMonth-1) );-->
                                _.each(monthsName, function (element, index, list) {
                                @>
                                <div class='item month_year_color' data-month='<@= element.index @>'>
                                    <h4><@= element.name @></h4>
                                </div>
                                <@
                                });
                                @>
                                </script>
                                <!-- Calendar View (Date Slider) -->
                                <div class='date-slider ' data-years-range='7' data-now='${currentDate}'>
                                    <div class="con">

                                        <div class='owl-carousel days owl-theme calendar' id='dateSlider'></div>

                                    </div>
                                    <div class='month_year_wrap'>
                                        <div class='owl-carousel owl-theme' id='month'></div>
                                        <div class='owl-carousel owl-theme' id='year'></div>
                                    </div>
                                    <div class="cb"></div>
                                </div>
                                <!-- Time Range Section  -->
                                <div class="cb"></div>
                                <!-- Time Slices -->
                                 <!--   Showing Shift TABS -->
                                <div class="panel-group calender_matches tab_${currentDate}" id="accordion" role="tablist" aria-multiselectable="true">
                                    <div class="no_matches" id="a7a">

                                        <c:import  url="/reservation/timeSlice/${currentDate},${defaultExamineType.id}" />

                                    </div>
                                </div>
                                
                                
                        </section>
            <!--- ==============================================================================================--->
            <!--- End Calendar Section --->
            <!--- ==============================================================================================--->                        
                    <center>
                         <button id="reserveNow" class="reserveButton">Reserver Now</button>  
                    </center>                    
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
           
                            <!---- POPUPS START---->
                             <a href="#popup1" title="" class="reservedBefore" style="display:none;">popup1</a>
                                            <div id="popup1" style="display: none;">
                                                <div>
                                                    <span class="popup_title">Warning</span>
                                                    <div class="line black_color"></div>
                                                    <div class="cb"></div>
                                                    <div class="popup_center">
                                                        <span class="d_block txt_center popup_text">Cancel Old and reserve This ?</span>	
                                                    </div>
                                                    <div class="cb"></div>
                                                    <div class="">
                                                            <input id="cancelOldReservation" class="submit pull-right" type="submit" value="Continue">
                                                            <input id="leaveOldReservation" class="submit pull-left cancel-gray" type="submit" value="Cancel">
                                                                <div class="cb"></div>
                                                    </div>
                                                </div>
                                            </div>
                             
                                        <a href="#popup2" title="" class="alreadyReserved" style="display:none;">popup2</a>
                                            <div id="popup2" style="display: none;">
                                                <div>
                                                    <span class="popup_title">Warning</span>
                                                    <div class="line black_color"></div>
                                                    <div class="cb"></div>
                                                    <div class="popup_center">
                                                        <span class="d_block txt_center popup_text">Already Reserved..Want to Cancel it ?</span>	
                                                    </div>
                                                    <div class="cb"></div>
                                                    <div class="">
                                                            <input id="cancelReservation" class="submit pull-right" type="submit" value="Continue">
                                                            <input id="leaveReservation" class="submit pull-left cancel-gray" type="submit" value="Cancel">
                                                                <div class="cb"></div>
                                                    </div>
                                                </div>
                                            </div>
                             
                        <!-- Confirmation Message-->
                        <div id="popup" class="popupDesign">
                              <span class="button b-close"><span>X</span></span>
                               SuccessFully Reserved <br><span class="logo">bPopup</span>    
                        </div>
                        
                        <div id="reservationConfirmPopup" class="popupDesign popup">
                            <span class="button b-close"><span class="popup_close_icon">X</span></span>
    
                                <div class="popupMyHeader">
                                    <span class="logo">Reservation Confirm</span>
                                </div> 
                                
                                <div id="confirmationMessage">
                                    
                                </div>
                                
                                 <center>
                                    <button id="confirmAction" class="reserveButton">Confirm Now</button>  
                               </center>  
                            
                        </div>
                        
                        <div id="reservationDone" class="popupDesign popup">
                            <span class="button b-close"><span class="popup_close_icon">X</span></span>
                            
                            <center><h1>Done Successfully</h1></center>
                               
                        </div>
    
    </body>
</html>
