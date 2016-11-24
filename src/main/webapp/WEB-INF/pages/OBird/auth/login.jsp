<%-- 
    Document   : login
    Created on : Oct 27, 2016, 1:50:04 AM
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
         <title> OCare Login</title>
        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/normalize.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/login.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/Roboto.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/font-awesome.min.css'/>">
        
        <!---  Scripts --->
        <script type="text/javascript" src="<c:url value='/resources/js/jquery.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/prefixfree.min.js'/>"></script>
        
        <script type="text/javascript">
            $(document).ready(function() {
              $('input[type="password"]').on('focus', function () {
                $('*').addClass('password');
              }).on('focusout', function () {
                $('*').removeClass('password');
              });;
            });
        </script>
    </head>
    
       
    <body>

	<div class="owl">
            <div class="hand"></div>
            <div class="hand hand-r"></div>
            <div class="arms">
              <div class="arm"></div>
              <div class="arm arm-r"></div>
            </div>
          </div>
    
    <div class="form">
        <c:url var="loginUrl" value="/login"></c:url>
        <form action="${loginUrl}" method="POST">
            <div class="control">
              <label for="username" class="fa fa-user"></label>
              <input id="username" placeholder="UserName" type="username" name="username"></input>
            </div>
            <div class="control">
              <label for="password" class="fa fa-lock"></label>
              <input id="password" name="password" placeholder="Password" type="password"></input>
              <button type="submit" id="login-button" class="btn">Login</button>
            </div>
        </form>
    </div>
             
    </body>
</html>
