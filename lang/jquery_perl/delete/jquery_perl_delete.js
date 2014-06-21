// -----------------------------------------------------------------------
//	jquery_perl_delete.js
//
//					Nov/13/2012
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_read;
	var url_delete;

	jQuery("#outarea_aa").text ("*** start *** jquery_perl_delete.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);

	jQuery ("button").css ("color","black");
	jQuery ("button#" + this.id).css ("color","blue");

	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	if (dbase !== "delete")
		{
		var prefix = "/cgi-bin/data_base/perl/" + dbase;
		url_read = prefix + "_perl_read.pl";
		url_delete = prefix +  "_perl_delete.pl";

		jQuery("#outarea_dd").text ("url_read = " + url_read);
		jQuery("#outarea_ee").text ("url_delete = " + url_delete);

		table_delete (url_read);
		}
	else
		{
		send_exec_proc_json (url_read,url_delete);
		}
	});


	jQuery("#outarea_hh").text ("*** end *** jquery_perl_delete.js ***");
});

// -----------------------------------------------------------------------
