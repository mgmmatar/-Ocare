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
            ///////////////////////////////////////////////
            /// AutoComplete Search Patient Data    
            $('#patientSearch').typeahead({
                        onSelect: function(item) {
                            // Open Patient Page
                               window.location.href = "/ocare/monitor/patient/"+item.value;    
                            //
                        },
                        ajax: {
                                url: "/ocare/patient/fastSearch",
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
            });
    </script> 
    
    <link href="<c:url value='/resources/css/head-side.css'/>" rel="stylesheet">
    
    <!--- Common JavaScript Files  ---->

    <script src="<c:url value='/resources/js/head-side.js'/>"></script>

    <script src="<c:url value='/resources/js/typeahead.jquery.js'/>"></script>
    
    <script>
        NProgress.done();
    </script>
    