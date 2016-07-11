<%-- 
    Document   : examineTypeTable
    Created on : Jul 2, 2016, 8:38:08 AM
    Author     : khaledeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

                        <table id="mainTable" class="table table-striped" style="cursor: pointer;">
                                <thead>
                                    <tr>
                                        <th style="font-size: 18px">#</th>
                                        <th style="font-size: 16px">Name Ar</th>
                                        <th style="font-size: 16px">Name En</th>
                                        <th style="font-size: 16px">Desc</th>
                                        <th style="font-size: 16px">Default</th>
                                        <th><img src="<c:url value='/resources/images/add-sign.png'/>" id="AddNewReservationWay" class="reservationWayAddButton"/></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${reservationWays}" var="reservationWay" varStatus="counter">
                                        <tr class="examineRow">
                                            <input type="hidden" name="reservationWayId" value="${reservationWay.id}"/>
                                            <th>${counter.count}</th>
                                            <td tabindex="1">${reservationWay.nameAr} <img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/></td>
                                            <td tabindex="1">${reservationWay.nameEn} <img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/></td>
                                            <td tabindex="1">${reservationWay.description} <img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/></td>
                                            <th tabindex="1">
                                                <c:choose>
                                                    <c:when test="${reservationWay.defaultOne}">
                                                        <input type="checkbox" class="defaultReservationWayChecker" checked>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="checkbox" class="defaultReservationWayChecker">
                                                    </c:otherwise>    
                                                </c:choose>
                                                
                                            </th>
                                            <th tabindex="1"><img src="<c:url value='/resources/images/delete-sign.png'/>" id="DeleteReservationWay" class="reservationWayDeleteButton"/></th>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                            </table>