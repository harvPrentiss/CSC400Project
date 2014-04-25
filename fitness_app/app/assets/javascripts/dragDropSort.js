$(document).ready(function(){	

	// Makes the lists to add and remove exercises from routines sortable, drag and droppable.
	$('#userExerciseList, #routineExerciseList').sortable({
		connectWith: '.sortableList',
		placeholder: 'dragDropHighlight',
		dropOnEmpty: true
	});


	$('.exrtEdit').on("click", function(e){
		e.stopPropagation();
		e.preventDefault();
		if($('#routineExerciseList').children.length != 0){
			var routine = $('.hidden').attr('id');
			$.ajax({
			    type: 'PUT',
			    url: 'update',
			    dataType: 'html',
			    data: { exercise_ids: getExIDs() },
	  			success: function() { },
	  			error: function(xhr, textStatus, errorThrown){
	       			alert("failure");}
			});
		}
	});

	function getExIDs(){
		var newOrder = []; 
		$('#routineExerciseList li').each(function(){
			newOrder.push($(this).attr('id'));
		});
		return newOrder;
	}


});