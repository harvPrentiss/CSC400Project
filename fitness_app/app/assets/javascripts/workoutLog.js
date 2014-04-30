$(document).ready(function(){
	$('.workOutLog').toggle();
	$('.workoutLogBtn').on('click', function(e){
		e.preventDefault();
		e.stopPropagation();
		$(this).closest('.exercise').children('.workOutLog').toggle( "slide", { direction: "up" }, "normal" );
	});
});