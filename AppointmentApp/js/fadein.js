$('#new_button').click(function(){
$('#new_form').slideToggle(500);
$(this).hide();
});

$('#cancel_button').click(function(){
$('#new_form').slideToggle(500);
$('#new_button').show();
$('#save_status2').html("");
});
