// -----------------------------------------------------------------------
//	update/jquery_perl_update.js
//
//					Aug/07/2014
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
		url_read = "../read/" + dbase + "_perl_read.pl";
		url_update = dbase +  "_perl_update.pl";

		jQuery("#outarea_dd").text ("url_read = " + url_read);
		jQuery("#outarea_ee").text ("url_update = " + url_update);

		table_manipulate (url_read,data_send);
		}
	else
		{
		var encoded = JSON .stringify(data_send);
		send_exec_proc_json (url_update,encoded);
		}
	});

	jQuery("#outarea_hh").text ("*** end *** jquery_perl_update.js ***");
});

// -----------------------------------------------------------------------
