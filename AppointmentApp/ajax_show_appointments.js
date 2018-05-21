//The get appointments function anonymously called from here

$('#search_button').click(function() {
	
//Gets value from the search box
var appointment_value = $('#search_box').val();								
				
//Used to give feedback in form of a gif while perl script runs
$('#save_status').html('<img style="width:60px;" src="img/giphy-preview.gif"/>');

//Ajax call to the perl script. Data passed to the perl file in form of JSON. On success, it returns data		
$.post('ajax_show.pl', { appointment: appointment_value}, function(data){
	$('#save_status').html(data);
});
				
});