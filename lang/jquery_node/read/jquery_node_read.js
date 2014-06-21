// -----------------------------------------------------------------------
//	read/jquery_node_read.js
//
//					Dec/20/2010
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** jquery_node_read.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);

	var url_json;

	var dbase = this.id;

	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	url_json = "/cgi-bin/data_base/node/" + dbase + "_node_read.js";

	jQuery("#outarea_ee").text ("url_json = " + url_json);

	show_json (url_json);

	});


	jQuery("#outarea_hh").text ("*** end *** jquery_node_read.js ***");
});

// -----------------------------------------------------------------------
