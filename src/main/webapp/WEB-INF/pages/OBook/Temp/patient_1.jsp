<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> Patient </title>
    <!--- Import Common Scripts ---->
    
            <link href="<c:url value='/resources/css/bootstrap.css'/>" rel="stylesheet">
            <link href="<c:url value='/resources/css/font-awesome.css'/>" rel="stylesheet">
            <link href="<c:url value='/resources/css/morris-0.4.3.min.css'/>" rel="stylesheet" />
            <link href="<c:url value='/resources/css/animation.css" rel="stylesheet'/>" />
            <!-- Custom Styles-->
            <link href="<c:url value='/resources/css/custom-styles.css" rel="stylesheet'/>" />
            <!-- Google Fonts-->
            <link href="<c:url value='/resources/css/googlefonts.css'/>" rel="stylesheet" />
                <script src= "<c:url value='/resources/jquery.metisMenu.js'/>"></script>
            <!-- Morris Chart Js -->
            <script src= "<c:url value='/resources/js/raphael-2.1.0.min.js'/>"></script>
            <script src= "<c:url value='/resources/js/morris.js'/>"></script>
            <!-- Custom Js -->
            <script src= "<c:url value='/resources/js/custom-scripts.js'/>"></script>
                <script src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
            <script src="<c:url value='/resources/js/nprogress.js'/>"></script>
            <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
    <%@include file="../basic/scripts.jsp" %>
</head>


<body class="nav-md">

<div class="container body">

    <div class="main_container">

    <!---  Importing SideBar --->
        
        <%@include file="../basic/sidebar.jsp" %>
        
        <!-- Header -->
         
        <%@include file="../basic/header.jsp" %>
        
        <!-- end header -->
        <div class="right_col" role="main">

        <div class="page-title">
            <div class="title_left">
               
            </div>
        </div>

        <div class="clearfix"></div>


        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
                            
                            <!-- Main Page -->
                            
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Personal Data
                                </div>
                                <div class="panel-body">
                                    <form id="aboutChefForm" method="POST" action="/zmed/patient/process" modelAttribute="patient" accept-charset="utf-8" >
                                        <input type="hidden" name="id" value="${patient.id}"/>
                                        <div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">First name</label>
                                                <input type="text" name="fName" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" placeholder="First name" id="User_name" required value="${patient.fName}"/>
                                            </div>
										<div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Middle name</label>
                                                <input type="text" name="midName" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" placeholder="Middle name" id="User_name" required value="${patient.midName}"/>
                                        </div>
										<div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Last name</label>
                                                <input type="text" name="lName" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" placeholder="Last name" id="User_name" required value="${patient.lName}"/>
                                        </div>
										<div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Gender</label>
                                               
                                                            <c:if test="${patient.gender eq 'Male'||empty patient.gender}">
                                                                        <input type="radio" name="gender" value="Male" checked="checked">Male
                                                                        <input type="radio" name="gender" value="Female">Female
                                                                    </c:if>
                                                                    <c:if test="${patient.gender eq 'Female'}">
                                                                        <input type="radio" name="gender" value="Male" >Male
                                                                    <input type="radio" name="gender" value="Female" checked="checked">Female
                                                                    </c:if>
                                                   
                                        </div>
										<div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Address</label>
                                                <input type="text" name="address" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" placeholder="Address" id="User_name" required value="${patient.address}"/>
                                        </div>
                                            <div class="row">
                                                <label for="Password" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Phone 1</label>
                                                <input type="tel" name="phoneNumber1" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" id="Password" placeholder="******" required value="${patient.phoneNumber1}"/>
                                            </div>
											<div class="row">
                                                <label for="Password" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Phone 2</label>
                                                <input type="tel" name="phoneNumber2" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" id="Password" placeholder="******" value="${patient.phoneNumber2}"/>
                                            </div>
											<div class="row">
                                                <label for="Password" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Birthdate</label>
                                                <input type="date" name="birthDate" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" id="Password" placeholder="******" value="${patient.birthDate}"/>
                                            </div>
											<div class="row">
                                                <label for="Password" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Age</label>
                                                <input type="number" name="age" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" id="Password" placeholder="18" value="${patient.age}"/>
                                            </div>
											<div class="row">
                                                <label for="Password" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Email</label>
                                                <input type="email" name="email" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" id="Password" placeholder="name@example.com" value="${patient.email}"/>
                                            </div>
                                   <div class="panel-heading">
                                    Insurance Data
									</div>
									
									<div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Insurance Company</label>
                                                      
                                                 <select name="insuranceCompany" id="insuranceCompany" >
                                                    <option value="0" disabled="disabled" selected="selected">--Select--</option>
                                                        <c:forEach items="${insuranceCompanies}" var="company">
                                                            <c:choose>
                                                                <c:when test="${company.nameEn eq patient.insuranceCompany.nameEn}">
                                                                    <option value="${company.id}" selected="selected">${company.nameEn}</option>            
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${company.id}">${company.nameEn}</option>            
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </c:forEach> 
                                                </select>
                                                
                                        </div>
										
                                        <div class="text-right">
                                            <button type="submit">${operation}<i class="fa fa-arrow-circle-right"></i></button>
                                        </div>
                                    </form>

                                </div>
								
                            </div>

                            <!--  Widget Part-->
            
                            <%@include file="../basic/widgets.jsp" %>
                                
                        </div>

        
        </div> <!--End Content-->
            
    </div><!--End Main Container-->

</div><!--End Body Container-->

</body>

</html>
         