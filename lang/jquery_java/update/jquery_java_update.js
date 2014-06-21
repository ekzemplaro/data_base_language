// -----------------------------------------------------------------------
//	update/jquery_java_update.js
//
//					Dec/16/2010
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_read;
	var url_update;

	var data_send = new Array ();

	jQuery("#outarea_aa").text ("*** start *** jquery_java_update.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);

	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	if (dbase !== "update")
		{
		data_send = new Array ();
		url_read = "/data_base/" + dbase + "_java_read";
		url_update = "/data_base/" + dbase + "_java_update";

		jQuery("#outarea_dd").text ("url_read = " + url_read);
		jQuery("#outarea_ee").text ("url_update = " + url_update);

		table_manipulate (url_read,data_send);
		}
	else
		{
		send_exec_proc (url_update,data_send);
		}
	});


	jQuery("#outarea_hh").text ("*** end *** jquery_java_update.js ***");
});

// -----------------------------------------------------------------------
