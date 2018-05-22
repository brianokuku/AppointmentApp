
////JQuery to display the new form
$('#new_button').click(function(){
$('#new_form').slideToggle(500);
$(this).hide();
});

//JQuery to hide the form
$('#cancel_button').click(function(){
$('#new_form').slideToggle(500);
$('#new_button').show();
$('#save_status2').html("");
});
