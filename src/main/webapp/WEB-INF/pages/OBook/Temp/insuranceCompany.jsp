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
    <title> Insurance Company </title>
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
                    <script type="text/javascript">
            $(document).ready(function() {


                $("#addprofile").click(function() {

                    var myRow = "<tr>"
                            + "<td class='insurance-row'>Examine Type   :</td>"
                            + "<td class='insurance-row'>"
                            + "<select>"
                            + "<c:forEach items='${examineTypes}' var='examineType'>"
                            + "<option value='${examineType.id}'>${examineType.nameEn}</option>"
                            + "</c:forEach>"
                            + "</select>"
                            + "</td>"
                            + "<td class='insurance-row'> Percentage :</td>"
                            + "<td class='insurance-row'>"
                            + "<select name='estimatedPeriod' id='estimatedPeriod'>"
                            + "<c:forEach var='j' begin='5' end='100' step='5'>"
                            + "<option  value='<c:out value='${j}%'/>'><c:out value='${j}%'/></option>"
                            + "</c:forEach>"
                            + "</select>"
                            + "</td>"
                            + "<td class='insurance-row'>"
                            + "<button type='button' class='deleteProfile' >Delete</button>"
                            + "</td>"
                            + "</tr>";

                    // Appending New Row for Table
                    $('#profiles > tbody > tr').eq(1).after(myRow);
                    // Adding Action to Delete Button
                    $(".deleteProfile").click(function() {
                        $(this).closest("tr").remove();
                    });

                });
            });
            </script>
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
                        <h3>${operation} Insurance Company</h3>
                    </div>
                </div>
        
        <div class="clearfix"></div>
           
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                 Insurance Companies
                                </div>
                                <div class="panel-body">
                                    <form id="aboutChefForm" method="POST" action="/zmed/settings/insurance/process" modelAttribute="insuranceCompany"  accept-charset="utf-8" >
                                         <input type="hidden" name="id"  value="${insuranceCompany.id}"/>
                                        <div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Name(En):</label>
                                                <input type="text" name="nameEn" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" placeholder="Name" id="User_name" required value="${insuranceCompany.nameEn}"/>
                                            </div>
					<div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Name(Ar):</label>
                                                <input type="text" name="nameAr" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" placeholder=" الاســم" id="User_name" required value="${insuranceCompany.nameAr}">
                                        </div>
					<div class="row">
                                                <label for="User_name" class="col-lg-2 col-md-2 col-sm-2 col-xs-3">Description</label>
                                                <input type="text" name="description" class="col-lg-10 col-md-10 col-sm-10 col-xs-9" placeholder=" Description" id="User_name" required value="${insuranceCompany.description}"/>
                                        </div>
                                        <center>
                                            <table id="profiles">
                                            <tr>
                                                <td colspan = "5">
                                            <center><label class="insurance-head"> Insurance Profiles  :</label></center>
                                            </td>

                                            </tr>

                                            <tr>
                                                <td class="insurance-row">
                                                    Examine Type   :
                                                </td>
                                                <td class="insurance-row">
                                                    <select>
                                                        <c:forEach items="${examineTypes}" var="examineType">
                                                            <option value="${examineType.id}">${examineType.nameEn}</option>
                                                        </c:forEach>
                                                    </select>

                                                </td>

                                                <td class="insurance-row">
                                                    Percentage :
                                                </td>

                                                <td class="insurance-row">
                                                    <select name="estimatedPeriod" id="estimatedPeriod">
                                                        <c:forEach var="i" begin="5" end="100" step="5">
                                                            <c:choose>
                                                                <c:when test="${i eq 50}">
                                                                    <option  value="<c:out value="${i}%"/>" selected="selected"><c:out value="${i}%"/></option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option  value="<c:out value="${i}%"/>"><c:out value="${i}%"/></option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>

                                                    </select>
                                                </td>
                                                <td>
                                                    <button type="button" id="addprofile" >New Profile</button>
                                                </td>
                                            </tr>
                                            
                                        </table>
                                       </center> 
                                            
                                        <div class="text-right">
                                            <button type="submit" > ${operation} </button>
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
         