$(document).ready(function(){
  flash = function(selector){
    if($(selector).length){
      $(selector).effect("highlight", { color : "#FFF7C8", mode : "show" }, 4000);
    }
  };   
	
});
