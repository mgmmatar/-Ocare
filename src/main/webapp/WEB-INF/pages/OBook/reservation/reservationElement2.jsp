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
   
<!--- Reload the List Reservation of the Shift --->                    
                    
<div class="tab-content">                    
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
                           <c:forEach items="${shift.reservations}" var="reservation" varStatus="counter">
                               <div class="card col-md-12 col-sm-12 col-xs-12 fadeIn">
                                  <img class="userImg"src="<c:url value='/resources/images/avatar.jpg'/>" />
                                    <div class="details">
                                            <h3 class="name">${reservation.patient.fName} ${reservation.patient.midName} ${reservation.patient.lName}</h3>
                                            <h3 class="code">${reservatiz1on.patient.code}</h3>
                                            <h3 class="examineType">${reservation.examineType.nameEn}</h3>
                                            <h3 class="date"><fmt:formatDate type="time" pattern="hh:mm a" value="${reservation.attendenceTimeFrom}"/> <fmt:formatDate type="time" pattern="dd-MM-yyyy" value="${reservation.reservationDate}"/></h3>
                                    </div>
                                    <div class="actions">
                                            <a href="#" class="delete"><img src="<c:url value='/resources/images/Cancel.png'/>" /></a>
                                            <a href="#" class="check"><img src="<c:url value='/resources/images/checkround.png'/>" /></a>
                                    </div>
                            <div class="ViewMoreContainer"><a href="#" class="ViewMore" data-toggle="modal" data-target="#myModal">View More</a></div>
                            </div>
                           </c:forEach> 
                       </ul>
                   </center>    
              </div>
          </div>
     </c:forEach>                   
</div>                                                       
                     