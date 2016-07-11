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
                                        <th><img src="<c:url value='/resources/images/add-sign.png'/>" id="AddNewInsurranceCompany" class="insurranceCompanyAddButton"/></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${insuranceCompanys}" var="insuranceCompany" varStatus="counter">
                                        <tr class="insurranceRow">
                                            <input type="hidden" name="insurranceCompanyId" value="${insuranceCompany.id}"/>
                                            <th>${counter.count}</th>
                                            <td tabindex="1">${insuranceCompany.nameAr} <img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/></td>
                                            <td tabindex="1">${insuranceCompany.nameEn} <img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/></td>
                                            <td tabindex="1">${insuranceCompany.description} <img src="<c:url value='/resources/images/editable-icon.png'/>" class="editableIcon"/></td>
                                            <th tabindex="1"><img src="<c:url value='/resources/images/delete-sign.png'/>" id="DeleteInsurranceCompany" class="insurranceCompanyDeleteButton"/></th>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                        </table>