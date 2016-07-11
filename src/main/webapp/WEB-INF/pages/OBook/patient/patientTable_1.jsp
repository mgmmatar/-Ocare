<%-- 
    Document   : patientTable
    Created on : Jul 7, 2016, 9:47:05 PM
    Author     : khaledeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
                                    <table border=2>
                                                <tr>
                                                    <thead style="background-color: #C0392B" >  
                                                        <td style="width: 100px"><center>ID</center></td>
                                                        <td style="width: 300px"><center>Full Name</center> </td>
                                                        <td style="width: 100px"><center>Gender</center></td>
                                                        <td style="width: 100px"><center>Age</center></td>
                                                        <td style="width: 100px"><center>Telephone</center></td>
                                                        <td style="width: 200px"><center>View</center></td>
                                                        <td style="width: 100px"><center>Edit</center></td>
                                                        <td style="width: 100px"><center>Delete</center></td>
                                                    </thead>
                                                </tr>    
                                        <c:forEach items="${patients}" var="patient">
                                                <tr>
                                                        <td><center>${patient.id}</center></td>
                                                        <td><center>${patient.fName} ${patient.midName} ${patient.lName}</center></td>
                                                        <td><center>${patient.gender}</center></td>
                                                        <td><center>${patient.age}</center></td>
                                                        <td><center>${patient.phoneNumber1}</center></td>
                                                        <td><center><a href="<c:url value='/patient/view/${patient.id}' />">View</a></center></td>
                                                        <td><center><a href="<c:url value='/patient/edit/${patient.id}' />">Edit</a></center></td>
                                                        <td><center><a href="<c:url value='/patient/delete/${patient.id}' />">Delete</a></center></td>
                                                </tr>
                                            </c:forEach>                                                                                                        
                                    </table>