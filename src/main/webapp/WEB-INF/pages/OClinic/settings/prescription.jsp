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
        <title>${operation} Prescription</title>
    </head>
    <body>

        <!-- Header Text -->
    <center>
        <h1>
            ${operation} Prescription
        </h1>
    </center>

    <!-- Add/Edit Form -->

    <center>
        <form id="demo-form2" method="POST" action="/zmed/monitor/prescription/process" modelAttribute="prescription">

            <input type="hidden" name="id"  value="${prescriptionEdit.id}"/>

            <table>
                <tr>
                    <td>
                        Name :
                    </td>
                    <td>
                        <input type="text" name="name" size="20" value="${prescriptionEdit.name}"/>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        prescriptionType :
                    </td>
                    <td>
                        <select name="prescriptionType.id" >
                            <c:forEach items="${prescriptionType}" var="prescriptionTypes" >
                                      
                                        <c:choose>
                                    <c:when test="${prescriptionTypes.id eq prescriptionEdit.prescriptionType.id}">
                                        <option  value="<c:out value="${prescriptionTypes.id}"/>" selected="selected"><c:out value="${prescriptionTypes.name}"/></option>
                                    </c:when>
                                    <c:otherwise>
                                        <option  value="<c:out value="${prescriptionTypes.id}"/>"><c:out value="${prescriptionTypes.name}"/></option>
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
