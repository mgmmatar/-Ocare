<%--
    Document   : reservationProcess
    Created on : Sep 24, 2015, 12:54:02 AM
    Author     : khaledeng
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
         <title> Action Logs </title>
        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.carousel.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.theme.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/font-awesome.min.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/paging.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ssd-confirm.css'/>">
        

        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/mindmup-editabletable.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/examineType-editable.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/paging.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.ssd-confirm.js'/>"></script>
        
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
        <style>
			
			.current-row{background-color:#B24926;color:#FFF;}
			.current-col{background-color:#1b1b1b;color:#FFF;}
			.tbl-qa{width: 100%;font-size:0.9em;background-color: #f5f5f5;}
			.tbl-qa th.table-header {padding: 5px;text-align: left;padding:10px;}
			.tbl-qa .table-row td {padding:10px;background-color: #FDFDFD;}
                        
                         [type="date"] {
               background:#fff url('/ocare/resources/images/calendar.png')  97% 50% no-repeat ;
               background-size: 100% 100%;
               height: .8%;
               width: 3%;}
        [type="date"]::-webkit-inner-spin-button {display: none;}
        [type="date"]::-webkit-calendar-picker-indicator {opacity: 0;}
       /* [type="date"]{border-color: #c1c1c1; color: #1479b8;} */
        [type="date"]:hover{cursor: pointer;box-shadow: 10px 10px 10px #888888;}
	</style>        
        <script type="text/javascript">
            $(document).ready(function() {
                
                $('#actionLogTable').paging({
                    limit:10,
                    rowDisplayStyle: 'block'
                });
              
                $("#searchForLog").keyup(function() {
                    var searchValue=$(this).val();
                    /// Reloading Patient Table Result
                    var request = $.ajax({
                        url: "/ocare/log/action/search",
                        type: "POST",
                        dataType: 'json',
                        data: {
                            query:searchValue
                        },
                        complete: function(data) {
                            $('.myDataTable').empty();
                            // Draw New Search Results
                            $('.myDataTable').append(data.responseText);
                            ///// Adding the Action Again 
                            $('#actionLogTable').paging({
                                        limit:10,
                                        rowDisplayStyle: 'block',
                                    });    
                        
                        }//end Complete Function
                    });
                 });
              
            });
        </script>
            
        <%@include file="../../OBook/basic/scripts.jsp" %>
        
    </head>
    
       
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
                                   Action Logs
                                </div>
                                    <!--- List of Admins --->
                                    <div class="panel-body">
                                           <center>
                                                <input type="text" id="searchForLog" name="Search" class="listSearchBar" placeholder="Filter Log List"  required /> 
                                                <input type="date" style="margin-left: 1%;"  name="dateFrom" id="dateTo" />
                                            </center>
                                            <div class="myDataTable">     
                                                <c:import  url="/log/action/loadActionLogTable" />
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
            <script src="<c:url value='/resources/js/morris.js'/>"></script>
            <!-- Custom Js -->
            <script src="<c:url value='/resources/js/custom-scripts.js'/>"></script>   
           </div>
            
            </div><!--End Main Container-->

    </div><!--End Body Container-->
          
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
