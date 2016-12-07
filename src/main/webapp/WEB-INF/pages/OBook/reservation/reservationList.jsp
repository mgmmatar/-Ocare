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
         <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/popup.css'/>">
         <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/font-awesome.min.css'/>">
         
        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/calender.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/calendarReservationList.js'/>"></script>
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
        
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/timeRanges.css'/>">
        <script type="text/javascript" src="<c:url value='/resources/js/timeRanges.js'/>"></script>

        <script type="text/javascript">
            $(document).ready(function() {
      
                $(".cancelReservation").click(function() {
                    ///// Checking the Item Clicked Class
                     var reservationId= $(this).closest("div").find('input[name="reservationId"]').val();
                     cancelReservation(reservationId);
                }); 
                
                $(".confirmReservation").click(function() {
                    ///// Checking the Item Clicked Class
                    var reservationId= $(this).closest("div").find('input[name="reservationId"]').val();
                    confirmReservation(reservationId);
                }); 



                $(".container").on("click",".ViewMore", function(e) {
                   
                    var reservationInfo= $(this).parents(".mainContainer").find('.reservationInfo'); 
                    console.log(reservationInfo);
                       reservationInfo.show();
//                     $('#informationMessage').empty();
//                                    
//                     $('#informationMessage').append(reservationInfo.show());
//                    
//                    $("#reservationInfoPopup").bPopup();
                   
                });
                
                
                
                function cancelReservation(reservationId) {
                    var b;
                   // var reservationId= 1;

                    var request = $.ajax({
                        url: "/ocare/reservation/cancelReservation/" + reservationId,
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
                       reloadReservations();
                    }//end if
                    
                }//end DeleteUserFunction
                
                ///////////////////////////////////////////////////
                function confirmReservation(reservationId) {
                    var b;
                  //  var reservationId= 1;

                    var request = $.ajax({
                        url: "/ocare/reservation/confirmReservation/" + reservationId,
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
                        reloadReservations();
                    }//end if    
                }//end DeleteUserFunction
                
                function reloadReservations(){
                    
                     var currentDate = $('#currentDate').val();
                     // reservationURL
                     var reservationURL="/ocare/reservation/reservationElement/"+currentDate;
                    // Getting Ajax 
                    var b;
                    var request = $.ajax({
                        url: reservationURL,
                        type: "GET",
                        dataType: 'json',
                        data: {
       
                        },
                        complete: function(data) {
                            //console.log('done :' + JSON.stringify( data));
                            var mm=$('.no_matches').html();
                            //console.log('DDDDD :' + JSON.stringify( mm));
                            $('.no_matches').empty();
                            $('.no_matches').append(data.responseText);
                            $('#accordion').show();
                            /// Reload Actions 
                            $(".cancelReservation").click(function() {
                                ///// Checking the Item Clicked Class
                                 var reservationId= $(this).closest("div").find('input[name="reservationId"]').val();
                                 cancelReservation(reservationId);
                            }); 
                
                            $(".confirmReservation").click(function() {
                                ///// Checking the Item Clicked Class
                                var reservationId= $(this).closest("div").find('input[name="reservationId"]').val();
                                confirmReservation(reservationId);
                            }); 
                        }///end Complete Fucntion 
                    });
                    
                }//end reloadReservations 
                
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

                    <div class="page-title"></div>   
                    <!-- /. ROW  -->
                    <div id="notifaction" class="alert alert-success hidden" role="alert">Operation done successfully</div>
                    <div class="row expandUp">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                   Reservation List
                                </div>
          <div class="panel-body">
              
                            <input type="hidden" id="currentDate" value="${currentDate}">   
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
                        
                                 <div class="cb"></div>
                               
                                 <!--   Showing Shift TABS -->
                                <div class="panel-group calender_matches tab_${currentDate}" id="accordion" role="tablist" aria-multiselectable="true">
                                    <div class="no_matches" id="a7a">
                                       
                                        <c:import  url="/reservation/reservationElement/${currentDate}" />

                                    </div>
                                </div>
                                 
                        </section>
                        <!--- ==============================================================================================--->
                        <!--- End Calendar Section --->
                        <!--- ==============================================================================================--->                        
                                </div>
                                     
          </div>    <!--*********************************here************************************-->
                                        
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
           
    <!-- POPUPs Here ---->
                    <div id="reservationInfoPopup" class="popupDesign popup">
                            <span class="button b-close"><span class="popup_close_icon">X</span></span>
    
                                <div class="popupMyHeader">
                                    <span class="logo">Reservation Info</span>
                                </div> 
                                
                                <div id="informationMessage">
                                    
                                </div>
                                
                            
                    </div>
    
    </body>
</html>
