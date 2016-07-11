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
         <title> Reservation List </title>
        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/calendar.css'/>" >
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.carousel.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.theme.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation.css'/>">
        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/calender.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/calendarTemplate.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <!-- NEW -->
        <script type="text/javascript" src="<c:url value='/resources/js/nprogress.js'/>"></script>
        <script>
            NProgress.start();
        </script>
        <!--- Page Styles--->
        <!-- Bootstrap Styles-->
            <link href="<c:url value='/resources/css/bootstrap.css'/>" rel="stylesheet" />
            <!-- FontAwesome Styles-->
            <link href="<c:url value='/resources/css/font-awesome.css'/>" rel="stylesheet" />
            <!-- Morris Chart Styles-->
            <link href="<c:url value='/resources/css/morris-0.4.3.min.css'/>" rel="stylesheet" />
            <link href="<c:url value='/resources/css/animation.css'/>" rel="stylesheet" />
            <!-- Custom Styles-->
            <!-- Google Fonts-->
            <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />


        <script type="text/javascript">
            $(document).ready(function() {
                
                $(".check").click(function() {
                    alert("clicked") ;
                });
                

                $(".Slice").click(function() {
                    ///// Checking the Item Clicked Class
                    if ($(this).hasClass("Available")) {
                        alert("Availble Time");
                    }//end if Condition
                    

                    if ($(this).hasClass("Busy")) {
                        alert("Busy Time");
                    }//end if Condition

                    if ($(this).hasClass("Less")) {
                        alert("Less Time");
                    }//end if Condition

                });

                $('#examineTypeId').on('change', function() {
                    ///// Getting Data
                    var examineTypeId = $("#examineTypeId").val();
                    var currentDate = $("#currentDate").val();

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
                                if ($(this).hasClass("Available")) {
                                    alert("Availble Time ");
                                }//end if Condition

                                if ($(this).hasClass("Busy")) {
                                    alert("Busy Time ");
                                }//end if Condition

                                if ($(this).hasClass("Less")) {
                                    alert("Less Time ");
                                }//end if Condition
                            });
                            //////////////////////////////////////////////////////
                        }
//
                    });


                });


                $('#reserve').click(function() {
                    // Getting examineType
                    var examineTypeId = $("#examineTypeId").val();
                    var reservationWayId = $("#reservationWayId").val();
                    var patientId = $("#patientId").val();
                    var currentDate = $("#currentDate").val();

                    alert("ExamineType : " + examineTypeId
                            + "\n Reservation Way : " + reservationWayId
                            + "\n Patient ID : " + patientId
                            + "\n Current Date : " + currentDate);

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

                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="page-header" style="padding-top: 15px;">
                                Reservation List
                            </h1>
                        </div>
                    </div>
                    
                    <!-- /. ROW  -->
                    <div id="notifaction" class="alert alert-success hidden" role="alert">Operation done successfully</div>
                    <div class="row expandUp">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-default">
                             
                                <div class="panel-heading" style="padding-top: 15px;">
                                   Reservation Process
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
                                <div class="card col-md-12 col-sm-12 col-xs-12 fadeIn">
                                    
                                        <img class="userImg"src="<c:url value='/resources/images/khaled.jpg'/>" />
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
                                <div class="ViewMoreContainer"><a href="#" class="ViewMore" data-toggle="modal" data-target="#myModal">View More</a></div>
                                </div>
                               
                                        <div class="card col-md-12 col-sm-12 col-xs-12 fadeIn">
                                    
                                        <img class="userImg"src="<c:url value='/resources/images/khaled.jpg'/>" />
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
                                <div class="ViewMoreContainer"><a href="#" class="ViewMore" data-toggle="modal" data-target="#myModal">View More</a></div>
                                </div>
                                   
                             <div class="card col-md-12 col-sm-12 col-xs-12 fadeIn">
                                    
                                        <img class="userImg"src="<c:url value='/resources/images/khaled.jpg'/>" />
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
                                <div class="ViewMoreContainer"><a href="#" class="ViewMore" data-toggle="modal" data-target="#myModal">View More</a></div>
                                </div>
                                        
                           <div class="card col-md-12 col-sm-12 col-xs-12 fadeIn">
                                    
                                        <img class="userImg"src="<c:url value='/resources/images/khaled.jpg'/>" />
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
                                <div class="ViewMoreContainer"><a href="#" class="ViewMore" data-toggle="modal" data-target="#myModal">View More</a></div>
                                </div>             
                                        
                                        
                                        
                                
                        </section>
            <!--- ==============================================================================================--->
            <!--- End Calendar Section --->
            <!--- ==============================================================================================--->                        
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
         <!-- Modal -->
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
