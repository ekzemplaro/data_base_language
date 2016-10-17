//
jQuery(function ()
{
	jQuery('#foo').submit(function(){
        var fd = new FormData(jQuery('#foo').get(0));
        jQuery.ajax({
		url: "upload_ajax.php",
		type: "POST",
		data: fd,
		processData: false,
		contentType: false,
		dataType: 'json'
        })
        .done(function( data ) {
	jQuery('#result').text(JSON.stringify (data))
	});
	return false;
	});
});
//
