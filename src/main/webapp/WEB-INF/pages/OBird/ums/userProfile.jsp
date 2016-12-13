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


         <style>
           input[type="text"]:disabled {
            background: #f1f1f1;
            text-align: center;
            }
            .patientDivContainer{
              margin-bottom: -4px;
              margin-right: 10px;
            }
        </style>
        
        <script type="text/javascript">
            $(document).ready(function() {
                
                $(".container").on("click","#changePassword", function(e) {
                    $('#userPopup').bPopup();
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
                            <div class="row expandUp">

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            My Profile 
                                        </div>

                                        <!--- Reservation Information --->

                                        <div class="patientInfo">

                                            <img class="patientImg"src="<c:url value='/resources/images/avatar.jpg'/>" />

                                                        
                                                 <div class="costViewer" style="padding-left: 300px;">
                                             <div class="col-md-3 controlButtonContainer">
                                                 <button type="button"  id="editProfile"  class="registerbuttonheader controlAction" style="width: 162px!important;" >Edit Information</button>
                                                 <button type="button" id="changePassword"  class="registerbuttonheader controlAction" style="width: 162px!important;" >Change Password</button>
                                             </div>

                                    </div>                 
                                         </div> 
                                                        
                                <div class="patientDivContainer">
            <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 60px;"> Name : </label>
            </div>
            <div class="PatientInputFields">
                <input type="text" disabled="disabled"  class="patientInputFieldDesign" style="width: 400px;" required  value="${myUser.firstName} ${myUser.middleName} ${myUser.lastName}"/>
            </div>
            </div>                        
                                                                                                           
              <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 15px;">User Name : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text" disabled="disabled" name="username" class="patientInputFieldDesign" style="width:260px!important" required  value="${myUser.auth.userName}"/>
            </div>
            
           <div class="patientLabelTitle">
                <label class="patientDataText">Email : </label>
            </div>
        
            <div class="PatientInputFields">
                <input type="text"  disabled="disabled" name="email" placeholder="Age" class="patientInputFieldDesign" style="width:310px!important" required value="${myUser.email}"/>
            </div>
            </div>
                                                       
            <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 38px;">Phone 1 : </label>
            </div>
            <div class="PatientInputFields">
               <input type="text"  disabled="disabled" name="phoneNumber1" placeholder="Telephone-1" class="patientInputFieldDesign" style="width: 260px;" required  value="${myUser.phoneNumber1}"/>
            </div>
            
            <div class="patientLabelTitle">
                <label class="patientDataText">Phone 2 : </label>
            </div>
            <div class="PatientInputFields">
                <input type="text"  disabled="disabled" name="phoneNumber2" placeholder="Telephone-2" class="patientInputFieldDesign" style="width: 290px;" required  value="${myUser.phoneNumber2}"/>
            </div>
            </div>
            
             <div class="patientDivContainer">
            <div class="patientLabelTitle">
                <label class="patientDataText" style="margin-right: 10px;"> Address : </label>
            </div>
            <div class="PatientInputFields">
                <input type="text"  disabled="disabled" name="address" placeholder="Address" class="patientInputFieldDesign" style="width:400px!important; margin-left: 25px;" required value="${myUser.address}"/>
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

            <span class="button b-close"><span class="popup_close_icon">X</span></span>

            <div class="popupMyHeader">
                <span class="logo">Change Password</span>
            </div> 
            
            <div class="patientLabelTitle">
                    
                    <div class="userDivContainer">
                        <div class="patientDivContainer">
                            <div class="patientLabelTitle">
                                <label class="patientDataText">Old Password : </label>
                            </div>

                            <div class="PatientInputFields">
                                <input type="password" name="oldPassword" style="width: 300px;margin-left: 22px;" placeholder="Old Password" class="patientInputFieldDesign" required/>
                            </div>
                        </div>
                        
                        <div class="patientDivContainer">
                            <div class="patientLabelTitle">
                                <label class="patientDataText">New Password : </label>
                            </div>

                            <div class="PatientInputFields">
                                <input type="password" name="newPassword" style="width: 300px;margin-left: 16px;" placeholder="New Password" class="patientInputFieldDesign" required/>
                            </div>
                        </div>
                        
                        <div class="patientDivContainer">
                            <div class="patientLabelTitle">
                                <label class="patientDataText">Retype Password : </label>
                            </div>

                            <div class="PatientInputFields">
                                <input type="password" name="reTypeNewPassword" style="width: 300px" placeholder="ReType New Password" class="patientInputFieldDesign" required/>
                            </div>
                        </div>
                        
                        <div class="patientDivContainer">
                            
                             <button id="reserveNow" class="submitPatientData">Save Changes</button> 
                            
                        </div>
                        
                    </div>
            </div>        
        </div>
        
    </body>
</html>
