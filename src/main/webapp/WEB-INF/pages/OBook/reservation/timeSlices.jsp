<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <!--      ================================================== -->
                     <!--- Wanted CSS Files --> 


            <c:choose>
                    <c:when test="${not weekDay.offLine}">            
                            <span class="title_main_con d_block margin_bottom_10 margin_top_20">Date : ${currentDate}  </span>       
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
                         
                             <div class="wrapper">
                                  <center>    
                                      <ul class="main">
                                          <c:forEach items="${shift.slices}" var="slice" varStatus="counter">
                                              <c:choose>
                                                  <c:when test="${slice.status eq 'Busy'}">
                                                        <li data-pos="${counter.count}"  data-nb="" class="type-10 cat-4 Slice Busy"><fmt:formatDate type="time" pattern="hh:mm a" value="${slice.timeFrom}"/><span>Reserved</span></li>
                                                  </c:when>
                                                  <c:when test="${slice.status eq 'Less'}">
                                                        <li data-pos="${counter.count}"  data-nb="" class="type-10 cat-4 Slice Less"><fmt:formatDate type="time" pattern="hh:mm a" value="${slice.timeFrom}"/><span>Not Suitable</span></li>
                                                  </c:when>      
                                                  <c:otherwise>
                                                      <li data-pos="${counter.count}" data-nb="" class="type-11 cat-4 Slice Available"><fmt:formatDate type="time" pattern="hh:mm a" value="${slice.timeFrom}"/><span>Available</span></li>
                                                  </c:otherwise>
                                                  
                                              </c:choose>
                                              
                                              
                                          </c:forEach> 
                                      </ul>
                                  </center>    
                             </div>
                         </div>
                   </c:forEach>                   
                 
         </div>                                                       
                             
           