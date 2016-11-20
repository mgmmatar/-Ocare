<%-- 
    Document   : users
    Created on : Nov 3, 2016, 9:36:08 PM
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
         <title> Admins</title>
        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.carousel.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/owl.theme.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ssd-confirm.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/font-awesome.min.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/popup.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/paging.css'/>">
        
        <!---  JS Scripts Files --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/squad.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/underscore.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.ssd-confirm.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.bpopup.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/paging.js'/>"></script>
        <!-- NEW -->
        <script type="text/javascript" src="<c:url value='/resources/js/nprogress.js'/>"></script>
        <script>
            NProgress.start();
        </script>
            <!-- FontAwesome Styles-->
            <link href="<c:url value='/resources/css/font-awesome.css'/>" rel="stylesheet" />
            <!-- Morris Chart Styles-->
            <link href="<c:url value='/resources/css/animation.css'/>" rel="stylesheet" />
            <!-- Google Fonts-->
            <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
                
             <script type="text/javascript">
            $(document).ready(function() {
                  
                var maxResult=5;  
                  
                $('#adminTable').paging({
                    limit:maxResult,
                    rowDisplayStyle: 'block'
                });    
                
                $('[data-ssd-confirm-trigger]').ssdConfirm();
        
                $(".container").on("click","#RegisterAdmin", function(e) { 
                     // URL for insurrance Profile
                    var profileURL = "/zmed/ums/admin/data/"+0;
                    // getting visit
                    var request = $.ajax({
                        url: profileURL,
                        type: "GET",
                        dataType: 'json',
                        data: {
                        },
                        complete: function(data) {
                            $('#patientDataPopup').empty();
                            // Filling Last Information
                            $('#patientDataPopup').append(data.responseText);
                        }//end onComplete Method
                     });/// end Ajax Call Request
                     // Showing the Popup After Call
                     $('#patientDataPopup').bPopup();  
                }); 
                
                ///////////////////////////////////////////////////////////////////
                // Showing User Edit Popup
                $(".container").on("click",".profiles", function(e) { 
                    // delete Current Patient
                    var userId=$(this).parents("tr").find('input[type="hidden"][name="userId"]').val();
                     // URL for insurrance Profile
                    var profileURL = "/zmed/ums/admin/data/"+userId;
                    // getting visit
                    var request = $.ajax({
                        url: profileURL,
                        type: "GET",
                        dataType: 'json',
                        data: {
                        },
                        complete: function(data) {
                            $('#patientDataPopup').empty();
                            // Filling Last Information
                            $('#patientDataPopup').append(data.responseText);
                        }//end onComplete Method
                     });/// end Ajax Call Request
                     // Showing the Popup After Call
                     $('#patientDataPopup').bPopup();  
                }); 
                /// Enable and Disable the USer 
                ////////////////////////////////////////////////////////////
                /**********************************************************
                 *    Enable and Disable the User 
                 *********************************************************/
                ////////////////////////////////////////////////////////////
                $(".container").on("click",".enableUser", function(e) {
                    // Getting Admin
                    var adminId = $(this).closest("tr").find('input[type="hidden"][name="userId"]').val();
                    var status=false;
                    /// Check Operation
                    if($(this).is(":checked")){
                        status=true;
                    }//end if Condition
                    //// Sending Activation , De-Activation
                    var request = $.ajax({
                            url: "/zmed/ums/admin/activeOrDeactive",
                            type: "POST",
                            dataType: 'json',
                        data: {  
                                adminId:adminId,
                                status:status
                        },
                        complete: function(data) {
                            setTimeout(function () { 
                                  $('.myDataTable').empty();
                                //Draw New Search Results
                                $('.myDataTable').append(data.responseText);                                
                                $('#adminTable').paging({
                                        limit:maxResult,
                                        rowDisplayStyle: 'block',
                                    });    
                
                                $('[data-ssd-confirm-trigger]').ssdConfirm();        
                              }, 200);
                        }//end Complete Function
                    });
                });
                
                //////////////////////////////////////////////////////////////
                /*
                 *  Search for Admin
                 */
                //////////////////////////////////////////////////////////////
                $( "#searchForAdmin" ).keyup(function() {
                    var searchValue=$(this).val();
                    /// Reloading Patient Table Result
                    var request = $.ajax({
                        url: "/zmed/ums/admin/search",
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
                            $('#adminTable').paging({
                                        limit:maxResult,
                                        rowDisplayStyle: 'block',
                                    });    
                
                            $('[data-ssd-confirm-trigger]').ssdConfirm();
                            // Adding New examineType 
                        }//end Complete Function
                    });
                 });
                        
            });
        </script>
            
        <%@include file="../../OBook/basic/scripts.jsp" %>
    </head>
    <body class="nav-md">

            <div class="container body">

                <div class="main_container">
 
                    <!---  Importing SideBar --->

                    <%@include file="../../OBook/basic/sidebar.jsp" %>

                    <!-- Header -->

                    <%@include file="../../OBook/basic/header.jsp" %>

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
                                   List Of Admins
                                </div>
                                    <!--- List of Admins --->
                                    <div class="panel-body">
                                           <center>
                                                <input type="text" id="searchForAdmin" name="Search" class="listSearchBar" placeholder="Filter Admins"  required />    
                                            </center>
                                            <div class="myDataTable">     
                                                <c:import  url="/ums/admin/loadAdminTable" />     
                                           </div>
                                    </div>
                            </div>        
                            <!-- Widget -->
                            <%@include file="../../OBook/basic/widgets.jsp" %>
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
                    <!-- Custom Js -->
                    <script src="<c:url value='/resources/js/custom-scripts.js'/>"></script>   
                 </div>
            </div><!--End Main Container-->
    </div><!--End Body Container-->

    
    <div id="patientDataPopup" class="popupDesign popup">
        <c:import  url="/ums/admin/data/0" />
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
