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
        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/calender.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/calendarTemplate.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.fancybox.pack.js'/>"></script>
        

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
              

                $('#examineTypeId').on('change', function() {
                    ///// Getting Data
                    var examineTypeId = $("#examineTypeId").val();
                    var currentDate = $("#currentDate").val();

                    var reservationURL = "/ocare/reservation/timeSlice/" + currentDate + "," + examineTypeId;

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
                            $('.no_matches').empty();
                            // Draw New Search Results
                            $('.no_matches').append(data.responseText);
                            //////////////////////////////////////////////////////
                        }
                    });
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
                                   Reservation Preview
                                </div>
          
           <!--- Reservation Information --->
           
                   <div class="patientInfo">
                            
                            <input name="currentDate" id="currentDate" type="hidden" value="${currentDate}"/>
                             <center>
                               <div>
                                    <select name="examineTypeId" class="examineTypeSelector" id="examineTypeId" >
                                                    <c:forEach items="${examineTypes}" var="examineType">
                                                        <option value="${examineType.id}">${examineType.nameEn}</option>
                                                    </c:forEach>
                                    </select>
                               </div>
                            </center>         
                                      
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

                                        <c:import  url="/reservation/timeSlice/${currentDate},${examineTypes[0].id}" />

                                    </div>
                                </div>
                                
                                
                        </section>
            <!--- ==============================================================================================--->
            <!--- End Calendar Section --->
            <!--- ==============================================================================================--->                        
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
