// -----------------------------------------------------------------------
//	read/jquery_perl_read.js
//
//					Jul/23/2014
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** jquery_perl_read.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);

	jQuery ("button").css ("color","black");
	jQuery ("button#" + this.id).css ("color","blue");

	var url_json;

	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	url_json = dbase + "_perl_read.pl";

	jQuery("#outarea_ee").text ("url_json = " + url_json);

	show_json (url_json);
	});

	jQuery("#outarea_hh").text ("*** end *** jquery_perl_read.js ***");
});

// -----------------------------------------------------------------------
