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
        <title>${operation} Prescription Type</title>
    </head>
    <body>

        <!-- Header Text -->
    <center>
        <h1>
            ${operation} Prescription Type
        </h1>
    </center>

    <!-- Add/Edit Form -->

    <center>
        <form id="demo-form2" method="POST" action="/ocare/monitor/prescriptiontype/process" modelAttribute="prescriptiontype">

            <input type="hidden" name="id"  value="${prescriptionTypes.id}"/>

            <table>
                
                   <tr>
                    <td>
                        Name :
                    </td>
                    <td>
                        <input type="text" name="name" size="20" value="${prescriptionTypes.name}"/>
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
