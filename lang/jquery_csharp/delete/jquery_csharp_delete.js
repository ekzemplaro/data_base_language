// -----------------------------------------------------------------------
//	delete/jquery_csharp_delete.js
//
//					Oct/17/2014
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_read;
	var url_update;

	var data_send = new Array ();

	jQuery("#outarea_aa").text ("*** start *** jquery_csharp_delete.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);

	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	if (dbase !== "delete")
		{
		data_send = new Array ();
		url_read = "../read/" + dbase + "_csharp_read.aspx";
		url_delete = dbase + "_csharp_delete.aspx";

		jQuery("#outarea_dd").text ("url_read = " + url_read);
		jQuery("#outarea_ee").text ("url_delete = " + url_delete);

		table_delete (url_read);
		}
	else
		{
		send_exec_proc_json (url_read,url_delete);
		}
	});

	jQuery("#outarea_hh").text ("*** end *** jquery_csharp_delete.js ***");
});

// -----------------------------------------------------------------------
