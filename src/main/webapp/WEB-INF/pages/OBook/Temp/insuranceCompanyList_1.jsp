<%--
    Document   : examineTypeList
    Created on : Nov 14, 2015, 5:48:28 PM
    Author     : khaledeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
                              
         <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Insurance Company List</title>
            <!-- Morris Chart Styles-->
            <link href="<c:url value='/resources/css/morris-0.4.3.min.css'/>" rel="stylesheet" />
            <link href="<c:url value='/resources/css/animation.css'/>" rel="stylesheet" />
            <link href="<c:url value='/resources/css/bootstrap.css'/>" rel="stylesheet" />
            <link href="<c:url value='/resources/css/font-awesome.css'/>" rel="stylesheet" />
            
            <!-----JavaScripts --->
            <script src= "<c:url value='/resources/js/custom-scripts.js'/>"></script>
            <script src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
            <script src="<c:url value='/resources/js/nprogress.js'/>"></script>
            <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
            
            <!-- Google Fonts-->
            <link href="<c:url value='/resources/css/googlefonts.css'/>" rel="stylesheet" />
            <%@include file="../basic/scripts.jsp" %>
            
    </head>

<body class="nav-md">

<div class="container body">

    <div class="main_container">

    <!---  Importing SideBar --->
        
        <%@include file="../basic/sidebar.jsp" %>
        
        <!-- Header -->
         
        <%@include file="../basic/header.jsp" %>
            
            <!-- /. NAV SIDE  -->
             <div class="right_col" role="main">

            
            <div id="page-wrapper">
                <div id="page-inner">


                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="page-header">
                                <small>Insurance Company List</small>
                            </h1>
                        </div>
                    </div>
                    <!-- /. ROW  -->
                    <!-- /. ROW  -->
                    <div id="notifaction" class="alert alert-success hidden" role="alert">Operation done successfully</div>
                    <div class="row expandUp">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                  Insurance Companies
                                </div>
                                <div class="panel-body">
                                
                                <table border=2>
                                    <thead style="background-color: #C0392B" >
                                            <td style="width: 100px"><center>ID</center></td>
                                            <td style="width: 300px"><center>Name Ar</center> </td>
                                            <td style="width: 100px"><center>Name En</center></td>
                                            <td style="width: 100px"><center>Description</center></td>
                                            <td style="width: 100px"><center>Edit</center></td>
                                            <td style="width: 100px"><center>Delete</center></td>
                                    </thead>
                                <c:forEach items="${insuranceCompanies}" var="insuranceCompany">
                                    <tr>
                                        <td><center>${insuranceCompany.id}</center></td>
                                        <td><center>${insuranceCompany.nameAr} </center></td>
                                        <td><center>${insuranceCompany.nameEn}</center></td>
                                        <td><center>${insuranceCompany.description}</center></td>
                                        <td><center><a href="<c:url value='/settings/insurance/edit/${insuranceCompany.id}' />">Edit</a></center></td>
                                        <td><center><a href="<c:url value='/settings/insurance/delete/${insuranceCompany.id}' />">Delete</a></center></td>
                                    </tr>
                                </c:forEach>                                                                                                        
                                </table>
                                </div>
                                <center>
                                    <a href="/zmed/settings/insurance/add">Add New</a>
                                </center>
                                        <!--<div class="text-right">
                                            <button type="submit"> Submit </button>
                                        </div>-->
                                    </form>

                                </div>
								
                            </div>

                        </div>
                    </div>
                    <!-- /. ROW  -->

                    <!-- /. PAGE INNER  -->
                </div>
                <!-- /. PAGE WRAPPER  -->
            </div>
        </div>
    </div>

    </body>


</html>
