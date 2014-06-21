// -----------------------------------------------------------------------
//	update/jquery_perl_update.js
//
//					Nov/13/2012
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_read;
	var url_update;

	var data_send = new Array ();

	jQuery("#outarea_aa").text ("*** start *** jquery_perl_update.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);

	jQuery ("button").css ("color","black");
	jQuery ("button#" + this.id).css ("color","blue");

	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	if (dbase !== "update")
		{
		data_send = new Array ();
		var prefix = "/cgi-bin/data_base/perl/" + dbase;
		url_read = prefix + "_perl_read.pl";
		url_update = prefix +  "_perl_update.pl";

		jQuery("#outarea_dd").text ("url_read = " + url_read);
		jQuery("#outarea_ee").text ("url_update = " + url_update);

		table_manipulate (url_read,data_send);
		}
	else
		{
		var encoded = jQuery.toJSON (data_send);
		send_exec_proc_json (url_update,encoded);
		}
	});


	jQuery("#outarea_hh").text ("*** end *** jquery_perl_update.js ***");
});

// -----------------------------------------------------------------------
