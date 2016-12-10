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
        <title> My Profile </title>
        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.carousel.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.theme.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/font-awesome.min.css'/>">
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
                            <div class="row expandUp">

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            My Profile 
                                        </div>

                                        <!--- Reservation Information --->

                                        <div class="patientInfo">

                                            <img class="patientImg"src="<c:url value='/resources/images/avatar.jpg'/>" />

                                            <div class="patientData">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <label style="width: 150px;">Name : </label>
                                                        </td>
                                                        <td>
                                                            ${myUser.firstName} ${myUser.middleName} ${myUser.lastName}
                                                        </td>    
                                                    </tr>   
                                                    <tr>
                                                        <td>
                                                            <label>User Name : </label>
                                                        </td>
                                                        <td>
                                                            ${myUser.auth.userName}
                                                        </td>    
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <label>Email : </label>
                                                        </td>
                                                        <td>
                                                            ${myUser.email} 
                                                        </td>    
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td>
                                                            <label>Phone1 : </label>
                                                        </td>
                                                        <td>
                                                            ${myUser.phoneNumber1}
                                                        </td>    
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <label>Phone2:</label>
                                                        </td>
                                                        <td>
                                                            ${myUser.phoneNumber2}
                                                        </td>    
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <label>Address : </label>
                                                        </td>
                                                        <td>
                                                            ${myUser.address}
                                                        </td>    
                                                    </tr>

                                                   
                                                </table>    
                                            </div>

                                            <div class="costViewer">
                                                <div class="col-md-3 controlButtonContainer">
                                                    <button style="width: 165px!important;height: 40px!important;" type="button" id="editPatient" class="registerbuttonheader controlAction">Change Password</button>                                                   
                                                </div>

                                            </div>                 

                                        </div>

                                          
                                        <div class="panel-body">
                                            
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

        <div id="userPopup" class="popupDesign popup">
            
        </div>
        
    </body>
</html>
