// -----------------------------------------------------------------------
//	update/jquery_php_update.js
//
//					Oct/18/2012
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_json;
	var url_update;

	var data_send = new Array ();

	jQuery("#outarea_aa").text ("*** start *** jquery_php_update.js ***");

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
		url_json = "../read/" + dbase + "_php_read.php";
		url_update = dbase + "_php_update.php";

		jQuery("#outarea_dd").text ("url_json = " + url_json);
		jQuery("#outarea_ee").text ("url_update = " + url_update);

		table_manipulate (url_json,data_send);
		}
	else
		{
		send_exec_proc (url_update,data_send);
		}
	});


	jQuery("#outarea_hh").text ("*** end *** jquery_php_update.js ***");
});

// -----------------------------------------------------------------------
