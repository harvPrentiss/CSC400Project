var currentPage = 1;
var intervalID = -1000;
 
function checkScroll() {
  if (nearBottomOfPage()) {
    currentPage++;
    jQuery.ajax('?page=' + currentPage, {asynchronous:true, evalScripts:true, method:'get', success: function(data, textStatus, jqXHR) {
		$('.statusList').append(jQuery(data).find('.statusList').html());
		if(typeof jQuery(data).find('.statusList').html() == 'undefined' || jQuery(data).find('.statusList').html().trim().length == 0 || 
			jQuery(data).find('.statusList').html() == 'Whats Going On'){
			clearInterval(intervalID);
		}
	},});
  }
}
 
function nearBottomOfPage() {
  return scrollDistanceFromBottom() < 50;
}
 
function scrollDistanceFromBottom(argument) {
  return pageHeight() - (window.pageYOffset + self.innerHeight);
}
 
function pageHeight() {
  return Math.max(document.body.scrollHeight, document.body.offsetHeight);
}
 
$('document').ready(function(){
	intervalID = setInterval(checkScroll, 250);
})