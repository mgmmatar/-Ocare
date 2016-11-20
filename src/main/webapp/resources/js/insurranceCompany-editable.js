/* global $ */
/* this is an example for validation and change events */
$.fn.insurranceCompanyEditable= function () {
	'use strict';
	var element = $(this),
		footer = element.find('tfoot tr'),
		dataRows = element.find('tbody tr'),
		initialTotal = function () {
			var column, total;
			for (column = 1; column < footer.children().size(); column++) {
				total = 0;
				dataRows.each(function () {
					var row = $(this);
					total += parseFloat(row.children().eq(column).text());
				});
				footer.children().eq(column).text(total);
			};
		};
	element.find('td').on('change', function (evt) {
              
                // check if there is new One 
                var newInusrrance=$('#newInsurrance');
                
                if(newInusrrance.length !==0){return;}
                
                var changedValue=$(this).html();
                var insurranceCompanyId= $(this).parent("tr").find('input[type="hidden"][name="insurranceCompanyId"]').val();
                var changedIndex=$(this).index();
                ///////////////////////////////////////////////////////////////////////////
                // Sending Ajax Call
                    var b;    
                    var request = $.ajax({
                        url: "/zmed/settings/insurranceCompanyEditable/" +insurranceCompanyId+","+changedIndex+","+changedValue,
                        data: {
                        },
                        async: false
                    });

                    request.done(function(msg) {
                        b = (msg == "true" ? true : false);
                    });

                    request.fail(function(jqXHR, textStatus) {
                        b = false;
                    });
                    if (b == true) {
                        var request = $.ajax({
                        url: "/zmed/settings/insurrance/loadInsurranceCompanyTable",
                        data: {
                        },
                        complete: function(data) {
                             $('.myDataTable').empty();
                            // Draw New Search Results
                            $('.myDataTable').append(data.responseText);
                            ///// Adding the Action Again 
                            $('#insurranceCompanyTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).insurranceCompanyEditable();
                            
                            $('#insurranceCompanyTable').paging({
                                        limit:5,
                                        rowDisplayStyle: 'block',
                                    });    
                
                            $('[data-ssd-confirm-trigger]').ssdConfirm();
                            
                        },
                        async: false
                    });
                    }//end if    
                ////////////////////////////////////////////////////////////////////////////
                var cell = $(this),
			column = cell.index(),
			total = 0;
		if (column === 0) {
			return false;
		}
		element.find('tbody tr').each(function () {
			var row = $(this);
			total += parseFloat(row.children().eq(column).text());
		});
		if (column === 1 && total > 5000) {
			$('.alert').show();
			return false; // changes can be rejected
		} else {
			$('.alert').hide();
			footer.children().eq(column).text(total);
		}
	}).on('validate', function (evt, value) {
		var cell = $(this),
			column = cell.index();
                if (column === 0) {
			return !!value && value.trim().length > 0;
		} else {
			//return !isNaN(parseFloat(value)) && isFinite(value);
		}
	});
	initialTotal();
	return this;
};
