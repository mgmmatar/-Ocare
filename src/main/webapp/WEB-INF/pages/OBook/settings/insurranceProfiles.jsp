<%-- 
    Document   : insurranceProfile
    Created on : Aug 28, 2016, 12:59:56 AM
    Author     : khaledeng
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script>
    // Flag When the Add Button Clicked
    var addNewProfileClicked=0;
    ////////////////////////////////////////////////////
    /*
     *   Examine Type Drop Down List Value Changed 
     */
    ////////////////////////////////////////////////////
        $(".popup_close_icon").unbind('click').on("click", function(e) { 
                $("#profilePopup").bPopup().close();
        });
    
    $(".profilePopup").unbind('change').on("change",".examineType", function(e) {
          // Getting Current ProfileID
          var profileID= $(this).closest("tr").find('input[type="hidden"][name="profileId"]').val();
          var selectedValue=$(this).val();
          // Define the ServiceURL
          var profileURL = "/ocare/settings/insurrance/profile/"+profileID+"/edit/examine,"+selectedValue;
          // Send Edit Request for the Current Profile
            var request = $.ajax({
                url: profileURL,
                type: "GET",
                complete: function(data) {
                            
                }//end onComplete Method
            });/// end Ajax Call Request  
    });
    
    ///////////////////////////////////////////////////
    /*
     *   Percentage Drop Down List Value Changed 
     */
    ///////////////////////////////////////////////////
    $("#profilePopup").unbind('change').on("change",".percentage", function(e) {
        // Getting Current ProfileID
          var profileID= $(this).closest("tr").find('input[type="hidden"][name="profileId"]').val();
          var selectedValue=$(this).val();
          // Define the ServiceURL
          var profileURL = "/ocare/settings/insurrance/profile/"+profileID+"/edit/percentage,"+selectedValue;
            var request = $.ajax({
                url: profileURL,
                type: "GET",
                complete: function(data) {
                    
                }//end onComplete Method
            });/// end Ajax Call Request 
    });
    
    ///////////////////////////////////////////////////
    /*
     *   Add New Profile for Insurrance 
     */
    ///////////////////////////////////////////////////
    //$("#profilePopup").unbind('click').on("click","#addNewProfile", function(e) {
    $(".addInsurranceProfile").on("click", function(e){
        // Checking if the Add Button Clicked or Noo
        if(addNewProfileClicked===0){
            // Adding new Row for Adding the Insurrance Profile to specific Company sss
           $('#profileTable').append(
                "<tr id='newInsurrance'>"
                    +"<th> # </th>"
                    +"<td>"
                            +"<select name='examineType' class='newExamineType popupTableDropDownExamine' >"
                                +"<c:forEach items='${examineTypes}' var='examineType'>"
                                         +"<option value='${examineType.id}'><b>${examineType.nameEn}</b></option>"            
                                +"</c:forEach>" 
                            +"</select>"
                    +"</td>"
                            
                    +"<td>"
                            +"<select name='percentage' id='percentage' class='newPercentage popupTableDropDownPercentage' >"
                                +"<c:forEach items='${percentages}' var='percentage'>"
                                +"<option value='${percentage}'><b>${percentage}</b></option>"            
                                +"</c:forEach>" 
                            +"</select><label class='popupTableLabel'>%</label>"
                    +"</td>"
                    
                    +"<th><img src='<c:url value='/resources/images/save-icon.png'/>' id='saveProfile' class='insurranceCompanyDeleteButton'/> <img src='<c:url value='/resources/images/cancel-icon.png'/>' id='cancelSaveProfile' class='insurranceCompanyDeleteButton'/></th>"
                +"</tr>");
                    /// Adding Actions For Save and Cancel Button 
                $('#cancelSaveProfile').on("click", function(e) {
                        // Remove Row 
                        $(this).closest('tr').remove();
                        // return Back the Add New Profile Button to be Live
                        addNewProfileClicked=0;
                });
                
                
                $("#saveProfile").on("click", function(e) {
                    ///Getting Profile Information
                    var examineTypeId=$(this).closest("tr").find('.newExamineType').val();
                    var percentage=$(this).closest("tr").find('.newPercentage').val();
                    var insurranceId=${company.id};
                    // Sending request 
                    var b;
                    var request = $.ajax({
                        url: "/ocare/settings/insurrance/profile/create",
                        type: "POST",
                        dataType: 'json',
                        data: {
                            insurranceId:insurranceId,
                            examineTypeId:examineTypeId,
                            percentage:percentage
                        },
                        complete: function(data) {
                         var profileURL = "/ocare/settings/insurrance/profile/"+insurranceId;
                                    // getting visit
                                    var b;
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
                                            $(".popup_close_icon").on("click", function(e) { 
                                                    $("#profilePopup").bPopup().close();
                                            });
                                        }//end onComplete Method
                                     });/// end Ajax Call Request
                        }//end Complete Function
                    });
                    // return Back the Add New Profile Button to be Live
                    addNewProfileClicked=0;
            });
                
       }//end Checker if for the Add New Profile Button
       /// Lock Adding new Data Until Current finished
        addNewProfileClicked=1;     
    });
    
    ///////////////////////////////////////////////////////
    /*
     *   Delete Profile 
     */
    ///////////////////////////////////////////////////
    $("#profilePopup").unbind('click').on("click",".deleteProfile", function(e) {
         // Gettting Current ProfileID 
         var profileId= $(this).closest("tr").find('input[type="hidden"][name="profileId"]').val();
         var insurranceId=${company.id};
         var request = $.ajax({
                url: "/ocare/settings/insurrance/profile/delete",
                type: "POST",
                dataType: 'json',
                data: {
                    profileId:profileId
                },
                complete: function(data) {
                 var profileURL = "/ocare/settings/insurrance/profile/"+insurranceId;
                            // getting visit
                            var b;
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
                                    $(".popup_close_icon").on("click", function(e) { 
                                        $("#profilePopup").bPopup().close();
                                    });
                                }//end onComplete Method
                             });/// end Ajax Call Request
                }//end Complete Function
            });
    });
    
    ///////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////
    /*
    *   Add First Profile for Insurrance 
    */
    ///////////////////////////////////////////////////
            $(".addFirstProfile").on("click", function(e) {
                /// removing the Current Div of Paragraph 
                $(this).closest("div").remove();
                 $("#profileTable").show();
                 addNewProfileClicked=1;
                 // Draw the Table
                 $('#profileTable').append(
                "<tr id='newInsurrance'>"
                    +"<th> # </th>"
                            
                    +"<td>"
                            +"<select name='examineType' class='newExamineType popupTableDropDownExamine' >"
                                +"<c:forEach items='${examineTypes}' var='examineType'>"
                                         +"<option value='${examineType.id}'><b>${examineType.nameEn}</b></option>"            
                                +"</c:forEach>" 
                            +"</select>"
                    +"</td>"
                            
                    +"<td>"
                            +"<select name='percentage' id='percentage' class='newPercentage popupTableDropDownPercentage' >"
                                +"<c:forEach items='${percentages}' var='percentage'>"
                                +"<option value='${percentage}'><b>${percentage}</b></option>"            
                                +"</c:forEach>" 
                            +"</select><label class='popupTableLabel'>%</label>"
                    +"</td>"
                    
                    +"<th><img src='<c:url value='/resources/images/save-icon.png'/>' id='saveProfile' class='insurranceCompanyDeleteButton'/> <img src='<c:url value='/resources/images/cancel-icon.png'/>' id='cancelSaveProfile' class='insurranceCompanyDeleteButton'/></th>"
                +"</tr>");
        
                $("#saveProfile").on("click", function(e) {
                    ///Getting Profile Information
                    var examineTypeId=$(this).closest("tr").find('.newExamineType').val();
                    var percentage=$(this).closest("tr").find('.newPercentage').val();
                    var insurranceId=${company.id};
                    // Sending request 
                    var b;
                    var request = $.ajax({
                        url: "/ocare/settings/insurrance/profile/create",
                        type: "POST",
                        dataType: 'json',
                        data: {
                            insurranceId:insurranceId,
                            examineTypeId:examineTypeId,
                            percentage:percentage
                        },
                        complete: function(data) {
                         var profileURL = "/ocare/settings/insurrance/profile/"+insurranceId;
                                    // getting visit
                                    var b;
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
                                            $(".popup_close_icon").on("click", function(e) { 
                                                    $("#profilePopup").bPopup().close();
                                            });
                                        }//end onComplete Method
                                     });/// end Ajax Call Request
                        }//end Complete Function
                    });
                    // return Back the Add New Profile Button to be Live
                    addNewProfileClicked=0;
            });                
        
                // Cancel Button Event 
                $('#cancelSaveProfile').on("click", function(e) {
                        // Remove Row 
                        var insurranceCompanyID = ${company.id};
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
                        // return Back the Add New Profile Button to be Live
                        addNewProfileClicked=0;
                    });
            });
    
