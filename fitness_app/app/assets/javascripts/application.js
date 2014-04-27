// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require turbolinks
//= require_tree .


var ready;
var MAX_CHARACTERS = 140;
ready = function(){
	$('.statusPostBox').keyup(function(){
		$('.characterCount').removeClass('redWarning');
		$('.characterCount').text(MAX_CHARACTERS - this.value.replace(/{.*}/g, '').length);
		if(MAX_CHARACTERS - this.value.replace(/{.*}/g, '').length <= 20){
			$('.characterCount').addClass('redWarning');
		}
	})

	$('.profileCardBackListItem').on('click', function(){
		$('.cardBackContent').addClass('hidden');
		$('.profileCardBackListItem').removeClass('addTextFieldColor');
		$(this).addClass('addTextFieldColor');
		if($(this).text() == "Stats"){
			$('#Stats').removeClass('hidden');
		}
		else if($(this).text() == "Soundtrack"){
			$('#Soundtrack').removeClass('hidden');
		}
		else if($(this).text() == "Workouts"){
			$('#Workouts').removeClass('hidden');
		}
	})

	 $('a.hook').bind('inview', function(e,visible) {
    if( visible ) {
      $.getScript($(this).attr("href"));
    }
  });

	

}

$(document).ready(ready);
$(document).on('page:load', ready);

