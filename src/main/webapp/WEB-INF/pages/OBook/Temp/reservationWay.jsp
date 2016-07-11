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
    <title> Reservation Way </title>
    <!--- Import Common Scripts ---->
            <link href="<c:url value='/resources/css/morris-0.4.3.min.css'/>" rel="stylesheet" />
            <link href="<c:url value='/resources/css/animation.css'/>" rel="stylesheet" />
            <link href="<c:url value='/resources/css/bootstrap.css'/>" rel="stylesheet" />
            <link href="<c:url value='/resources/css/font-awesome.css'/>" rel="stylesheet" />
            <!-- Custom Styles-->
            <link href="<c:url value='/resources/css/custom-styles.css" rel="stylesheet'/>" />            
            <!-----JavaScripts --->
            <script src= "<c:url value='/resources/js/custom-scripts.js'/>"></script>
            <script src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
            <script src="<c:url value='/resources/js/nprogress.js'/>"></script>
            <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
            
            <!-- Google Fonts-->
            <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
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
                        <h3>${operation} Reservation Way</h3>
                    </div>
                </div>
        
        <div class="clearfix"></div>
           
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Reservation Way
                                </div>
                                <div class="panel-body">
                                    <form id="aboutChefForm" method="POST" action="/zmed/settings/reservationWay/process" modelAttribute="reservationWay" >
                                       
                                        <input type="hidden" name="id" value="${reservationWay.id}"/>
                                        
                                        <div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">NameAr</label>
                                                <input type="text" name="nameAr" value="${reservationWay.nameAr}" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" placeholder="Name" id="User_name" required>
                                            </div>
										<div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">NameEn</label>
                                                <input type="text" name="nameEn" value="${reservationWay.nameEn}" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" placeholder=" Name " id="User_name" required>
                                        </div>
										<div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Description</label>
                                                <input type="text" name="description" value="${reservationWay.description}" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" placeholder=" Description" id="User_name" required>
                                        </div>
                                        
                                                                              
                                        <div class="text-right">
                                            <button type="submit"> ${operation} </button>
                                        </div>
                                        
                                    </form>

                                </div>
								
                            </div>

                            <!-- Widget -->
                            <%@include file="../basic/widgets.jsp" %>                     
                                        
                        </div>

        
        </div> <!--End Content-->
            
    </div><!--End Main Container-->

</div><!--End Body Container-->

</body>

</html>
         