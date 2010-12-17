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
	
	$("#tabs").tabs({
	  show: function(event, ui) {
	    var colors = {
	      'my_sites': '#D0E7FF',
	      'prices': '#F3D3FA',
	      'contacts': '#CDFED3',
	      };
      
	    var panel_id = $(ui.panel).attr('id');
	    $('body').css('background-color', colors[panel_id])
	  }
  }).toggleClass('invisible');
	
});
