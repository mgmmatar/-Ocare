<%-- 
    Document   : patientTable
    Created on : Jul 7, 2016, 9:47:05 PM
    Author     : khaledeng
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

                        
                <c:choose>
                    <c:when  test="${not empty patients}">
                        
                        <center><h4>Patient List</h4></center>
                        
                        <table id="mainTable" class="table table-striped" style="cursor: pointer;">
                                <thead>
                                    <tr>
                                        <th style="font-size: 18px">#</th>
                                        <th style="font-size: 16px">Full Name</th>
                                        <th style="font-size: 16px">Code</th>
                                        <th style="font-size: 16px">Age</th>
                                        <th style="font-size: 16px" >Gender</th>
                                        <th style="font-size: 16px">Telephone</th>
                                        <th style="font-size: 16px">Profile</th>
                                        <th><img src="<c:url value='/resources/images/add-sign.png'/>" id="AddNewExamineType" class="examineTypeAddButton"/></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${patients}" var="patient" varStatus="counter">
                                        <tr class="patientRow">
                                            <input type="hidden" name="patientId" value="${patient.id}"/>
                                            <th>${counter.count}</th>
                                            <td tabindex="1">${patient.fName} ${patient.midName} ${patient.lName} <img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/></td>
                                            <td tabindex="1">${patient.code} <img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/></td>
                                            <td tabindex="1">${patient.age} <img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/></td>
                                            <td tabindex="1">${patient.gender} <img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/></td>
                                            <td tabindex="1">${patient.phoneNumber1} <img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/></td>
                                            <th>PROFILE</th>
                                            <th tabindex="1"><img src="<c:url value='/resources/images/delete-sign.png'/>" id="DeleteExamineType" class="examineTypeDeleteButton"/></th>
                                        </tr>
                                    </c:forEach>
                                    </tbody>

                            </table>
                    </c:when>
                    <c:otherwise>
                                No Result Found
                    </c:otherwise>
                </c:choose>                                    