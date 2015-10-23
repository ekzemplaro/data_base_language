// -----------------------------------------------------------------------
//	statusnet.js
//
//					Jul/09/2012
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** statusnet.js ***");

	show_contents ("install");
	show_contents ("settings");
	show_contents ("api");

	jQuery("#outarea_hh").text ("*** end *** statusnet.js ***");
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
