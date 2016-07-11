<%-- 
    Document   : visitListBooklet
    Created on : Jun 1, 2016, 12:29:08 AM
    Author     : khaledeng
--%>
<!--  Booklet Section -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>        
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      

<script type="text/javascript" src="<c:url value='/resources/js/jquery.booklet.latest.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.easing.1.3.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery.booklet.latest.css'/>" media="screen, projection, tv">

<style type="text/css">
                #menu {width:auto;}
		#controls {float:left;}
		
</style>

<script type="text/javascript">
	    $(function () {
		
			// Init
			
			var updateSelect = function (event, data) {
				var pageTotal = data.options.pageTotal;
				$('#gotoIndex, #addIndex, #removeIndex').children().remove();
				$('#gotoIndex, #addIndex, #removeIndex').append('<option value="start">start</option><option value="end">end</option>');						
				for(i = 0; i < pageTotal; i++) {
					$('#gotoIndex, #addIndex, #removeIndex').append('<option value="'+ i +'">'+ i +'</option>');						
				}
			};
			
			var options = $.extend({}, $.fn.booklet.defaults, {
			    pagePadding: 15,
			    menu: "#menu",
			    pageSelector: true,
			    chapterSelector: true,
			    arrows: true,
			    tabs: true,
                arrowsHide:true
			});
			var updateOptions = function () {
				$('#options-list').children().remove();
				$.each(options, function(key, value){
					$('#options-list').append('<li>'+key+' <input value="'+value+'" id="option-'+key+'" /></li>');
					$('#option-'+key).on('change', function(e){
						e.preventDefault();
						var value = $(this).val();
						var intValue = parseInt(value);
						
						if(!isNaN(intValue)) {
							options[key] = intValue;
							return;
						}

						options[key] = value;
					});
				});
			};
			updateOptions();
			
			var config = $.extend({}, options, {
				create: updateSelect,
				add: updateSelect,
				remove: updateSelect
			});
	        var mybook = $("#mybook").booklet(config);
	
			$('#gotoIndex').on('change', function(e){
				e.preventDefault();
				$('#custom-gotopage').click();
			});
	
			// New Page Default HTML
	
			var newPageCount = 0;
	        var newPageHtml = function() {
				newPageCount++;
				return "<div rel='new chapter'>New Page \#"+newPageCount+"</div>";
			};
			
			
			// Display
			
	        var display = $("#display");
			var updateDisplay = function(message) {
				display.text(message + '\r\n' + display.text());
			};

	    });
    </script>
            <section id="content" class="sub-content">
	
	    <div id="menu"></div>
	    <div id="mybook">
	        <div style="border:1px solid #000000;" title="first page" rel="January visits" >
	            <h3>1 jQuery Booklet</h3>
				
			
	        </div>
	        <div title="second page">
	            <h3>2 Default Options</h3>
	        </div>
	        <div title="third page">
	            <h3>3 Huzzah!</h3>
	        </div>
	        <div title="fourth page">
	            <h3>4 jQuery Booklet</h3>
	        </div>
	        <div title="fifth page" rel="Feberuary visits">
	            <h3>5 jQuery Booklet</h3>
	        </div>
	        <div title="sixth page">
	            <h3>6 Default Options</h3>
	        </div>
	        <div title="seventh page">
	            <h3>7 Huzzah!</h3>
	        </div>
	        <div title="eighth page" >
	            <h3>8 jQuery Booklet</h3>
	        </div>
			<div title="ninth page" rel="Marc visits">
	            <h3>9 mgm Booklet</h3>
	        </div>
			<div title="tenth page" >
	            <h3>10 khaled Booklet</h3>
	        </div>
			<div title="eleven page">
	            <h3>11 medo Booklet</h3>
	        </div>
			<div title="twilve page">
	            <h3>12 ali Booklet</h3>
	        </div>
			<div title="therteen page">
	            <h3>13 mody Booklet</h3>
	        </div>

	    </div>
	</section>

