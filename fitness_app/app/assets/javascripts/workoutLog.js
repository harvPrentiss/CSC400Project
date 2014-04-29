$(document).ready(function(){
	$('.workoutLogBtn').on('click', function(e){
		e.preventDefault();
		e.stopPropagation();
		$(this).closest('.exercise').toggle( "slide", { direction: "up" }, "slow" );
	});
});