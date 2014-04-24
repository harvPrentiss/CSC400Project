$(document).ready(function(){	

	// Makes the lists to add and remove exercises from routines sortable, drag and droppable.
	$('#userExerciseList, #routineExerciseList').sortable({
		connectWith: '.sortableList',
		placeholder: 'dragDropHighlight',
		dropOnEmpty: true
	});


	$('.exrtEdit').on("click", function(){
		var routine = $('.hidden').attr('id');
		$.ajax({
		    type: 'PUT',
		    url: 'update',
		    data: { exercise_ids: getExIDs() },
  			success: function() {}
		});

	});

	function getExIDs(element){
		var newOrder = new Array();
		$('#routineExerciseList').children().each(function(){
			var exID = $(this).attr("id");
			newOrder.push(exID);
		});
		return newOrder.join(',');
	}


});