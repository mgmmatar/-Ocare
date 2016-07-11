<%-- 
    Document   : patientMedications
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
  <title>Medication</title>
   
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
      $(".signedElements").shapeshift();
      $(".workspace").shapeshift();
      $(".unSignedElements").shapeshift();
      //////////// Complain AutoComplete Part
      $('#medicationSearch').typeahead({
                    onSelect: function(item) {
                        // Check What Page to Open 
                        alert(item.value());
                    },
                    ajax: {
                        url: "/zmed/monitor/examination/fastMedication",
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
               var medications= [];
               var visitId=$("#visitId").val();
               var workspace= $(".workspace");
                // Getting All Chosed Complains
                $(workspace).find('input[type="hidden"][name="medicationId"]').each(function() {
                     //alert($(this).val());
                     medications.push($(this).val());
                });
                ///// Send Complain List 
                    var b;
                    var request = $.ajax({
                        url: "/zmed/monitor/examination/medication/save",
                        type: "GET",
                        dataType: 'json',
                        data: {
                            medications:medications,
                            visitId:visitId
                        },
                        complete: function(data) {
                            
                            b = (data.responseText === "true" ? true : false);
                            if (b === true) {
                               //window.location.replace("/zmed/monitor/examination/diagnosis");
                               alert("Medication Saved");
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

<center>
<h1 style="margin-top:10px;">Patient Medication</h1>
<input type="hidden" id="visitId" name="visitId" value="${visitId}">
<input type="text" id="medicationSearch" name="Search" class="examineSearch" placeholder="Search For Medication"/>
<img src="<c:url value='/resources/images/add-sign.png'/>" class="addNewButton"/>
</center>
  <div class="signedElements">
      
      <c:forEach items="${signedMedications}" var="medication">
           <div>
               <input type="hidden" name="medicationId" value="${medication.id}"/>
               <lable class="myLabel">${medication.name}</lable>
           </div> 
      </c:forEach>    
  </div>


  

  <div class="workspace">
      
        <div>
            <lable class="myLabel">Drag And Drop Content Here</lable>
        </div>
    
  </div>

    <div class="unSignedElements">
      <c:forEach items="${signedMedications}" var="medication">
           <div>
               <input type="hidden" name="medicationId" value="${medication.id}"/>
               <lable class="myLabel">${medication.name}</lable>
           </div> 
      </c:forEach>
  </div>

    <button id="nextStep" type="button" class="nextButton" >Next</button>

</body>
</html>

