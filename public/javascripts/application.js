$(document).ready(function(){
  flash = function(selector){
    if($(selector).length){
      $(selector).effect("highlight", { color : "#FFF7C8", mode : "show" }, 4000);
    }
  };

  $('.site_gallery').spacegallery({
		loadingClass: 'loading',
		border: 5, // border arround the image
		perspective: 50 // perpective height
	});
	
	$("#tabs").tabs().toggleClass('invisible');
	
});
