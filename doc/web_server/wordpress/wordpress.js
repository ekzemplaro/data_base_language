// -----------------------------------------------------------------------
//	wordpress.js
//
//					Apr/10/2012
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** wordpress.js ***");

	show_contents ("install");
	show_contents ("settings");
	show_contents ("backup");

	jQuery("#outarea_hh").text ("*** end *** wordpress.js ***");
});

// -----------------------------------------------------------------------
function show_contents (contents)
{
	var url_txt = contents + ".txt";
	var place = "#" + contents;

	jQuery.get (url_txt,function (data_text)
                {
		jQuery (place).html (data_text);
                });
}

// -----------------------------------------------------------------------