</script>


    <span class="button b-close"><span class="popup_close_icon">X</span></span>
    
    <div class="popupMyHeader">
        <span class="logo">${company.nameEn} Profile</span>
    
    </div> 
    
    <!--Show All Company Profiles-->    
    <div>
        <c:choose>
            <c:when test="${empty company.profiles}">
                <div>
                     <p class="noProfileMessage">  There isn't any Profile created yet for ${company.nameEn} Company.</p> <br/>
                     <p class="noProfileMessage"> Click </p> <img src="<c:url value='/resources/images/add-sign.png'/>"  class="addFirstProfile"/> <p class="noProfileMessage"> to create New Profile. </p>
                </div>
                
                <table id="profileTable" class="table table-striped" style="cursor: pointer;display: none">
                                <thead>
                                    <tr>
                                        <th style="font-size: 18px">#</th>
                                        <th style="font-size: 16px">Examine Type</th>
                                        <th style="font-size: 16px">Percentage</th>
                                        <th><img src="<c:url value='/resources/images/add-sign.png'/>"  class="addInsurranceProfile insurranceCompanyAddButton"/></th>
                                    </tr>
                                </thead>
                                
                </table>                
            </c:when>
            <c:otherwise>
                <table id="profileTable" class="table table-striped" style="cursor: pointer;">
                                <thead>
                                    <tr>
                                        <th style="font-size: 18px">#</th>
                                        <th style="font-size: 16px">Examine Type</th>
                                        <th style="font-size: 16px">Percentage</th>
                                        <th><img src="<c:url value='/resources/images/add-sign.png'/>"  class="addInsurranceProfile insurranceCompanyAddButton"/></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${company.profiles}" var="profile" varStatus="counter">
                                        <tr class="insurranceRow">
                                           
                                            <input type="hidden" name="profileId" value="${profile.id}"/>
                                            
                                            <th><label class="popupTableLabel">${counter.count}</label></th>
                                            <td tabindex="1">
                                                <select name="examineType" id="examineType" class="examineType popupTableDropDownExamine" >
                                                    <c:forEach items="${examineTypes}" var="examineType">
                                                        <c:choose>
                                                            <c:when test="${examineType.nameEn eq profile.examineType.nameEn}">
                                                                <option value="${examineType.id}" selected="selected"><b>${examineType.nameEn}</b></option>            
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${examineType.id}"><b>${examineType.nameEn}<b></option>            
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </c:forEach> 
                                                </select>  
                                            </td>
                                            
                                            <td tabindex="1">
                                                <select name="percentage" id="percentage" class="percentage popupTableDropDownPercentage" >
                        
                                                    <c:set scope="application" var="normalPercentage" value="0"/>
                                                    <c:forEach items="${percentages}" var="percentage">
                                                        <c:choose>
                                                            <c:when test="${percentage == profile.percentage}">
                                                                <option value="${percentage}" selected="selected">${percentage}</option>  
                                                                 <c:set scope="application" var="normalPercentage" value="1"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${percentage}">${percentage}</option>            
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach> 

                                                    <c:if test="${normalPercentage eq 0}">
                                                            <option value="${percentage}" selected="selected">${profile.percentage}</option>
                                                    </c:if>           

                                                </select> <label class="popupTableLabel">%</label>
                                            </td>
                                            
                                            <th tabindex="1">
                                                <img src="<c:url value='/resources/images/delete-sign.png'/>" class="insurranceCompanyDeleteButton deleteProfile"/>
                                            </th>
                                            
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                        </table>
            </c:otherwise>
        </c:choose>
    </div>
                                                 
                                        