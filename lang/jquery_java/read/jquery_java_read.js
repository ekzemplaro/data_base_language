// -----------------------------------------------------------------------
//	jquery_java_read.js
//
//					Dec/16/2010
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** jquery_java_read.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);

	var url_read;

	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");
	url_read = "/data_base/" + dbase + "_java_read";

	jQuery("#outarea_ee").text ("url_read = " + url_read);

	show_json (url_read);

	});

	jQuery("#outarea_hh").text ("*** end *** jquery_java_read.js ***");
});

// -----------------------------------------------------------------------
