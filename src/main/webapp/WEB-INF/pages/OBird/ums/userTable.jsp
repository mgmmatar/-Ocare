<%-- 
    Document   : adminTable
    Created on : Nov 11, 2016, 2:38:17 PM
    Author     : khaledeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
     
<style>
    .btn:hover,.btn profiles:hover{
                    
                     text-decoration: underline;
                     color: #0762cc;
                     cursor: pointer;
                }
</style>
    <table id="userTable" class="table table-striped" >
        <thead>
            <tr>
                <th style="font-size: 18px">#</th>
                <th style="font-size: 16px">Full-Name</th>
                <th style="font-size: 16px">User-Name</th>
                <th style="font-size: 16px">Role</th>
                <th style="font-size: 16px">Phone</th>
                <th style="font-size: 16px">Active</th>
                <th style="font-size: 16px">Profile</th>
                <th><img src="<c:url value='/resources/images/add-sign.png'/>" id="RegisterUser" class="insurranceCompanyAddButton"/></th>
            </tr>
        </thead>
        <tbody>
           <c:choose>
            <c:when test="${empty myUsers}">
                <tr><td  colspan="8"><center><lable>No User Found</lable></center></td></tr>
            </c:when>
            <c:otherwise>    
                <c:forEach items="${myUsers}" var="myUser" varStatus="counter">
                    <tr class="insurranceRow">
                        <input type="hidden" name="userId" value="${myUser.id}"/>
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
                                   <label class="switch">
                                       <input type="checkbox" class="enableUser" checked>
                                    <div class="slider round"></div>
                                    </label>
                                </c:when>
                                <c:otherwise>
                                    <label class="switch">
                                        <input type="checkbox" class="enableUser" >
                                    <div class="slider round"></div>
                                    </label>
                                </c:otherwise>    
                            </c:choose> 
                        </td>
                        <th><a class="btn profiles" style="display: inline-table;font-size: 15px;font-weight: bold">Profile</a></th>
                        <th tabindex="6"><img src="<c:url value='/resources/images/delete-sign.png'/>" id="DeleteInsurranceCompany" class="insurranceCompanyDeleteButton"
                                              data-ssd-confirm-trigger="remove"
                                            data-ssd-confirm-message="Are you sure you wish to remove ${myUser.firstName} ${myUser.lastName}  ?<br />There is no undo!"
                                            data-ssd-confirm-url="/ocare/ums/user/delete/${myUser.id}"
                                            data-ssd-confirm-behaviour="reload"/>
                        </th>
                    </tr>
                </c:forEach>
             </c:otherwise>
            </c:choose>    
        </tbody>
    </table>
            
    
            