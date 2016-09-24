$(document).on("ready", function(){
	$("a[data-remote]").on("ajax:success", function(e, data, status, xhr){
		
	    if ($(this).html() == "Like") {
                    $(this).html('Unlike');
                	}
        else {
            $(this).html('Like');
            }
	});
})
