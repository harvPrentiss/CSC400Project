$(document).ready(function(){	

	// Makes the lists to add and remove exercises from routines sortable, drag and droppable.
	$('#userExerciseList, #routineExerciseList').sortable({
		connectWith: '.sortableList',
		placeholder: 'dragDropHighlight',
		dropOnEmpty: true
	});


	$('.exrtEdit').on("click", function(){
		var exIDs = getExIDs();
		var target = "exercise_routine/create";
		$.ajax({
		    type: 'GET',
		    url: target + '?order=' + exIDs,
		    data: exIDs
		});

	});

	function getExIDs(element){
		var newOrder = new Array();
		$('#routineExerciseList').children().each(function(){
			var exID = $(this).attr("id");
			newOrder.push(exID);
		});
		newOrder.push($('.hidden').attr('id'));
		return newOrder.join(',');
	}


});