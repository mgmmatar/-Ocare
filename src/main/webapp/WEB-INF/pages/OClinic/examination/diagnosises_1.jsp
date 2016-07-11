<%-- 
    Document   : patientComplains
    Created on : Apr 3, 2016, 8:06:35 AM
    Author     : khaledeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Diagnosis</title>
   
  
  <script type="text/javascript" src="<c:url value='/resources/monitor/js/my.jquery.min.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/resources/monitor/js/my.jquery-ui.min.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/resources/monitor/js/jquery.touch-punch.min.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/resources/monitor/js/jquery.shapeshift.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/typeahead.jquery.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
 
  
  <link href="<c:url value='/resources/css/head-side.css'/>" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
   <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/monitor.css'/>" />

  <!-- Javascript -->
  <script>
    $(document).ready(function() {
//      $('.complain').shapeshift({
//        // Features
//        centerGrid: true, // Center the grid inside the container. 
//        enableAnimationOnInit: false, // Determines if objects will be animated into position when the page initially loads.
//        enableAutoHeight: true, // If this is set to true the parent containers height will be automatically be adjusted to compensate for all of the child elements.
//        enableDrag: true,
//        enableDragAnimation: true,
//        enableRearrange: true,
//        enableResize: true,
//        enableTrash: true,
//
//        // Options
//        animateSpeed: 100,
//        columns: null,
//        dragClone: false,
//        dragRate: 100,
//        dragWhitelist: "*",
//        dropCutoff: 0,
//        dropWhitelist: "*",
//        gutterX: 10,
//        gutterY: 10,
//        minHeight: 100,
//        paddingY: 0,
//        paddingX: 0,
//        selector: ""
//      });  
      $(".leftElements").shapeshift();
      $(".workspace").shapeshift();
      $(".rightElements").shapeshift();
      //////////// Complain AutoComplete Part
      $('#diagnosisSearch').typeahead({
                    onSelect: function(item) {
                        // Check What Page to Open
                        var workspace=$(".workspace");
                        var diagnosisName=item.text;
                        var diagnosisId=item.value;
                        var chosedDiagnosis=".diagnosis_"+diagnosisId;
                        /// Search if Already Added Before 
                        var found=$(".workspace").find(chosedDiagnosis);
                        /// 
                        if(found.size()>0){
                            alert("Sorry Already Exists");  
                        }
                        else{
                            console.log(found.html());
                            /// Adding Diagnosis to WorkSpace
                            workspace.append("<div class='diagnosis_"+diagnosisId+"'>"
                                             +"<lable class='myLabel'>"
                                             +diagnosisName
                                             +"</lable>"
                                             +"<input type='hidden' name='diagnosisId' value='"+diagnosisId+"'/>"   
                                             +"</div>");
                            ////// Removing the Selected Item from the Diagnoisis List 
                            var selectedDiv=$(".leftElements").find(chosedDiagnosis);
                            selectedDiv.remove();
                            /// Refreshing the Container
                            $(".workspace").shapeshift();
                            $(".leftElements").shapeshift();
                        }//end else 
                    },
                    ajax: {
                        url: "/zmed/monitor/examination/fastDiagnosis",
                        timeout: 500,
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        displayField: "name",
                        valueField: "id",
                        triggerLength: 1,
                        method: "get",
                        loadingClass: "loading-circle",
                    preDispatch: function(query) {
                        return {
                            pattern: query
                        };
                    },
                    preProcess: function(data) {
                        var list = [];
                        $.each(data, function() {
                             console.log(data.toString());
                            list.push({id: this.id, name: this.name });
                        });
                    return list;
                    }// PreProcess 
                }//end Ajax Request Part
            });
      
        $('#nextStep').on("click", function(e) {
              // Initialize Complain List 
               var diagnosises= [];
               var visitId=$("#visitId").val();
               var workspace= $(".workspace");
                // Getting All Chosed Complains
                $(workspace).find('input[type="hidden"][name="diagnosisId"]').each(function() {
                     //alert($(this).val());
                     diagnosises.push($(this).val());
                });
                ///// Send Complain List 
                    var b;
                    var request = $.ajax({
                        url: "/zmed/monitor/examination/diagnosis/save",
                        type: "GET",
                        dataType: 'json',
                        data: {
                            diagnosises:diagnosises,
                            visitId:visitId
                        },
                        complete: function(data) {
                            
                            b = (data.responseText === "true" ? true : false);
                            if (b === true) {
                               window.location.replace("/zmed/monitor/examination/prescription/"+visitId);
                               alert("Diagnosises Saved");
                            }//end if condition
                        }//end complete Function
                        });
                /////////////////////////////////////////////////////////////////////////
                /////////////////////////////////////////////////////////////////////////
                
        });
                
    });
  </script>
</head>
<body>
    
<div class="containere">
     <div class="leftSection"> 
        <h1 style="margin-top:10px;margin-left:50px;">Patient Diagnosis</h1>
        <input type="text" id="diagnosisSearch" name="Search" class="diagnosisSearch" placeholder="Search For Diagnosis"/>
        <img src="<c:url value='/resources/images/add-sign.png'/>" class="addNewButton"/>
        <center>
            <input type="hidden" id="visitId" name="visitId" value="${visitId}">    
        </center>
        <div class="leftElements"> 
          <c:forEach items="${diagnosises}" var="diagnosis">
               <div class="diagnosis_${diagnosis.id}">
                   <input type="hidden" name="diagnosisId" value="${diagnosis.id}"/>
                   <lable class="myLabel">${diagnosis.name}</lable>
               </div> 
          </c:forEach>    
        </div>
        <!--Adding Comment Section-->
<!--        <label class="commentLabel">Comments : </label>
        <input type="text" id="diagnosisNotes" class="noteDesign" placeholder="Enter any Note"/>-->
<textarea rows="3" cols="20" placeholder="Enter Any Note" class="noteDesign"></textarea>

    </div>
    
    <!-- The Space of the WorkSpace -->
        
    <div class="centerSection">
        
        <center><h1 style="margin-top:30px;margin-left:50px;">My WorkSpace</h1></center>
        
        <div class="workspace">
            <div>
                <lable class="myLabel">Drag And Drop Content Here</lable>
            </div>
        </div> 
        <!-- Next & Previous Buttons-->
        <button id="nextStep" type="button" class="nextButton" >Next</button>
        <button id="nextStep" type="button" class="previousButton" >Previous</button>
    </div>
    
    <div class="rightSection"> 
        
    <h1 style="margin-top:10px;margin-left:50px;">Measurements</h1>        
        <div class="rightElements">
            <c:forEach items="${measurements}" var="measurement">
                 <div>
                     <input type="hidden" name="diagnosisId" value="${measurement.id}"/>
                     <lable class="myLabel">${measurement.name}</lable>
                 </div> 
            </c:forEach>

        </div> 
    </div>
   </div>    
</body>
</html>

