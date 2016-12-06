<%-- 
    Document   : examineTypeTable
    Created on : Jul 2, 2016, 8:38:08 AM
    Author     : khaledeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:useBean id="now" class="java.util.Date" />
<sec:authentication  var="loggedUser" property="name"/>
<!DOCTYPE html>
 
                        <table id="actionLogTable" class="table table-striped" style="cursor: pointer;">
                                <thead>
                                    <tr>
                                        <th style="font-size: 18px">#</th>
                                        <th style="font-size: 18px">Date</th>
                                        <th style="font-size: 16px">User</th>
                                        <th style="font-size: 16px">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${empty logs}">
                                            <tr><td  colspan="4"><center><lable>No Logs Found</lable></center></td></tr>
                                        </c:when>
                                        <c:otherwise>
                                                <c:forEach items="${logs}" var="log" varStatus="counter">
                                                    <tr class="examineRow">
                                                        <th>${counter.count}</th>
                                                        <td tabindex="1">
                                                            <fmt:formatDate type="date" value="${log.created}" var="logDate" pattern="yyyy-MM-dd" />
                                                            <fmt:formatDate type="date" value="${now}" var="nowDate" pattern="yyyy-MM-dd" />                                                            
                                                            <c:choose>
                                                                <c:when test="${logDate eq nowDate}">    
                                                                    Today - <fmt:formatDate type="time" pattern="hh:mm a" value="${log.created}"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${logDate} - <fmt:formatDate type="time" pattern="hh:mm a" value="${log.created}"/>
                                                                </c:otherwise>
                                                            </c:choose>
                                                             
                                                        </td>
                                                        <td tabindex="1">
                                                            <c:choose>
                                                                <c:when test="${log.myUser.auth.userName eq loggedUser}">    
                                                                    You
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${log.myUser.firstName} ${log.myUser.lastName} 
                                                                </c:otherwise>
                                                            </c:choose>
                                                            
                                                        </td>
                                                        <td tabindex="1">${log.action}</td>                                                        
                                                    </tr>
                                                </c:forEach>
                                    </c:otherwise> 
                                </c:choose>     
                                    </tbody>
</table>
                        