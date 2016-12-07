<%-- 
    Document   : examineTypeTable
    Created on : Jul 2, 2016, 8:38:08 AM
    Author     : khaledeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
 
                        <table id="examineTypeTable" class="table table-striped" style="cursor: pointer;">
                                <thead>
                                    <tr>
                                        <th style="font-size: 18px">#</th>
                                        <th style="font-size: 16px">Name Ar</th>
                                        <th style="font-size: 16px">Name En</th>
                                        <th style="font-size: 16px">Desc</th>
                                        <th style="font-size: 16px" >Cost</th>
                                        <th style="font-size: 16px">Period</th>
                                        <th style="font-size: 16px">Default</th>
                                        <th><img src="<c:url value='/resources/images/add-sign.png'/>" id="AddNewExamineType" class="examineTypeAddButton"/></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${empty examineTypes}">
                                            <tr><td  colspan="8"><center><lable>No Examine Type Found</lable></center></td></tr>
                                        </c:when>
                                        <c:otherwise>
                                                <c:forEach items="${examineTypes}" var="examineType" varStatus="counter">
                                                    <tr class="examineRow">
                                                        <input type="hidden" name="examineTypeId" value="${examineType.id}"/>
                                                        <th>${counter.count}</th>
                                                        <td tabindex="1"><img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/> ${examineType.nameAr} </td>
                                                        <td tabindex="1"><img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/> ${examineType.nameEn}</td>
                                                        <td tabindex="1"><img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/> ${examineType.description}</td>
                                                        <td tabindex="1"><img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/> ${examineType.cost} </td>
                                                        <td tabindex="1"><img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/> ${examineType.estimatedPeriod} </td>
                                                        <th tabindex="1">
                                                            <c:choose>
                                                                <c:when test="${examineType.defaultOne}">
                                                                        <label class="switch">
                                                                            <input type="checkbox" class="defaultExamineTypeChecker" checked>
                                                                            <div class="slider round"></div>
                                                                        </label>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <label class="switch">
                                                                        <input type="checkbox" class="defaultExamineTypeChecker" >
                                                                        <div class="slider round"></div>
                                                                    </label>
                                                                </c:otherwise>    
                                                            </c:choose>

                                                        </th>
                                                        <th tabindex="1"><img src="<c:url value='/resources/images/delete-sign.png'/>" id="DeleteExamineType" class="examineTypeDeleteButton"
                                                                              data-ssd-confirm-trigger="remove"
                                                                              data-ssd-confirm-message="Are you sure you wish to remove ${examineType.nameEn} ?<br />There is no undo!"
                                                                              data-ssd-confirm-url="/ocare/settings/examineType/delete/${examineType.id}"
                                                                              data-ssd-confirm-behaviour="reload"/>
                                                                </th>
                                                    </tr>
                                                </c:forEach>
                                    </c:otherwise> 
                                </c:choose>     
                                    </tbody>
<!--                                <tfoot>
                                    <tr><th><strong>TOTAL</strong></th><th>1059</th><th>1308</th><th>5</th></tr>
                                </tfoot>-->
                            </table>