// -----------------------------------------------------------------------
//	read/jquery_tcl_read.js
//
//					Dec/01/2010
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** jquery_tcl_read.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);

	var url_json;

	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	url_json = "/cgi-bin/data_base/tcl/" + dbase + "_tcl_read.tcl";

	jQuery("#outarea_ee").text ("url_json = " + url_json);

	show_json (url_json);

	});


	jQuery("#outarea_hh").text ("*** end *** jquery_tcl_read.js ***");
});

// -----------------------------------------------------------------------
