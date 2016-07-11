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
        <title>${operation} MedicalSection</title>
    </head>
    <body>

        <!-- Header Text -->
    <center>
        <h1>
            ${operation} MedicalSection
        </h1>
    </center>

    <!-- Add/Edit Form -->

    <center>
        <form id="demo-form2" method="POST" action="/zmed/monitor/medicalsection/process" modelAttribute="medicalSection">

            <input type="hidden" name="id"  value="${medicalSectionEdit.id}"/>

            <table>
                <tr>
                    <td>
                        Name :
                    </td>
                    <td>
                        <input type="text" name="name" size="20" value="${medicalSectionEdit.name}"/>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        Description :
                    </td>
                    <td>
                        <input type="text" name="description" size="20" value="${medicalSectionEdit.description}"/>
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
