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
         <title> Working Days </title>
        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.carousel.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.theme.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/font-awesome.min.css'/>">

        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/KitKatClock.js'/>"></script>
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/KitKatClock.css'/>">
        

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
            <link href="<c:url value='/resources/css/morris-0.4.3.min.css'/>" rel="stylesheet" />
            <link href="<c:url value='/resources/css/animation.css'/>" rel="stylesheet" />
            <!-- Custom Styles-->
            <!-- Google Fonts-->
            <link href="<c:url value='/resources/css/googlefonts.css'/>" rel="stylesheet" />


        <script type="text/javascript">
            $(document).ready(function() {
                
                $(".kitkatPicker").kitkatclock();
                
                $(".Adding").click( function(){
                      var timesDiv=$(this).parents('.myContainerrr').find('.times');
                      var theDay=$(this).parents('.myContainerrr').find('.TheDay').val();
                      ////////check if Day status is ON
                       var dayStatus=$(this).parents('.myContainerrr').find('.weekDayStatus'); 
                       if(dayStatus.val()==='off'){
                            timesDiv.show();
                            dayStatus.val("on");
                            dayStatus.change();
                        }//end if Condition 

                       timesDiv.append("<div class='Day_Time'>"
                       +"<input type='hidden' name='"+theDay+"_STATUS' value='0'/>"
                       +"<label class='fromToLabel'>FROM :</label> <input class='kitkatPicker timeInputs' name='"+theDay+"_TIMEFROM'/>"
                       +"<label class='fromToLabel'>TO :</label> <input class='kitkatPicker timeInputs' name='"+theDay+"_TIMETO'/>"
                       +"<img src='<c:url value='/resources/images/delete-sign.png'/>' class='removeTimeButton Removing'/>"
                       +"</div>");
                        // Adding KitKatPicker to TimePickers 
                        $(".kitkatPicker").kitkatclock();
                            
                        $(".Removing").click( function(){
                              $(this).closest("div").remove();
                        });
                    }); 
                 
                $(".Removing").click( function(){
                        $(this).closest("div").remove();
                });
                    
                $('.weekDayStatus').on('change', function() {
                    // Getting the Status Code
                    var chosedStatus=$(this).val();
                    var timesDiv=$(this).parents('.myContainerrr').find('.times');
                    if(chosedStatus==='on'){
                        timesDiv.show();
                    }//end if Condition 
                    if(chosedStatus==='off'){
                        timesDiv.hide();
                    }//end if Condition 
        
                     
                    // timesDiv.hide();
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
                                   Working Days
                                </div>
          
                                <!--- Patient List --->
                                <form method="POST" action="/zmed/settings/workingDays/process" modelAttribute="workingDayHolder">

                                    <c:forEach items="${weekDays}" var="weekDay" varStatus="counter">
                                        <center>
                                        <div class="myContainerrr">
                                            <div class="titles">
                                                   <b> <label class="weekDayTitle">
                                                             ${weekDay.dayNameEn}
                                                    </label></b>
                                                             <select name="${weekDay.dayShort}_DAY" id="${weekDay.dayShort}_counter" class="weekDayStatus">
                                                                <c:choose>
                                                                    <c:when test="${weekDay.offLine}">
                                                                        <option value="off" selected="selected">OFF</option>
                                                                        <option value="on">Working</option> 
                                                                    </c:when>       
                                                                    <c:otherwise>
                                                                        <option value="off">OFF</option>
                                                                        <option value="on" selected="selected">Working</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                    </select>
                                                    <img src="<c:url value='/resources/images/add-sign.png'/>" id="${weekDay.dayShort}_add" class="Adding addTimesButton"/>

                                            </div>                    
                                            <div class="times">
                                                <input type="hidden" class="TheDay" value="${weekDay.dayShort}"/>  
                                            <c:if test="${not weekDay.offLine}">   

                                                    <c:forEach items="${weekDay.workingTimes}" var="workingTime" varStatus="counter2">
                                                        <div class="Day_Time">
                                                        
                                                            <input type="hidden" name="${weekDay.dayShort}_STATUS" value="${workingTime.id}"/>
                                                            
                                                            <label class="fromToLabel">FROM :</label>  <input  name="${weekDay.dayShort}_TIMEFROM" class="kitkatPicker timeInputs" value='<fmt:formatDate type="time" pattern="hh:mm a" value="${workingTime.timeFrom}"/>'/>
                                                            <label class="fromToLabel">TO :</label>  <input name="${weekDay.dayShort}_TIMETO" class="kitkatPicker timeInputs" value='<fmt:formatDate type="time" pattern="hh:mm a" value="${workingTime.timeTo}"/> ' />
                                                            
                                                            <img src="<c:url value='/resources/images/delete-sign.png'/>" id="${weekDay.dayShort}_time_${counter2.index}_Remove" class="removeTimeButton Removing"/>
                                                        </div>        

                                                    </c:forEach>

                                            </c:if>   
                                            </div> <!-- Times -->
                                        </div>  <!-- the Outer Container-->
                                      </center>  
                                    </c:forEach>

                                    <center>  
                                        <button type="submit" id="saveSettings" class="registerbuttonheader controlAction saveAllTimes">Save All</button>
                                    </center>

                               </form>

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
