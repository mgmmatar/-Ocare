(function($, w) {
    _.templateSettings = {
        interpolate: /<@=([\s\S]+?)@>/g,
        evaluate: /<@([\s\S]+?)@>/g,
        escape: /<@-([\s\S]+?)@>/g
    };
    var dateFormat = function() {
        var token = /d{1,4}|m{1,4}|yy(?:yy)?|([HhMsTt])\1?|[LloSZ]|"[^"]*"|'[^']*'/g,
                timezone = /\b(?:[PMCEA][SDP]T|(?:Pacific|Mountain|Central|Eastern|Atlantic) (?:Standard|Daylight|Prevailing) Time|(?:GMT|UTC)(?:[-+]\d{4})?)\b/g,
                timezoneClip = /[^-+\dA-Z]/g,
                pad = function(val, len) {
                    val = String(val);
                    len = len || 2;
                    while (val.length < len)
                        val = "0" + val;
                    return val;
                };

        // Regexes and supporting functions are cached through closure
        return function(date, mask, utc) {
            var dF = dateFormat;

            // You can't provide utc if you skip other args (use the "UTC:" mask prefix)
            if (arguments.length == 1 && Object.prototype.toString.call(date) == "[object String]" && !/\d/.test(date)) {
                mask = date;
                date = undefined;
            }

            // Passing date through Date applies Date.parse, if necessary
            date = date ? new Date(date) : new Date;
            if (isNaN(date))
                throw SyntaxError("invalid date");

            mask = String(dF.masks[mask] || mask || dF.masks["default"]);

            // Allow setting the utc argument via the mask
            if (mask.slice(0, 4) == "UTC:") {
                mask = mask.slice(4);
                utc = true;
            }

            var _ = utc ? "getUTC" : "get",
                    d = date[_ + "Date"](),
                    D = date[_ + "Day"](),
                    m = date[_ + "Month"](),
                    y = date[_ + "FullYear"](),
                    H = date[_ + "Hours"](),
                    M = date[_ + "Minutes"](),
                    s = date[_ + "Seconds"](),
                    L = date[_ + "Milliseconds"](),
                    o = utc ? 0 : date.getTimezoneOffset(),
                    flags = {
                        d: d,
                        dd: pad(d),
                        ddd: dF.i18n.dayNames[D],
                        dddd: dF.i18n.dayNames[D + 7],
                        m: m + 1,
                        mm: pad(m + 1),
                        mmm: dF.i18n.monthNames[m],
                        mmmm: dF.i18n.monthNames[m + 12],
                        yy: String(y).slice(2),
                        yyyy: y,
                        h: H % 12 || 12,
                        hh: pad(H % 12 || 12),
                        H: H,
                        HH: pad(H),
                        M: M,
                        MM: pad(M),
                        s: s,
                        ss: pad(s),
                        l: pad(L, 3),
                        L: pad(L > 99 ? Math.round(L / 10) : L),
                        t: H < 12 ? "a" : "p",
                        tt: H < 12 ? "am" : "pm",
                        T: H < 12 ? "A" : "P",
                        TT: H < 12 ? "AM" : "PM",
                        Z: utc ? "UTC" : (String(date).match(timezone) || [""]).pop().replace(timezoneClip, ""),
                        o: (o > 0 ? "-" : "+") + pad(Math.floor(Math.abs(o) / 60) * 100 + Math.abs(o) % 60, 4),
                        S: ["th", "st", "nd", "rd"][d % 10 > 3 ? 0 : (d % 100 - d % 10 != 10) * d % 10]
                    };

            return mask.replace(token, function($0) {
                return $0 in flags ? flags[$0] : $0.slice(1, $0.length - 1);
            });
        };
    }();

    // Some common format strings
    dateFormat.masks = {
        "default": "ddd mmm dd yyyy HH:MM:ss",
        shortDate: "m/d/yy",
        mediumDate: "mmm d, yyyy",
        longDate: "mmmm d, yyyy",
        fullDate: "dddd, mmmm d, yyyy",
        shortTime: "h:MM TT",
        mediumTime: "h:MM:ss TT",
        longTime: "h:MM:ss TT Z",
        isoDate: "yyyy-mm-dd",
        isoTime: "HH:MM:ss",
        isoDateTime: "yyyy-mm-dd'T'HH:MM:ss",
        isoUtcDateTime: "UTC:yyyy-mm-dd'T'HH:MM:ss'Z'"
    };

    // Internationalization strings
    dateFormat.i18n = {
        dayNames: [
            "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat",
            "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
        ],
        monthNames: [
            "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
            "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
        ]
    };

    // For convenience...
    Date.prototype.format = function(mask, utc) {
        return dateFormat(this, mask, utc);
    };


    w.Helper = {
        setDateFormat: function(format) {
            if (typeof (format) === 'string')
                Helper.format = format.trim();
        },
        setDateLink: function(format) {
            if (typeof (format) === 'string')
                Helper.dateLinkFormat = format.trim();
        },
        daysInMonth: function(year, month) {
            return new Date(year, month, 0).getDate();
        },
        dayName: function(year, month, day) {
            var _dayNameIndex = new Date(year, month - 1, day).getDay();
            var _dayNames = ['Sun', 'Mon', 'Tues', 'Wed', 'Thu', 'Fri', 'Sat'];
            var _dayNamesInArabic = ['الاحد', 'الاثنين', 'الثلاثاء', 'الاربعاء', 'الخميس', 'الجمعة', 'السبت'];

            return _dayNamesInArabic[_dayNameIndex];
        },
        daysInMonthObject: function(year, month) {
            var numberOfDaysInMonth = Helper.daysInMonth(year, month);

            if (typeof (Helper.format) === 'undefined')
                Helper.format = 'yyyy-mm-dd';

            var daysInMonthObject = [];
            for (var i = 1; i <= numberOfDaysInMonth; i++) {
                var _tmp = new Date(year, month - 1, i);
                daysInMonthObject.push(
                        {
                            number: i,
                            name: Helper.dayName(year, month, i),
                            date: _tmp.format(Helper.format),
                        }
                )
            }
            return daysInMonthObject;
        },
    }

    w.calender = {
        init: function() {
            calender.prepare();
            calender.events();

            calender.buildYears();
            calender.buildMonths();
            calender.yearsAndMonthsOwl();


            var yearCurrentIndex = $("#year .item").index($("#year .item[data-year=" + calender.currentYear + "]"));
            $("#year").trigger('to.owl.carousel', [yearCurrentIndex]);
            $("#month").trigger('to.owl.carousel', [calender.currentMonth - 1]);
            calender.daysOwl(calender.currentDay);



        },
        selectedDate: function() {
            var day = $('#dateSlider').find('.selected').children('div').first().data('date');

            if (!day)
                return null;

            var year = $('#year').find('.owl-item.active').children('div').text().trim();
            var month = $('#month').find('.owl-item.active').children('div').attr('data-month').trim();

            return year + '/' + month + '/' + day;
        },
        prepare: function() {
            calender.daysTemplate = _.template($('#calender-days-template').html());
            calender.yearsTemplate = _.template($('#calender-years-template').html());
            calender.monthsTemplate = _.template($('#calender-months-template').html());
            calender.firstTime = true;
            calender.yearsRange = parseInt($('.date-slider').attr('data-years-range'));

            calender.now = new Date($('.date-slider').attr('data-now'));

            calender.currentYear = calender.now.getFullYear();
            calender.currentMonth = calender.now.getMonth() + 1;
            calender.currentDay = calender.now.getDate();
        },
        buildYears: function() {
            $('#year').html(
                    calender.yearsTemplate({
                        range: calender.yearsRange,
                        currentYear: calender.currentYear
                    })
                    );
        },
        buildMonths: function() {
            $('#month').html(
                    calender.monthsTemplate({
                        currentMonth: calender.currentMonth
                    })
                    );
        },
        yearsAndMonthsOwl: function() {
            $("#year, #month").owlCarousel({
                rtl: true,
                loop: false,
                margin: 0,
                navText: ['&nbsp;', '&nbsp;'],
                nav: true,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 1
                    },
                    1000: {
                        items: 1
                    }
                }
            });
        },
        events: function() {
            $("#year, #month").on('changed.owl.carousel', function() {
                clearTimeout(calender._timeout);
                calender._timeout = setTimeout(
                        function() {
                            if (calender.daysOwlObject !== undefined) {
                                calender.daysOwlObject.destroy();
                            }

                            var year =
                                    parseInt(
                                            $('#year').find('.owl-item.active').children('div').text().trim()
                                            );
                            var month =
                                    parseInt(
                                            $('#month').find('.owl-item.active').children('div').attr('data-month').trim()
                                            );

                            calender.buildDays(
                                    Helper.daysInMonthObject(year, month)
                                    );
                            if (calender.firstTime) {
                                calender.daysOwl(calender.currentDay);
                                calender.firstTime = false;
                            } else {
                                calender.daysOwl();
                            }

                        },
                        100
                        );

            });




            /*$('.date-slider').on('click', '.owl-next, .owl-prev',function () {
             $('#dateSlider').find('.owl-item').removeClass('selected');
             });*/

        },
        buildDays: function(data) {
            var year = parseInt(
                    $('#year').find('.owl-item.active').children('div').text().trim()
                    );
            var month =
                    parseInt(
                            $('#month').find('.owl-item.active').children('div').attr('data-month').trim()
                            );
            $('#dateSlider').html(
                    calender.daysTemplate({
                        data: data,
                        currentDay: calender.currentDay,
                        currentMonth: calender.currentMonth,
                        currentYear: calender.currentYear,
                        selectedMonth: month,
                        selectedYear: year,
                    })
                    );

        },
        daysOwl: function(day) {
            var owl = $("#dateSlider").owlCarousel({
                rtl: true,
                loop: false,
                margin: 0,
                navText: ['&nbsp;', '&nbsp;'],
                nav: true,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 3
                    },
                    1000: {
                        items: 8
                    }
                }
            });
            calender.daysOwlObject = $("#dateSlider").data('owlCarousel');
            if (day != null) {
                calender.show_day($('.calendar .item[data-date=' + day + ']'));

                $("#dateSlider").trigger('to.owl.carousel', [(calender.currentDay <= 8 ? 0 : (calender.currentDay <= 16 ? 1 : (calender.currentDay <= 24 ? 2 : (3))))]);
            }
            else {
                calender.show_day($('.calendar .item').first());
            }
    
        $('.calendar .item').click(function(event) {
              event.preventDefault();
                var oldReservation = "";
                var newReservation = "";
                var cancelledReservation= "";
                
		calender.show_day($(this));	
		var day = $(this).data('date');
                var year = $(this).parents('.date-slider').find('.month_year_wrap').find('#year').find('.owl-item.active').children('div').text().trim();  
                var month = $(this).parents('.date-slider').find('.month_year_wrap').find('#month').find('.owl-item.active').children('div').attr('data-month').trim();	
                //alert(year+" - "+month+" - "+day);
                /// Getting CurrentDate
                var currentDate=year+"-"+month+"-"+day;
                //// Getting Examine Type ID 
                var examineTypeId=$("#examineTypeId").val();
                $('#currentDate').val(currentDate);
                /////////////////////////////////////////////
                 var reservationURL="/ocare/reservation/timeSlice/"+currentDate+","+examineTypeId;
                 
                // alert(reservationURL);
                 // Getting Ajax 
                    var b;
                    var request = $.ajax({
                        url: reservationURL,
                        type: "GET",
                        dataType: 'json',
                        data: {
       
                        },
                        complete: function(data) {
                            //console.log('done :' + JSON.stringify( data));
                            var mm=$('.no_matches').html();
                            //console.log('DDDDD :' + JSON.stringify( mm));
                            $('.no_matches').empty();
                            $('.no_matches').append(data.responseText);
                            $('#accordion').show();
                            ///////////////////////////////////////////
                            //Adding Actions To Slices 
                            $(".Slice").click(function() {
                            ///// Checking the Item Clicked Class
                            if($(this).hasClass("reserved")){
                                /// assign the reservation to be cancelled 
                                cancelledReservation=$(this);
                                $("a[href='#popup2']").trigger("click");
                            }//end if Condition 
                            ////////////////////////////////////////////
                            if ($(this).hasClass("Available")) {
                                // check if Time Chosed Before
                                var reserveBefore= $(this).parents(".no_matches").find('.reserved');
                                    if(reserveBefore.size() > 0) {
                                         var reservedTime=reserveBefore.clone().children().remove().end().text();
                                          /// Save the Old Reservation 
                                          oldReservation =  reserveBefore;
                                          newReservation = $(this);
                                          $("a[href='#popup1']").trigger("click");
                                    }else{
                                        $(this).removeClass("type-11 cat-4");
                                        $(this).addClass("type-9 cat-3 reserved");
                                    }//end Else 
                            }//end if Condition
                        });
                        
                        $('#leaveReservation').on("click", function(e) {
                            $.fancybox.close();
                        });

                        $('#cancelReservation').on("click", function(e) {
                            $(cancelledReservation).addClass("type-11 cat-4 Available");
                            $(cancelledReservation).removeClass("type-9 cat-3 reserved");
                            $.fancybox.close();
                        });
                        ////////////////////////////////////////////////////////////
                        ////////////////////////////////////////////////////////////
                        $('#leaveOldReservation').on("click", function(e) {
                            $.fancybox.close();
                        });

                        $('#cancelOldReservation').on("click", function(e) {
                            /// Modify the Old reservation
                            $(newReservation).removeClass("type-11 cat-4 Available");
                            $(newReservation).addClass("type-9 cat-3 reserved");
                            /// Modify the New Reservation
                            $(oldReservation).addClass("type-11 cat-4 Available");
                            $(oldReservation).removeClass("type-9 cat-3 reserved");
                            // Close the PopUp Message
                            $.fancybox.close();
                        });
                        
                        
                        }
                    });
                
            });


        },
        show_day: function(day) {

            var date = day.data('date');
            var year = $('#year').find('.owl-item.active').children('div').text().trim();
            var month = $('#month').find('.owl-item.active').children('div').attr('data-month').trim();
            var matches_to_show = $('.calender_matches.tab_' + year + '-' + month + '-' + date);
            var all_matches = $('.calender_matches');

            if (!matches_to_show.is(':visible'))
            {
                if (all_matches.length > 0)
                {
                    $('.calendar .item.active').removeClass('active');
                    $(day).addClass('active');
                    all_matches.hide();
//                    $('.calender_matches:visible').fadeOut('400', function() {
                    if (matches_to_show.length != 0) {
                        matches_to_show.fadeIn();
                    }
                    else {

                       }
                }
                else {
                    matches_to_show.fadeIn(400);
                    $('.calendar .item.active').removeClass('active');
                    $(day).addClass('active');

                }
            }

        }

    }

    $(document).ready(function() {
        calender.init();
    });

})(jQuery, window);

