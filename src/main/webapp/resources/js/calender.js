 $(document).ready(function() {
 
var calendar_day = $('.calendar');
var cal_month = $('.con_month');
var cal_year = $('.con_year');


  calendar_day.owlCarousel({
    rtl:true,
    loop:false,
    margin:0,
    navText:[ '&nbsp;' , '&nbsp;' ],
    nav:true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:3
        },
        1000:{
            items:8
        }
    }
})


  cal_month.owlCarousel({
    rtl:true,
    loop:false,
    margin:0,
    navText:[ '&nbsp;' , '&nbsp;' ],
    nav:true,


    responsive:{
        0:{
            items:1
        },
        600:{
            items:1
        },
        1000:{
            items:1
        }
    }
})


  cal_year.owlCarousel({
    rtl:true,
    loop:false,
    margin:0,
    navText:[ '&nbsp;' , '&nbsp;' ],
    nav:true,


    responsive:{
        0:{
            items:1
        },
        600:{
            items:1
        },
        1000:{
            items:1
        }
    }
})

//******************************* Months Slider

cal_year.on('changed.owl.carousel',function(e){
    
    var curr_item = e.item.index;
    // var curr_value =  parseInt( $(cal_year.find('.item')[curr_item]).find('h4').html()  );
    var curr_year =  parseInt( $(cal_year.find('.item')[curr_item]).data('year')  );

    if( $('.con_month:visible').length > 0)
    {
        $('.con_month:visible').fadeOut('1', function() {
            
            $('#slider-month-' + curr_year).show();

            var  new_day = $('#slider-month-' + curr_year).find('.active .item').data('month');

                console.log(new_day);

                if( $('.calendar:visible').length > 0)
                {
                    $('.calendar:visible').fadeOut('1', function() {
                        
                        $('#slider-day-' + new_day).show();
                    });

                }
                else{
                    $('#slider-day-' + new_day).show();
                }


        });

    }
    else
    {
        var  new_day = $('#slider-month-' + curr_year).find('.active .item').data('month');
        

        if( $('.calendar:visible').length > 0)
        {
            $('.calendar:visible').fadeOut('1', function() {
                
                $('#slider-day-' + new_day).show();
            });

        }
        else{
            $('#slider-day-' + new_day).show();
        }
    }
        
});


curr_year = cal_year.find('.item').first().data('year');
curr_month  = $('#slider-month-' +  curr_year);
curr_month.show();

//******************************* Days Slider


cal_month.on('changed.owl.carousel',function(e){
    
    var curr_item = e.item.index;
    // var curr_value =  parseInt( $(cal_month.find('.item')[curr_item]).find('h4').html()  );

    new_month = $('.con_month:visible') ;
    var curr_day =  $(new_month.find('.item')[curr_item]).data('month')  ;

    console.log(curr_day);
    if( $('.calendar:visible').length > 0)
    {
        $('.calendar:visible').fadeOut('1', function() {
            
            $('#slider-day-' + curr_day).show();
        });

    }
    else{
        $('#slider-day-' + curr_day).show();
    }
        
});


curr_day = curr_month.find('.item').first().data('month');
$('#slider-day-' +  curr_day).show();





$('.month_year_wrap .owl-nav > div').click(function() {


    // var calendar_day_len = calendar_day.find('.item').length ;

    calendar_day.trigger('to.owl.carousel' , [0]);
    
})
// Go to the previous item


$('.calendar .item').on('click', function() {
  show_day($(this));
});

// $('.owl-carousel').owlCarousel({
//     onDragged: callback
// });
// function callback(event) {
//     ...
// }

show_day($('.calendar .item').first());



  });




 function show_day(day){

    var date = day.data('id');

    var matches_to_show = $('.calender_matches.tab_' + date);
    var all_matches = $('.calender_matches:visible');
    
    if (! matches_to_show.is(':visible')) 
    {
      if (all_matches.length > 0)
      {
        $('.calendar .item.active').removeClass('active');
        $(day).addClass('active');
        all_matches.fadeOut('400', function() {
        
            matches_to_show.fadeIn();
            

        });
      }
      else
          matches_to_show.fadeIn(400);
    }
    
    
 }


