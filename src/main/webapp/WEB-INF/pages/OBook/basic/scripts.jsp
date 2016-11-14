<%-- 
    Document   : sctipts
    Created on : Jan 1, 2016, 11:56:51 PM
    Author     : khaledeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
    <!--- Common CSS ---->

    <script type="text/javascript">
            $(document).ready(function() {
                
             loadDefaultSearchBy(); 
             
             ///////////////////////////////////////////////////////
            // Function Load the Default SearchBy Key
            function loadDefaultSearchBy() {
                   var request = $.ajax({
                        url: "/zmed/defaultSearchBy",
                        type: "GET",
                        data: {
                        },
                        complete: function(data) {
                           var defaultSearch=data.responseText;
                           if(defaultSearch === "PROFILE"){
                               $("#searchReservationProfileFlag").addClass("dimming-image cursor-hand");
                           }//inCase lastSearch was PROFILE
                           if(defaultSearch === "RESERVATION"){
                               $("#searchPatientProfileFlag").addClass("dimming-image cursor-hand");
                           }// inCase lastSearch was RESERVATION
                        }//end Complete Success Function   
                    });                        
                   
                }//end loadDefaultSearchBy
            ///////////////////////////////////////////////
            /// AutoComplete Search Patient Data    
            $('#patientSearch').typeahead({
                        onSelect: function(item) {
                            // Check What Page to Open 
                            if(!$("#searchReservationProfileFlag").hasClass("dimming-image")){
                               window.location.href = "/zmed/reservation/process/"+item.value;  
                            }//end if
                                
                            if(!$("#searchPatientProfileFlag").hasClass("dimming-image")){
                               window.location.href = "/zmed/patient/view/"+item.value;    
                            }//end if     
                                
                            //
                        },
                        ajax: {
                                url: "/zmed/patient/fastSearch",
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
                                        q: query
                                    };
                                },
                            preProcess: function(data) {
                                    var list = [];
                                    $.each(data, function() {
                                             console.log(data.toString());
                                            list.push({id: this.id, name: this.fName + ' ' + this.mName + ' '+ this.lName +'   | <b> Code </b>: '+this.code+'   | <b>Phone : </b>'+this.phoneNumber})
                                    });
                                   return list;
                                }
                        }//end Ajax Request Part
            });
            //////////////////////////////////////////////////////////////
            //AssingDefaultSearchBy 
                function assignDefaultSearchBy(searchBy){
                    var b;
                    var request = $.ajax({
                        url: "/zmed/assignDefaultSearchBy/" + searchBy,
                        data: {
                        },
                        async: false
                    });

                    request.done(function(msg) {
                        b = (msg == "true" ? true : false);
                    });

                    request.fail(function(jqXHR, textStatus) {
                        b = false;
                    });
                }//end assignDefaultSearchBy       
            ///////////////////////////////////////////////////////
            ///  Search Filteration Button 
                    $("#searchPatientProfileFlag").click(function() {
                        if($(this).hasClass("dimming-image")){
                                 $(this).removeClass("dimming-image cursor-hand");     
                                 $("#searchReservationProfileFlag").addClass("dimming-image cursor-hand");     
                                 assignDefaultSearchBy("PROFILE");
                                 //$(".dropdown-menu:after").addClass("autocomplete-profile-pointer");
                                 $(this).parents(".top_nav").find('.dropdown-menu:after').addClass("autocomplete-profile-pointer");
                        }//end if
                    });
                    
                    $("#searchReservationProfileFlag").click(function() {
                        if($(this).hasClass("dimming-image")){
                                $(this).removeClass("dimming-image cursor-hand");
                                $("#searchPatientProfileFlag").addClass("dimming-image cursor-hand");
                                assignDefaultSearchBy("RESERVATION");
                        }//end if
                    });
                    
                     $(".container").on("click",".fullScreen", function(e) {
                            alert("WWW");
                       });
                    
            });
    </script> 
    
    <link href="<c:url value='/resources/css/head-side.css'/>" rel="stylesheet">
    
    <!--- Common JavaScript Files  ---->

    <script src="<c:url value='/resources/js/head-side.js'/>"></script>

    <script src="<c:url value='/resources/js/typeahead.jquery.js'/>"></script>
    
    <script>
        NProgress.done();
    </script>
    