<%-- 
    Document   : examineTypeTable
    Created on : Jul 2, 2016, 8:38:08 AM
    Author     : khaledeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<style>
    .table td:hover{
        background-color: #c1c1c1;
        border-radius: 10px;
    } 
    .table-striped > tbody > tr:nth-child(odd) > td:hover{
        background-color: #c1c1c1;
        border-radius: 10px;
    }
    .btn:hover,.btn profiles:hover{
                    
                     text-decoration: underline;
                     color: #0762cc;
                     cursor: pointer;
                }
</style>
                        <table id="insurranceCompanyTable" class="table table-striped" style="cursor: pointer;">
                                <thead>
                                    <tr>
                                        <th style="font-size: 18px">#</th>
                                        <th style="font-size: 16px">Name Ar</th>
                                        <th style="font-size: 16px">Name En</th>
                                        <th style="font-size: 16px">Description</th>
                                        <th style="font-size: 16px">Profile</th>
                                        <th><img src="<c:url value='/resources/images/add-sign.png'/>" id="AddNewInsurranceCompany" class="insurranceCompanyAddButton"/></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${empty insuranceCompanys}">
                                            <tr><td  colspan="8"><center><lable>No Insurrance Company Found</lable></center></td></tr>
                                        </c:when>
                                        <c:otherwise>
                                    <c:forEach items="${insuranceCompanys}" var="insuranceCompany" varStatus="counter">
                                        <tr class="insurranceRow">
                                            <input type="hidden" name="insurranceCompanyId" value="${insuranceCompany.id}"/>
                                            <th>${counter.count}</th>
                                            <td tabindex="1">${insuranceCompany.nameAr} <img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/></td>
                                            <td tabindex="1">${insuranceCompany.nameEn} <img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/></td>
                                            <td tabindex="1">${insuranceCompany.description} <img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/></td>
                                            <th><a class="btn profiles" style="display: inline-table;font-size: 15px;font-weight: bold">Profile</a></th>
                                            <th tabindex="1"><img src="<c:url value='/resources/images/delete-sign.png'/>" id="DeleteInsurranceCompany" class="insurranceCompanyDeleteButton"
                                                                data-ssd-confirm-trigger="remove"
                                                                data-ssd-confirm-message="Are you sure you wish to remove ${insuranceCompany.nameEn} ?<br />There is no undo!"
                                                                data-ssd-confirm-url="/ocare/settings/insurrance/delete/${insuranceCompany.id}"
                                                                data-ssd-confirm-behaviour="reload"/>
                                            </th>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
        </tbody>
</table>