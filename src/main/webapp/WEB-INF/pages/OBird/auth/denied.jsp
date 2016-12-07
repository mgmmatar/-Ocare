<%-- 
    Document   : login
    Created on : Oct 27, 2016, 1:50:04 AM
    Author     : khaledeng
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html >
<head>
  <meta charset="UTF-8">
  <title>404 </title>
  
  
      <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/denied.css'/>">
      
      
      
  
</head>


<body>
  <div class="text1">You do not have permission to access this page !!! </div> 
  <div class="text2">You can goto home page , or you can change your login role</div> 
  <a href="/ocare/auth/login" class="button button1">Log out</a>
  <a href="/ocare/reservation/list" class="button button2">Goto Home Page</a>
  <div class="text3">Access Denied :(</div>
  
</body>
</html>