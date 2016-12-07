<%--
    Document   : reservationProcess
    Created on : Sep 24, 2015, 12:54:02 AM
    Author     : khaledeng
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
    
    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
         <title> Insurance Company List </title>
        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.carousel.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.theme.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/popup.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/font-awesome.min.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/paging.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ssd-confirm.css'/>">

        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.bpopup.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/mindmup-editabletable.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/insurranceCompany-editable.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/leanModal.js'/>"></script>
                <script type="text/javascript" src="<c:url value='/resources/js/paging.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.ssd-confirm.js'/>"></script>

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
                #lean_overlay {
                    position: fixed;
                    z-index:100;
                    top: 0px;
                    left: 0px;
                    height:100%;
                    width:100%;
                    background: #000;
                    display: none;
                }

                .popupContainer{
                        position:absolute;
                        width:330px;
                        height: auto;
                        left:45%;
                        top:80px;
                        background: #FFF;
                }
                .popupHeader {font-size:16px; text-transform: uppercase;}
                .popupHeader {background:#F4F4F2; position:relative; padding:10px 20px; border-bottom:1px solid #DDD; font-weight:bold;}
                .popupHeader .modal_close {position: absolute; right: 0; top:0; padding:10px 15px; background:#E4E4E2; cursor: pointer; color:#aaa; font-size:16px;}
                .popupBody {padding:20px;}                    
	</style>        
        <script type="text/javascript">
            $(document).ready(function() {
           // $(".profiles").leanModal({top : 200, overlay : 0.6, closeButton: ".modal_close" });
             var newClicked=0;
             // Max Result 
             var maxResult=5;  
             
             $('#insurranceCompanyTable').paging({
                    limit:maxResult,
                    rowDisplayStyle: 'block'
              });    
                
             $('[data-ssd-confirm-trigger]').ssdConfirm();
             
             $('#insurranceCompanyTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).insurranceCompanyEditable();
             // Click Profile Link 
             $(".container").on("click",".profiles", function(e) {
                   var insurranceCompanyID = $(this).closest("tr").find('input[type="hidden"][name="insurranceCompanyId"]').val();
                   // URL for insurrance Profile
                   var profileURL = "/ocare/settings/insurrance/profile/"+insurranceCompanyID;
                    // getting visit
                    var request = $.ajax({
                        url: profileURL,
                        type: "GET",
                        dataType: 'json',
                        data: {
                        },
                        complete: function(data) {
                            $('#profilePopup').empty();
                            // Filling Last Information
                            $('#profilePopup').append(data.responseText);
                        }//end onComplete Method
                     });/// end Ajax Call Request
                     // Showing the Popup After Call
                     $('#profilePopup').bPopup();  
                });  
           ////////////////////////////////////////////////////////////////////////////////////////
           // Add New Insurrance Company
           //////////////////////////////////////////////////////////////////////////////// 
           $(".container").on("click","#AddNewInsurranceCompany", function(e) {
               if(newClicked===0){
               // Draw the New Row     
               $('#insurranceCompanyTable').append("<tr id='newInsurrance'>"
                            +"<th> # </th>"
                            +"<td id='nameAr'> </td>"
                            +"<td id='nameEn'> </td>"
                            +"<td id='description'> </td>"
                            +"<th id='profile'>Profile</th>"
                            +"<th><img src='<c:url value='/resources/images/save-icon.png'/>' id='saveNewInsurrance' class='insurranceCompanyCancelButton'/> <img src='<c:url value='/resources/images/cancel-icon.png'/>' id='cancelAddInsurrance' class='insurranceCompanyCancelButton'/></th>"
                            +"</tr>");
                            // refresh Table
                                $('#insurranceCompanyTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).insurranceCompanyEditable();            
                                
                                $('#saveNewInsurrance').on("click", function(e) {
                                    var nameAr=$('#nameAr').text();
                                    var nameEn=$('#nameEn').text();
                                    var description=$('#description').text();
                                        var b;
                                        var request = $.ajax({
                                            url: "/ocare/settings/insurrance/save",
                                            type: "POST",
                                            dataType: 'json',
                                            data: {
                                                nameAr:nameAr,
                                                nameEn:nameEn,
                                                description:description
                                            },
                                            complete: function(data) {
                                                        $('.myDataTable').empty();
                                                        // Draw New Search Results
                                                        $('.myDataTable').append(data.responseText);
                                                        ///// Adding the Action Again 
                                                        $('#insurranceCompanyTable').paging({
                                                                    limit:maxResult,
                                                                    rowDisplayStyle: 'block',
                                                                });    

                                                        $('[data-ssd-confirm-trigger]').ssdConfirm();

                                                        $('#insurranceCompanyTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).insurranceCompanyEditable();

                                                /// Rising Flag
                                                newClicked = 0 ; 
                                            }//end Complete Function
                                        });  // End AJax call for Save ExamineType
                                        //////////////// Adding Action for Cancel Add Button
                                    }); // Save Button Click Action 
                                    
                                    $('#cancelAddInsurrance').on("click", function(e) {
                                            $(this).closest('tr').remove();
                                            newClicked=0;    
                                    }); // Cancel Save Button Click Action   
                                    // Flag that Add Button Clicked
                                    newClicked=1;
                        }//end if  
                    });
                    $("#searchForInsurrance").keyup(function() {
                    var searchValue=$(this).val();
                    /// Reloading Patient Table Result
                    var request = $.ajax({
                        url: "/ocare/settings/insurrance/search",
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
                            $('#insurranceCompanyTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).insurranceCompanyEditable();
                            
                            $('#insurranceCompanyTable').paging({
                                        limit:maxResult,
                                        rowDisplayStyle: 'block',
                                    });    
                
                            $('[data-ssd-confirm-trigger]').ssdConfirm();
                            
                            
                            // Adding New examineType 
                        }//end Complete Function
                    });
                 });
                    // Scrol Top Again
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
                    <div class="row expandUp">
                        
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                             <div class="panel panel-default">
                                <div class="panel-heading">
                                   Insurance Company List
                                </div>
                                    <!--- List of Admins --->
                                    <div class="panel-body">
                                           <center>
                                                <input type="text" id="searchForInsurrance" name="Search" class="listSearchBar" placeholder="Filter Insurrance"  required />    
                                            </center>
                                            <div class="myDataTable">     
                                                <c:import  url="/settings/insurrance/loadInsurranceCompanyTable" />
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
          
    <!--START Popup Section-->
        <div id="modal" class="popupContainer" style="display:none;">
		<header class="popupHeader">
			<span class="header_title">Login</span>
			<span class="modal_close"><i class="fa fa-times"></i></span>
		</header>
		
		<section class="popupBody">
			<!-- Social Login -->
			<div class="social_login">
                            Profile Viewer 
                        </div>	
		</section>
	</div>
    <!--END Popup Section-->
    
     <div id="profilePopup" class="popupDesign popup">
      
    </div>
    
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
