// -----------------------------------------------------------------------
//	ruby_on_rails.js
//
//					Aug/27/2012
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** ruby_on_rails.js ***");


	show_contents ("install");
	show_contents ("versions");
	show_contents ("example");
	show_contents ("database");
	show_contents ("passenger");


	jQuery("#outarea_hh").text ("*** end *** ruby_on_rails.js ***");
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
