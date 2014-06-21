// -----------------------------------------------------------------------
//	express.js
//
//					Mar/12/2012
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** express.js ***");

	show_contents ("install");
	show_contents ("versions");

	jQuery("#outarea_hh").text ("*** end *** express.js ***");
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
