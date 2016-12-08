/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

            $(function () {
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


