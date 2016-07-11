$(document).ready(function() {

	$("#owl-demo").owlCarousel({
	    navigation : false,
	    slideSpeed : 300,
	    paginationSpeed : 400,
	    autoPlay : false,
	    singleItem : true
	}); 


	
//	$(".rating_simple").webwidget_rating_simple({
//	    rating_star_length: '5',
//	    rating_initial_value: '',
//	    rating_function_name: '',
//	    directory: '/assets/frontend/css/'
//	});


	$('.panel-collapse').on('show.bs.collapse', function () {
  		console.log('ok');
  		$(this).parent().find('.panel-heading').addClass('open_tab_index');
  		$(this).parent().find('.panel-heading').removeClass('close_tab_index');
  		$(this).parent().find('.arrow_img').attr('src', '/assets/frontend/images/arrow_tab_up.png');



	})
	$('.panel-collapse').on('hide.bs.collapse', function () {
  		console.log('ok');
  		$(this).parent().find('.panel-heading').addClass('close_tab_index');
  		$(this).parent().find('.panel-heading').removeClass('open_tab_index');
  		$(this).parent().find('.arrow_img').attr('src', '/assets/frontend/images/arrow_down_tab.png');
	});

// taaaaaaaaab
	$('.btn-occa').on('click', function(event) {
//            $(this).parent().find('.occa_container').css(['width' : '30px','height' : '10px']);
            $(this).parent().find('.occa_container').slideToggle(300);
            $(this).find('.arrow_tab_2').toggleClass('rotated'); 		
	});

	
// taaaaaaaaab
//$('.dropdown_user').on('click', function(event) {
//    event.stopPropagation();	
//    console.log("ok");
//        
////        if($("#drop").is(":visible"))
////        {
//            $(this).parent().find('#drop').slideUp(300);
////           $('#drop').slideUp(300);
////        }
//});
$(document).click(function(){
  $("#drop").slideUp();
});

$('.dropdown_user').on('click', function(e) {
        $('#notification').slideUp();    
        e.stopPropagation();
	$(this).parent().find('#drop').slideToggle(300);
        
        
//	return false;     
});
$('.notification').on('click', function(event) {
        $('#drop').slideUp();
        $.ajax('setReadNotification',{success:function(){
	console.log('read notifications successfully');
        
}});
	$(this).parent().find('#notification').slideToggle(300);
	return false;
});

$('.calender_icon').on('click', function(event) {
	
	return false;
});



if( $('.calender_icon').length > 0 )
{
	$('.calender_icon').datepicker({
		 showOn: 'button',
	     buttonText: 'date',
	     buttonImageOnly: true,
	     buttonImage: '/assets/frontend/images/calender_match.png',
		onSelect:function(date,datepicker){
			
		console.log('select date'+date);
		window.location.href='/calendar/home?date='+dateFormat(new Date(date),'yyyy-mm-dd');
}
	});
        
        var currentDate = $( ".calender_icon" ).datepicker( "getDate" );
        
//        $('#ui-datepicker-div').wrap('<div class="cal"></div>');
//        $('.cal').append('.in_cal');
        
}
	
});




