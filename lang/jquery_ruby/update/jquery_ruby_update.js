// -----------------------------------------------------------------------
//	update/jquery_ruby_update.js
//
//					Sep/11/2014
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_json;
	var url_update;

	var data_send = new Array ();

	jQuery("#outarea_aa").text ("*** start *** jquery_ruby_update.js ***");

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
		url_json = "../read/" + dbase + "_ruby_read.rb";
		url_update = dbase + "_ruby_update.rb";

		jQuery("#outarea_dd").text ("url_json = " + url_json);
		jQuery("#outarea_ee").text ("url_update = " + url_update);

		table_manipulate (url_json,data_send);
		}
	else
		{
		var encoded = JSON.stringify (data_send);
		send_exec_proc_json (url_update,encoded);
		}
	});


	jQuery("#outarea_hh").text ("*** end *** jquery_ruby_update.js ***");
});

// -----------------------------------------------------------------------
