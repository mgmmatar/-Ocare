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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prescription List</title>
    </head>
    <body>
    <center>
        <h1>
            Prescription List
        </h1>
    </center>

    <table>
        <thead>
        <td style="width: 100px"><center>ID</center></td>
    <td style="width: 300px"><center>Name </center> </td>
<td style="width: 100px"><center>prescriptionType</center></td>
<td style="width: 100px"><center>Edit</center></td>
<td style="width: 100px"><center>Delete</center></td>
</thead>
<tbody>

    <c:forEach items="${prescriptionType}" var="prescriptionTypes">
        <tr>
            <td><center>${prescriptionTypes.id}</center></td>
<td><center>${prescriptionTypes.name} </center></td>
<td><center>${prescriptionTypes.prescriptionType.name}</center></td>
<td><center><a href="<c:url value='/monitor/prescription/edit/${prescriptionTypes.id}' />">Edit</a></center></td>
<td><center><a href="<c:url value='/monitor/prescription/delete/${prescriptionTypes.id}' />">Delete</a></center></td>
</tr>
</c:forEach>

</tbody>
</table>


<center>
    <a href="/ocare/monitor/prescription/add">Add New</a>
</center>

</body>
</html>
