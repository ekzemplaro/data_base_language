// -----------------------------------------------------------------------
//	update/jquery_demo_update.js
//
//					Oct/18/2012
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_json;
	var url_update;
	var str_aaa = "";

	var data_send = new Array ();

	jQuery("#outarea_aa").text ("*** start *** jquery_demo_update.js ***");

	jQuery ("button").click (function ()
	{
	jQuery("#outarea_cc").text (this.id);
	jQuery ("button").css ("color","black");
	jQuery ("button#" + this.id).css ("color","blue");

	var dbase = this.id;
	jQuery("#outarea_ff").text ("*** " + dbase + " ***");

	if (dbase !== "update")
		{
		var url_json = define_json_file_proc (dbase);

		json_demo_read_proc (url_json,data_send); 		
		}
	else
		{
		send_display_proc (data_send);
		}

	});


	jQuery("#outarea_hh").text ("*** end *** jquery_demo_update.js ***");
});

// -----------------------------------------------------------------------
