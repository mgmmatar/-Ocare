<%-- 
    Document   : reservationElement
    Created on : Jan 29, 2016, 5:38:15 PM
    Author     : khaledeng
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<c:choose>
    <c:when test="${not weekDay.offLine}">            
            <span class="title_main_con d_block margin_bottom_10 margin_top_20">Reservation Shifts </span>       
                <center>
                    <ul class="nav-tabs tabs_index pull-right green_nav_tab">    
                    <c:forEach items="${weekDay.workingTimes}" var="workingTime" varStatus="counter">
                         <c:choose>
                            <c:when test="${counter.count eq 1}">
                                <li class="active">
                                    <input type="hidden" name="workingTimeId" value="${workingTime.id}">     
                                    <a href="#shift_${counter.count}" data-toggle="tab" class="active"><fmt:formatDate type="time" pattern="hh:mma" value="${workingTime.timeFrom}"/>-<fmt:formatDate type="time" pattern="hh:mma" value="${workingTime.timeTo}"/></a>
                               </li> 
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <input type="hidden" name="workingTimeId" value="${workingTime.id}">    
                                    <a href="#shift_${counter.count}" data-toggle="tab"><fmt:formatDate type="time" pattern="hh:mma" value="${workingTime.timeFrom}"/>-<fmt:formatDate type="time" pattern="hh:mma" value="${workingTime.timeTo}"/></a>
                                </li> 
                            </c:otherwise>        
                        </c:choose>  
                 
                    </c:forEach> 
                </ul>      
              </center>      
        </c:when>
        <c:otherwise>
                   <span class="title_main_con d_block margin_bottom_10 margin_top_20">Today is OFFLINE </span>   
        </c:otherwise>
</c:choose>
                   
                   
  <div class="tab-content" style="display: inline-block;">                    
     <c:forEach items="${shifts}" var="shift" varStatus="counter">
         <c:choose>
             <c:when test="${counter.count eq 1}">
                 <div class="tab-pane fade active in" id="shift_${counter.count}">
             </c:when>
             <c:otherwise>
                  <div class="tab-pane fade" id="shift_${counter.count}">
             </c:otherwise>        
         </c:choose>            
          
              <div class="reservation-wrapper">
                   <center>    
                       <ul class="main">
                           <c:choose>
                               <c:when test="${empty shift.reservations}">
                                   <span class="title_main_con d_block margin_bottom_10 margin_top_20">No Reservation for that Shift</span>
                               </c:when>
                               <c:otherwise>
                                    <c:forEach items="${shift.reservations}" var="reservation" varStatus="counter">
                                    <div class="card col-md-12 col-sm-12 col-xs-12 mainContainer">
                                           <img class="userImg"src="<c:url value='/resources/images/avatar.jpg'/>" />
                                             <div class="details">
                                                     <h3 class="name">${reservation.patient.fName} ${reservation.patient.midName} ${reservation.patient.lName}</h3>
                                                     <h3 class="code">${reservation.patient.code}</h3>
                                                     <h3 class="examineType">${reservation.examineType.nameEn}</h3>
                                                     <h3 class="date"><fmt:formatDate type="time" pattern="hh:mm a" value="${reservation.attendenceTimeFrom}"/> <fmt:formatDate type="time" pattern="dd-MM-yyyy" value="${reservation.reservationDate}"/></h3>
                                             </div>

                                     <div class="ViewMoreContainer"><a class="ViewMore" data-toggle="modal" data-target="#myModal">View More</a></div>
                                     <table style="display: none" class="confirmationDesign reservationInfo">
                                          <tr>
                                              <td><b>Name</b></td>
                                              <td>${reservation.patient.fName} ${reservation.patient.midName} ${reservation.patient.lName}</td>
                                          </tr>
                                          <tr>
                                              <td><b>Code </b></td>
                                              <td>${reservation.patient.code}</td>
                                          </tr>
                                          
                                          <tr>
                                              <td><b>Age</b></td>
                                              <td>${reservation.patient.age}</td>
                                          </tr>    
                                          
                                          <tr>
                                              <td><b>Mobile</b></td>
                                              <td>
                                                  <c:choose>
                                                        <c:when test="${not empty reservation.patient.phoneNumber1}">
                                                             ${reservation.patient.phoneNumber1}
                                                             <c:if test="${not empty reservation.patient.phoneNumber2}">
                                                                 - ${reservation.patient.phoneNumber2}
                                                             </c:if>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:choose>
                                                                    <c:when test="${not empty reservation.patient.phoneNumber2}">
                                                                         ${reservation.patient.phoneNumber2}
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                         No Numbers
                                                                    </c:otherwise>
                                                            </c:choose>
                                                        </c:otherwise>
                                                  </c:choose>                                                  
                                              </td>
                                          </tr>    
                                              
                                          <tr>
                                              <td><b>Insurred</b></td>
                                              <td>
                                                        <c:choose>
                                                            <c:when test="${not empty reservation.patient.insuranceCompany}">
                                                                         ${reservation.patient.insuranceCompany.nameEn}
                                                            </c:when>
                                                            <c:otherwise>
                                                                         No
                                                            </c:otherwise>
                                                        </c:choose>
                                              </td>
                                          </tr>    
                                             
                                              
                                          <tr>
                                              <td><b>Way </b></td>
                                              <td>${reservation.reservationWay.nameEn}</td>
                                          </tr>    
                                     </table>
                                     </div>
                                    </c:forEach>
                               </c:otherwise>
                          </c:choose>     
                       </ul>
                   </center>    
              </div>
          </div>
     </c:forEach>                   
</div>                        