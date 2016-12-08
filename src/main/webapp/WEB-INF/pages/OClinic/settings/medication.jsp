<%--
    Document   : examineType
    Created on : Nov 14, 2015, 4:28:15 PM
    Author     : khaledeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${operation} Medication</title>
    </head>
    <body>

        <!-- Header Text -->
    <center>
        <h1>
            ${operation} Medication
        </h1>
    </center>

    <!-- Add/Edit Form -->

    <center>
        <form id="demo-form2" method="POST" action="/ocare/monitor/medication/process" modelAttribute="medication">

            <input type="hidden" name="id"  value="${medicationEdit.id}"/>

            <table>
                <tr>
                    <td>
                        Name :
                    </td>
                    <td>
                        <input type="text" name="name" size="20" value="${medicationEdit.name}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        medicationClass Id :
                    </td>
                    <td>
                        <select name="medicationClass.id" >
                            <c:forEach items="${medicationClass}" var="medicationClasss" >
                                      
                                        <c:choose>
                                    <c:when test="${medicationClasss.id eq medication.medicationClasss.id}">
                                        <option  value="<c:out value="${medicationClasss.id}"/>" selected="selected"><c:out value="${medicationClasss.name}"/></option>
                                    </c:when>
                                    <c:otherwise>
                                        <option  value="<c:out value="${medicationClasss.id}"/>"><c:out value="${medicationClasss.name}"/></option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach> 
                        </select>                
                    </td>
                </tr>
                


                <tr>
                    <td>
                        <input type="submit" value="${operation}">
                        
                    </td>

                </tr>

            </table>


        </form>
    </center>
</body>
</html>
