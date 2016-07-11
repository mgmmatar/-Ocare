<%-- 
    Document   : workingDays
    Created on : Oct 6, 2015, 4:13:27 PM
    Author     : khaledeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Working Days</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="http://pttimeselect.sourceforge.net/src/jquery.ptTimeSelect.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>    
        <script src="http://pttimeselect.sourceforge.net/src/jquery.ptTimeSelect.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function(){
                $('input[name="time"]').ptTimeSelect();
                 
                 
                 
                 $(".Adding").click( function(){
                      var timesDiv=$(this).parents('.container').find('.times');
                      var theDay=$(this).parents('.container').find('.TheDay').val();
                      
                      
                      timesDiv.append("<div class='Day_Time'>"
                      + " From : <input name='"+theDay+"_TIMEFROM"+"' style='width: 100px' type='time'/>"
                      + " To :  <input name='"+theDay+"_TIMETO"+"' style='width: 100px' type='time'/>" 
                      + " <button type='button' class='Removing'> Remove </button>"
                      +"  </div> ");
                      console.log(timesDiv.html());
                            $(".Removing").click( function(){
                              $(this).closest("div").remove();
                          });
                    });
                 
                 $(".Removing").click( function(){
                        $(this).closest("div").remove();
                    });
                
            });
        </script>    
        
    </head>
    <body>
   
       <center>
             <h1>Doctor Working Days</h1> 
       </center>
        
    <form method="POST" action="/zmed/settings/workingDays/process" modelAttribute="workingDayHolder">
    
    <c:forEach items="${weekDays}" var="weekDay" varStatus="counter">
    
        <center>
        <div class="container">
            <div class="titles">
                   <b> <label class>
                             ${weekDay.dayNameEn}
                    </label></b>
                    <select name="${weekDay.dayShort}_DAY" id="${weekDay.dayShort}_counter" >
                                <c:choose>
                                    <c:when test="${weekDay.offLine}">
                                        <option value="off" selected="selected">OFF</option>
                                        <option value="on">Working</option> 
                                    </c:when> 
                                    <c:otherwise>
                                        <option value="off">OFF</option>
                                        <option value="on" selected="selected">Working</option>
                                    </c:otherwise>
                                </c:choose>
                    </select>
<%--                    <img src="<c:url value='/resources/images/add-sign.png'/>" id="${weekDay.dayShort}_add" class="adding addTimes"/>
--%>
                                
                    <button type="button" class="Adding" id="${weekDay.dayShort}_add"> ADD </button>
                                
            </div>                    
            <div class="times">
                <input type="hidden" class="TheDay" value="${weekDay.dayShort}"/>  
            <c:if test="${not weekDay.offLine}">   
                    
                    <c:forEach items="${weekDay.workingTimes}" var="workingTime" varStatus="counter2">
                        <div class="Day_Time">
                            From : <input  name="${weekDay.dayShort}_TimeFrom" style="width: 80px" value='<fmt:formatDate type="time" value="${workingTime.timeFrom}"/>'/>
                            To :  <input name="${weekDay.dayShort}_TimeTo" style="width: 80px" value='<fmt:formatDate type="time" value="${workingTime.timeTo}"/> ' />
                            <button type="button" class="Removing" id="${weekDay.dayShort}_time_${counter2.index}_Remove"> Remove </button>             
                        </div>        
                                
                    </c:forEach>
                  
            </c:if>   
            </div> <!-- Times -->
        </div>  <!-- the Outer Container-->
      </center>  
    </c:forEach>
        
        <center>  <input type="submit" value="Send Now"/> </center>
        
        
   </form>     
            
    </body>
</html>
