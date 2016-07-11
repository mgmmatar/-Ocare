/* global $ */
/* this is an example for validation and change events */
$.fn.examineTypeEditable= function () {
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
                var newExamine=$('#newExamine');
                
                if(newExamine.length !==0){return;}
                
                var changedValue=$(this).html();
                var examineTypeId= $(this).parent("tr").find('input[type="hidden"][name="examineTypeId"]').val();
                var changedIndex=$(this).index();
                console.log("Text "+changedValue);
                console.log("Examine Type ID "+examineTypeId);  
                console.log("Coloumn "+changedIndex);  
                ///////////////////////////////////////////////////////////////////////////
                // Sending Ajax Call
                    var b;    
                    var request = $.ajax({
                        url: "/zmed/settings/examineTypeEditable/" +examineTypeId+","+changedIndex+","+changedValue,
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
                        url: "/zmed/settings/examineType/loadExamineTable",
                        data: {
                        },
                        complete: function(data) {
                            $('.panel-body').empty();
                            // Draw New Search Results
                            $('.panel-body').append(data.responseText);
                            ///// Adding the Action Again 
                            $('#mainTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).examineTypeEditable().find('td:first').focus();            
                            // Adding New examineType 
                              $('#AddNewExamineType').on("click", function(e) {
                                  $('#mainTable').append("<tr>"
                                          +"<th> # </th>"
                                          +"<td> </td>"
                                          +"<td> </td>"
                                          +"<td> </td>"
                                          +"<td> </td>"
                                          +"<td> </td>"
                                          +"<th> <input type='checkbox' name='examineDefault' value='default'></th>"
                                          +"<th><img src='../images/save-icon.png' id='AddNewExamineType' class='examineTypeDeleteButton'/></th>"
                                          +"</tr>");
                                  $('#mainTable').editableTableWidget({ editor: $('<textarea>'), preventColumns: [ 1 , 8 ] }).examineTypeEditable().find('td:last').focus();            
                              });
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
