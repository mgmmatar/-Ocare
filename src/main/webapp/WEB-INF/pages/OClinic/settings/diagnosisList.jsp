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
        <title>Diagnosis List</title>
    </head>
    <body>
    <center>
        <h1>
            Diagnosis List
        </h1>
    </center>

    <table>
        <thead>
        <td style="width: 100px"><center>ID</center></td>
    <td style="width: 300px"><center>Name </center> </td>
<td style="width: 100px"><center>Description</center></td>
<td style="width: 100px"><center>Level</center></td>
<td style="width: 200px"><center>Medical_Section_Id</center></td>
<td style="width: 100px"><center>Edit</center></td>
<td style="width: 100px"><center>Delete</center></td>
</thead>
<tbody>

    <c:forEach items="${diagnosisType}" var="diagnosisTypes">
        <tr>
            <td><center>${diagnosisTypes.id}</center></td>
<td><center>${diagnosisTypes.name} </center></td>
<td><center>${diagnosisTypes.description}</center></td>
<td><center>${diagnosisTypes.level}</center></td>
<td><center>${diagnosisTypes.medicalSection.name}</center></td>
<td><center><a href="<c:url value='/monitor/diagnosis/edit/${diagnosisTypes.id}' />">Edit</a></center></td>
<td><center><a href="<c:url value='/monitor/diagnosis/delete/${diagnosisTypes.id}' />">Delete</a></center></td>
</tr>
</c:forEach>

</tbody>
</table>


<center>
    <a href="/ocare/monitor/diagnosis/add">Add New</a>
</center>

</body>
</html>
