<%-- 
    Document   : adminTable
    Created on : Nov 11, 2016, 2:38:17 PM
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
                <th style="font-size: 16px">Full-Name</th>
                <th style="font-size: 16px">User-Name</th>
                <th style="font-size: 16px">Role</th>
                <th style="font-size: 16px">Phone</th>
                <th style="font-size: 16px">Active</th>
                <th style="font-size: 16px">Profile</th>
                <th><img src="<c:url value='/resources/images/add-sign.png'/>" id="AddNewInsurranceCompany" class="insurranceCompanyAddButton"/></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${myUsers}" var="myUser" varStatus="counter">
                <tr class="insurranceRow">
                    <th>${counter.count}</th>
                    <td tabindex="1">${myUser.firstName} ${myUser.lastName}</td>
                    <td tabindex="2">${myUser.auth.userName}</td>
                    <td tabindex="3">ROLE</td>
                    
                    <c:choose>
                        <c:when test="${not empty myUser.phoneNumber1}">
                            <td tabindex="4">${myUser.phoneNumber1} </td>
                        </c:when>
                        <c:otherwise>
                            <c:when test="${not empty myUser.phoneNumber2}">
                                <td tabindex="4">${myUser.phoneNumber2} </td>
                            </c:when>
                            <c:otherwise>
                                <td tabindex="4">Empty</td>
                            </c:otherwise>
                        </c:otherwise>
                    </c:choose>
                    
                    <td tabindex="5">
                       <c:choose>
                            <c:when test="${myUser.active}">
                                <input type="checkbox" class="userActive" checked>
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" class="userActive">
                            </c:otherwise>    
                        </c:choose> 
                    </td>
                    <th><a class="btn profiles" style="display: inline-table;">Profile</a></th>
                    <th tabindex="6"><img src="<c:url value='/resources/images/delete-sign.png'/>" id="DeleteInsurranceCompany" class="insurranceCompanyDeleteButton"/></th>
                </tr>
            </c:forEach>
        </tbody>
    </table>