$('#search_button').click(function() {
var appointment_value = $('#search_box').val();								
				
$('#save_status').html('<img style="width:60px;" src="images/loader.gif"/>');
				
$.post('ajax_search.pl', { appointment: appointment_value}, function(data){
	$('#save_status').html(data);
});
				
});