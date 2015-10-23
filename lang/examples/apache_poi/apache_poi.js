// -----------------------------------------------------------------------
//	apache_poi.js
//
//					Sep/29/2015
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").html
		("*** apache_poi *** start *** Sep/29/2015 ***");

	var data_text = "";

	var url_in = "./list_program.py";

	jQuery.getJSON (url_in,function (data_aa)
		{
		var str_out = "<blockquote>";

		for (var it in data_aa)
			{
			var line = data_aa[it];
			var cols = ("" + line).split ("/");
			name = cols[cols.length-1];

			var str_aa = '<a href="' + line + '" target="_blank">';
			str_aa += name + '</a><br />';

			str_out += str_aa;
			}

		str_out += "</blockquote>";

		jQuery(".contents").html (str_out);
		});

	jQuery("#outarea_hh").html
		("*** apache_poi *** end *** Sep/29/2015 ***");

});

// -----------------------------------------------------------------------
