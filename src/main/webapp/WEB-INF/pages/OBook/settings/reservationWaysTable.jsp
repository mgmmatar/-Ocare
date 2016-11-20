<%-- 
    Document   : examineTypeTable
    Created on : Jul 2, 2016, 8:38:08 AM
    Author     : khaledeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

                        <table id="reservationWayTable" class="table table-striped" style="cursor: pointer;">
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
                                    <c:choose>
                                        <c:when test="${empty reservationWays}">
                                            <tr><td  colspan="8"><center><lable>No Reservation Way Found</lable></center></td></tr>
                                        </c:when>
                                        <c:otherwise>
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
                                                       <label class="switch">
                                                           <input type="checkbox" class="defaultReservationWayChecker" checked>
                                                             <div class="slider round"></div>
                                                                </label>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <label class="switch">
                                                           <input type="checkbox" class="defaultReservationWayChecker" >
                                                             <div class="slider round"></div>
                                                                </label>
                                                    </c:otherwise>    
                                                </c:choose>
                                                
                                            </th>
                                            <th tabindex="1"><img src="<c:url value='/resources/images/delete-sign.png'/>" id="DeleteReservationWay" class="reservationWayDeleteButton"
                                                                  data-ssd-confirm-trigger="remove"
                                                                              data-ssd-confirm-message="Are you sure you wish to remove ${reservationWay.nameEn} ?<br />There is no undo!"
                                                                              data-ssd-confirm-url="/zmed/settings/reservationWay/delete/${reservationWay.id}"
                                                                              data-ssd-confirm-behaviour="reload"/>
                                            </th>
                                        </tr>
                                    </c:forEach>
                        </c:otherwise>
                </c:choose>
               </tbody>
       </table>