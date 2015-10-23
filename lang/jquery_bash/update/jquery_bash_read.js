// -----------------------------------------------------------------------
//	read/jquery_bash_read.js
//
//					Oct/18/2010
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_read;

	jQuery("#outarea_aa").text ("*** start *** jquery_bash_read.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);


	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	url_read = "/cgi-bin/data_base/bash/" + dbase + "_bash_read.sh";

	jQuery("#outarea_ee").text ("url_read = " + url_read);

	show_json (url_read);

	});

	jQuery("#outarea_hh").text ("*** end *** jquery_bash_read.js ***");
});

// -----------------------------------------------------------------------
