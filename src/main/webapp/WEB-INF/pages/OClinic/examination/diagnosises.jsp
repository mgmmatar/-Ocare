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
      
        <style>

 /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */

input[type='range'] {
  position: absolute;
  top: 50%;
  left: 50%;
  border: solid 2.5em transparent;
  padding: 0;
  border-radius: 1.25em;
  transform:translate(-22%, 106%) rotate(-90deg) scale(.6,.7);
  font-size: 1em;
}

/* control the thermometer and slider bar image  */
input[type='range'], input[type='range']::-webkit-slider-runnable-track, input[type='range']::-webkit-slider-thumb {
  -webkit-appearance: none;
}

/* control the thermometer image   */
[class*='-webkit-'] input[type='range'] {
  background-image: url("<c:url value='/resources/images/Thermometer.jpg'/>");
  background-repeat: no-repeat;
  background-position: 56% 52%;
   background-size: 119% 321%;
}

/* control the horizontal range track bar */
  input[type='range']::-webkit-slider-runnable-track { 
  position:relative;
  transform:translate(6.5%,25%) scale(.85,0.53);
  border-radius: 0.625em;
  box-shadow: inset 0 0 0em #555, inset 0 0 0.25em #b7bfc7, inset 0 0 0.5em #999;
  background: #d9e2e7;
  
}

/*  control the amount of the red tempreture   */
.js input[type='range']::-webkit-slider-runnable-track {
  background: linear-gradient(red, rgba(46, 154, 215, 0), red) no-repeat, repeating-linear-gradient(red, red, red 0.125em, red 0.125em, red 0.25em) no-repeat #d9e2e7;
  background-size: 10% 150%;
  cursor: pointer;
}

/*  control the arrival thermometer runnable ball  */
input[type='range']::-webkit-slider-thumb {
  box-sizing: border-box;
  border: none;
  padding: 0;
  width: 1.7em;
  height: 2.3em;
  background: url("<c:url value='/resources/images/thermo-arrow.bmp'/>") no-repeat  ;
  background-size: 100% 100%;
  transform: translate(-10%,110%) scale(1.9,1.1);
  border-radius: 70%;
  box-shadow: -1px 0 3.125em white,  inset -1px 1px .125em white; 
  background: radial-gradient(rgba(0, 0, 0, 0) 35%, #444444) calc(50% - .165em) 50% content-box, linear-gradient(#bbbbbb, #bbbbbb) content-box, 
  background-size: 0.875em 0.875em 100% 100% 100% 100%;
  cursor: pointor;
}

/* cotrol when we enter the the area of the range input*/
input[type='range']:focus {
  outline: none;
  box-shadow: 0 0 5.25em red;
}
    </style>
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
    
    <div class="containerrrr">
    
    <div class="header">
        <%@include file="../basic/header.jsp" %>
        
    </div>    
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
       <div>
        
                <form oninput="x.value=(parseFloat(a.value/14)+parseFloat(b.value)).toFixed(2)">
                    <input type="number" id="b" value="35" hidden />
                        <input type='range' id="a" value='0' max = "98" min = "0"  step=".1"   /> 
                            <script type="text/javascript" src="<c:url value='/resources/js/modernizr.min.js'/>"></script>
                            <script type="text/javascript" src="<c:url value='/resources/js/prefixfree.min.js'/>"></script>
                            <script type="text/javascript" src="<c:url value='/resources/js/temperature.js'/>"></script>
                       <h1 style="font-size:300%;" ><p align="center" ><strong> <mark><output  name="x"  top="200px" ></output></mark></h1>
                </form>	
       </div>               
    </div>
   </div>    
                       
  </div>                     
</body>
</html>

