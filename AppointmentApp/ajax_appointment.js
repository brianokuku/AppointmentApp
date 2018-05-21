$('#add_appointment_button').click(function() {
//Retrieving data from the input forms
var theDate = $('#theDate').val();
var theTime = $('#theTime').val();	
var theDesc = $('#theDesc').val();									
				
if(theDate&&theTime&&theDesc){
	
	var currentTime = new Date();
	//d1.getTime() - returns to us a number of the current time

	//This is some code to verify that the user cannot select a date before the current date
	var theString = theDate;
	var array = theString.split('/');
	var month = array[0];
	var day = array[1];
	var year = array[2];

	var chosenDate = new Date(year, month, day, 0, 0, 0, 0);

	if(chosenDate.getTime()<currentTime.getTime()){
		$('#save_status2').html("Please select a valid date");
	}else{
		
		$('#save_status2').html('<img style="width:60px;" src="img/giphy-preview.gif"/>');
					
		$.post('ajax_insert.pl', { theDateKey: theDate, theTimeKey: theTime, theDescKey: theDesc}, function(data){
			$('#save_status2').html(data);
		});
		
	}
	
}else{
	$('#save_status2').html("Please ensure that all the fields are non-empty");
}		



				
});



