<%-- 
    Document   : examineCost
    Created on : Jun 13, 2016, 12:59:01 AM
    Author     : khaledeng
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

                                    <div class="col-md-3">
                                         <div class="circle c2 img-circle">
                                             <div class="cost-area"> 
                                                 <span class="price-large yellow">${integerCost}.</span> 
                                                 <span class="price-small">${fractionCost}</span>
                                             </div>
                                             <button type="button" id="paidButton" class="btn btn-warning paid-button paid agreePayment">Paid</button>
                                             <input type="hidden" id="totalCost" value="${totalCost}"/>
                                             <input type="hidden" id="paidCost" value="0"/>
                                         </div>
                                    </div>

