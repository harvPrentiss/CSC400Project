$(document).ready(function(){	

	// Makes the lists to add and remove exercises from routines sortable, drag and droppable.
	$('#userExerciseList').sortable({
		connectWith: '.sortableList',
		placeholder: 'dragDropHighlight',
		dropOnEmpty: true
	});

	$('#routineExerciseList').sortable({
		connectWith: '.sortableList',
		dropOnEmpty: true,
		start: function(event, ui){
			$(ui.item).addClass('moving');
		},
		stop: function(){ 
			var exList = getExIDs('#userExerciseList li');
			var item = $('#userExerciseList .moving').attr('id');
			if(isDuplicate(exList, item)){
				$('.moving').remove();
			}
		}
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
			    data: { exercise_ids: getExIDs('#routineExerciseList li').join(',') },
	  			success: function() { window.location = '/routines' },
	  			error: function(xhr, textStatus, errorThrown){}
			});
			window.location = '/routines'

		}
	});

	function getExIDs(targetList){
		var newOrder = []; 
		$(targetList).each(function(){
			newOrder.push($(this).attr('id'));
		});
		return newOrder;
	}

	function isDuplicate(items, itemToCheck) {
		var foundSelfCheck = false;
		for(var i = 0; i < items.length; i++){
			if(items[i] == itemToCheck && foundSelfCheck){
				return true;
			}
			else if(items[i] == itemToCheck && !foundSelfCheck){
				foundSelfCheck = true;
			}
		}	  	
		return false;
	}


});