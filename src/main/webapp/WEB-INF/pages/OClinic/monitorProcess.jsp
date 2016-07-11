<%-- 
    Document   : monitorProcess
    Created on : Jan 16, 2016, 6:27:24 PM
    Author     : khaledeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monitor Process </title>
        <style type="text/css">
        body{
            font-family: Trebuchet MS, Lucida Sans Unicode, Arial, sans-serif;	/* Font to use */
            background-color:#E2EBED;
        }
        </style>
        <style type="text/css" media="print">
	div#dhtmlgoodies_listOfItems{
            display:none;
	}
	body{
            background-color:#FFF;
	}
	img{
            display:none;
	}
	#dhtmlgoodies_dragDropContainer{
            border:0px;
            width:100%;
	}
	</style>
        <!-- Import MonitorDrag Style-->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/monitor/css/monitorDrag.css'/>">
        <script type="text/javascript" src="<c:url value='/resources/monitor/js/monitorDrag.js'/>"></script>
        <script type="text/javascript">
            window.onload = initDragDropScript;
        </script>
    </head>
    <body>
    <div id="dhtmlgoodies_dragDropContainer">
	<div id="topBar">
		<img src="<c:url value='/resources/monitor/images/insert.gif'/>">
	</div>
	<div id="dhtmlgoodies_listOfItems">
	<div>
		<p>Complains List</p>
		<ul id="allItems">
                    <c:forEach items="${complains}" var="complain">
			<li id="node${complain.id}">${complain.name}</li>
                    </c:forEach>    
		</ul>
	</div>
	</div>
	<div id="dhtmlgoodies_mainContainer">
		<!-- ONE <UL> for each "room" -->
                <div>
			<p>Work Space</p>
			<ul id="box5">
                            
			</ul>
		</div>
	</div>
    </div>
    <ul id="dragContent"></ul>
    <div id="dragDropIndicator"><img src="<c:url value='/resources/monitor/images/insert.gif'/>"></div>
    </body>
</html>