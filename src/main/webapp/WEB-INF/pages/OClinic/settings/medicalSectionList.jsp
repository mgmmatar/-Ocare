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
        <title>medical Section</title>
    </head>
    <body>
    <center>
        <h1>
            medical Section List
        </h1>
    </center>

    <table>
        <thead>
        <td style="width: 100px"><center>ID</center></td>
    <td style="width: 300px"><center>Name</center> </td>
<td style="width: 200px"><center>Description</center></td>
<td style="width: 100px"><center>Edit</center></td>
<td style="width: 100px"><center>Delete</center></td>
</thead>
<tbody>

    <c:forEach items="${medicalSectionType}" var="medicalsection">
        <tr>
            <td><center>${medicalsection.id}</center></td>
<td><center>${medicalsection.name} </center></td>
<td><center>${medicalsection.description}</center></td>
<td><center><a href="<c:url value='/monitor/medicalsection/edit/${medicalsection.id}' />">Edit</a></center></td>
<td><center><a href="<c:url value='/monitor/medicalsection/delete/${medicalsection.id}' />">Delete</a></center></td>
</tr>
</c:forEach>

</tbody>
</table>


<center>
    <a href="/ocare/monitor/medicalsection/add">Add New</a>
</center>

</body>
</html>
