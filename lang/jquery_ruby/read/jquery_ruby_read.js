// -----------------------------------------------------------------------
//	read/jquery_ruby_read.js
//
//					Nov/13/2012
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** jquery_ruby_read.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);

	jQuery ("button").css ("color","black");
	jQuery ("button#" + this.id).css ("color","blue");

	var url_json;

	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	url_json = "/cgi-bin/data_base/ruby/" + dbase + "_ruby_read.rb";

	jQuery("#outarea_ee").text ("url_json = " + url_json);

	show_json (url_json);

	});


	jQuery("#outarea_hh").text ("*** end *** jquery_ruby_read.js ***");
});

// -----------------------------------------------------------------------
