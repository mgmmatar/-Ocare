<%--
    Document   : reservationProcess
    Created on : Sep 24, 2015, 12:54:02 AM
    Author     : khaledeng
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
         <title> Examine Type List </title>
        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.carousel.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.theme.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/font-awesome.min.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/paging.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ssd-confirm.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/keyboard.css'/>">


        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>        
        <script type="text/javascript" src="<c:url value='/resources/js/mindmup-editabletable.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/examineType-editable.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/paging.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.ssd-confirm.js'/>"></script>
         <script type="text/javascript" src="<c:url value='/resources/js/keyboard.js'/>"></script>
        
        <!-- NEW -->
        <script type="text/javascript" src="<c:url value='/resources/js/nprogress.js'/>"></script>
        <script>
            NProgress.start();
        </script>
        <!--- Page Styles--->
        <!-- Bootstrap Styles-->
            <!-- FontAwesome Styles-->
            <link href="<c:url value='/resources/css/font-awesome.css'/>" rel="stylesheet" />
            <!-- Morris Chart Styles-->
            <link href="<c:url value='/resources/css/morris-0.4.3.min.css'/>" rel="stylesheet" />
            <link href="<c:url value='/resources/css/animation.css'/>" rel="stylesheet" />
            <!-- Custom Styles-->
            <!-- Google Fonts-->
            <link href="<c:url value='/resources/css/googlefonts.css'/>" rel="stylesheet" />
        <style>
			
			.current-row{background-color:#B24926;color:#FFF;}
			.current-col{background-color:#1b1b1b;color:#FFF;}
			.tbl-qa{width: 100%;font-size:0.9em;background-color: #f5f5f5;}
			.tbl-qa th.table-header {padding: 5px;text-align: left;padding:10px;}
			.tbl-qa .table-row td {padding:10px;background-color: #FDFDFD;}
	</style>        
        <script type="text/javascript">
            $(document).ready(function() {
           
        /// SET the Icon of the Keyboard   
                VKI_imageURI="<c:url value='/resources/images/keyboard.png'/>";
            
            // New Clicked    
             var newClicked=0;
             
             // Max Result 
             var maxResult=5;  
             
                   $('#examineTypeTable').paging({
                    limit:maxResult,
                    rowDisplayStyle: 'block'
              });    
                
             $('[data-ssd-confirm-trigger]').ssdConfirm();
             
             $('#examineTypeTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).examineTypeEditable();            
             //////////////////////////////////////////////////////////////////////////////////////////
             // Assign Default ExamineType
             ////////////////////////////////////////////////////////////////////////////////
              $(".container").on("click",".defaultExamineTypeChecker", function(e) {
                // this function will get executed every time the #home element is clicked (or tab-spacebar changed)
                if($(this).is(":checked")) // "this" refers to the element that fired the event
                {  /// Send Assign Default Request 
                    var examineTypeID = $(this).closest("tr").find('input[type="hidden"][name="examineTypeId"]').val();
                    var b;
                    var request = $.ajax({
                        url: "/ocare/settings/examineType/defaultOne",
                        type: "POST",
                        dataType: 'json',
                        data: {
                            examineTypeID:examineTypeID
                        },
                        complete: function(data) {
                            setTimeout(function () { 
                              $('.myDataTable').empty();
                              // Draw New Search Results
                              $('.myDataTable').append(data.responseText);
                              ///// Adding the Action Again 
                              $('#examineTypeTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).examineTypeEditable();            
                              $('#examineTypeTable').paging({
                                      limit:maxResult,
                                      rowDisplayStyle: 'block'
                                });    

                               $('[data-ssd-confirm-trigger]').ssdConfirm();

                            }, 200);   
                        }//end Complete Function
                    });
                }//end if Condition 
            });
           //////////////////////////////////////////////////////////////////////////////////////////
           // Add New ExamineType
           //////////////////////////////////////////////////////////////////////////////// 
           $(".container").on("click","#AddNewExamineType", function(e) {
               if(newClicked===0){
               // Draw the New Row     
               $('#examineTypeTable').append("<tr id='newExamine'>"
                            +"<th> # </th>"
                            +"<td id='nameAr'> </td>"
                            +"<td id='nameEn'> </td>"
                            +"<td id='description'> </td>"
                            +"<td id='cost'> </td>"
                            +"<td id='period'> </td>"
                            +"<th id='isDefault'> <label class='switch'>"
                            +"<input type='checkbox' class='defaultExamineTypeChecker'>"
                            +"<div class='slider round'></div>"
                            +"</label>"
                            +"</th>"
                            +"<th><img src='<c:url value='/resources/images/save-icon.png'/>' id='saveNewExamine' class='examineTypeCancelButton'/> <img src='<c:url value='/resources/images/cancel-icon.png'/>' id='cancelAddExamine' class='examineTypeCancelButton'/></th>"
                            +"</tr>");
                            // refresh Table
                                $('#examineTypeTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).examineTypeEditable();
                                $('#examineTypeTable').paging({
                                        limit:maxResult,
                                        rowDisplayStyle: 'block'
                                  });    

                                $('[data-ssd-confirm-trigger]').ssdConfirm();
                                
                                $('#saveNewExamine').on("click", function(e) {
                                    var nameAr=$('#nameAr').text();
                                    var nameEn=$('#nameEn').text();
                                    var description=$('#description').text();
                                    var cost=$('#cost').text();
                                    var period=$('#period').text();
                                        var b;
                                        var request = $.ajax({
                                            url: "/ocare/settings/examineType/save",
                                            type: "POST",
                                            dataType: 'json',
                                            data: {
                                                nameAr:nameAr,
                                                nameEn:nameEn,
                                                description:description,
                                                cost:cost,
                                                estimatedPeriod:period
                                            },
                                            complete: function(data) {
                                                $('.myDataTable').empty();
                                                // Draw New Search Results
                                                $('.myDataTable').append(data.responseText);
                                                ///// Adding the Action Again 
                                                $('#examineTypeTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).examineTypeEditable();             
                                                $('#examineTypeTable').paging({
                                                        limit:maxResult,
                                                        rowDisplayStyle: 'block'
                                                  });    

                                                 $('[data-ssd-confirm-trigger]').ssdConfirm();
                                                /// Rising Flag
                                                newClicked = 0 ; 
                                                
                                            }//end Complete Function
                                        });  // End AJax call for Save ExamineType
                                        //////////////// Adding Action fpr Cancel Add Button
                                        
                                    }); // Save Button Click Action 
                                    
                                    
                                    $('#cancelAddExamine').on("click", function(e) {
                                                $(this).closest('tr').remove();
                                                newClicked=0;    
                                    }); // Save Button Click Action   
                                    // Flag that Add Button Clicked
                                    newClicked=1;
                        }//end if  
                    });               
               //setInterval(function() { document.body.scrollIntoView() = document.body.scrollHeight; }, 50);
               /////////////////////////////////////////
               /// Search 
               $("#searchForExamine").keyup(function() {
                    var searchValue=$(this).val();
                    /// Reloading Patient Table Result
                    var request = $.ajax({
                        url: "/ocare/settings/examineType/search",
                        type: "POST",
                        dataType: 'json',
                        data: {
                            query:searchValue
                        },
                        complete: function(data) {
                            $('.myDataTable').empty();
                            // Draw New Search Results
                            $('.myDataTable').append(data.responseText);
                            ///// Adding the Action Again 
                            $('#examineTypeTable').paging({
                                        limit:maxResult,
                                        rowDisplayStyle: 'block',
                                    });    
                
                            $('[data-ssd-confirm-trigger]').ssdConfirm();
                            
                            $('#examineTypeTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).examineTypeEditable();
                            // Adding New examineType 
                        }//end Complete Function
                    });
                 });
               
               document.body.scrollIntoView();
               
            });
        </script>
            
        <%@include file="../basic/scripts.jsp" %>
        
    </head>
    
       
         <body class="nav-md">

            <div class="container body">

                <div class="main_container">
 
                    <!---  Importing SideBar --->

                    <%@include file="../basic/sidebar.jsp" %>

                    <!-- Header -->

                    <%@include file="../basic/header.jsp" %>

                     <div class="right_col" role="main">
     
                    <div class="clearfix"></div>   
           
                  <!-- Content --->
          
             <div id="page-wrapper">
                <div id="page-inner">
                    <div class="page-title">
                    </div>
                    <!-- /. ROW  -->
                    <div id="notifaction" class="alert alert-success hidden" role="alert">Operation done successfully</div>
                    <div class="row">
                        
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                   Examine Type List
                                </div>
                                    <!--- List of Admins --->
                                    <div class="panel-body">
                                           <center>
                                                <input type="text" id="searchForExamine" name="Search" class="listSearchBar keyboardInput" placeholder="Filter Examine Types"  required />    
                                            </center>
                                            <div class="myDataTable">     
                                                <c:import  url="/settings/examineType/loadExamineTable" />
                                           </div>
                                    </div>
                            </div>    
                            
                            <!-- Widget -->
                            <%@include file="../basic/widgets.jsp" %>
                            
                        </div>
                                                              
                    </div>
                    <!-- /. ROW  -->

                    <!-- /. PAGE INNER  -->
                </div>
                <!-- /. PAGE WRAPPER  -->
                 
            </div>
        
            <!-- Metis Menu Js -->
            <script src="<c:url value='/resources/js/jquery.metisMenu.js'/>"></script>
            <!-- Morris Chart Js -->
            <script src="<c:url value='/resources/js/raphael-2.1.0.min.js'/>"></script>
            <script src="<c:url value='/resources/js/morris.js'/>"></script>
            <!-- Custom Js -->
            <script src="<c:url value='/resources/js/custom-scripts.js'/>"></script>   
           </div>
            
            </div><!--End Main Container-->

    </div><!--End Body Container-->
          
    <!-- Confirm Delete Popup -->
    <div data-ssd-confirm-overlay></div>
    
    <div data-ssd-confirm>
        
    <div data-ssd-confirm-block="remove">

        <p class="confirmMessage" data-ssd-confirm-content></p>

        <nav>

            <span data-button-wrapper>

                <span
                    class="alert confirmMessageYesButton deletePatient"
                    data-ssd-confirm-yes
                    data-trigger
                >YES</span>

                <span
                    class="small alert disabled button hide"
                    data-processing
                ><i class="fa fa-spinner fa-spin fa-fw"></i></span>

            </span>

            <span class="small confirmMessageNoButton" data-ssd-confirm-no>NO</span>

        </nav>

    </div>

</div>
    
    </body>
</html>
