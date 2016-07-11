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
        <title>${operation} Complain Type</title>
    </head>
    <body>

        <!-- Header Text -->
    <center>
        <h1>
            ${operation} Complain Type
        </h1>
    </center>

    <!-- Add/Edit Form -->

    <center>
        <form id="demo-form2" method="POST" action="/zmed/monitor/complain/process" modelAttribute="complain">

            <input type="hidden" name="id"  value="${complain.id}"/>

            <table>
                <tr>
                    <td>
                        Name :
                    </td>
                    <td>
                        <input type="text" name="name" size="20" value="${complain.name}"/>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        Description :
                    </td>
                    <td>
                        <input type="text" name="description" size="20" value="${complain.description}"/>
                    </td>
                </tr>

                <tr>
                    <td>
                       Medical_Section :
                    </td>
                    <td>
                        <select name="medicalSection.id" >
                            <c:forEach items="${medicalSections}" var="medicalSection" >
                                      
                                        <c:choose>
                                    <c:when test="${medicalSection.id eq complain.medicalSection.id}">
                                        <option  value="<c:out value="${medicalSection.id}"/>" selected="selected"><c:out value="${medicalSection.name}"/></option>
                                    </c:when>
                                    <c:otherwise>
                                        <option  value="<c:out value="${medicalSection.id}"/>"><c:out value="${medicalSection.name}"/></option>
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
