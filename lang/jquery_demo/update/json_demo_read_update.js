// -----------------------------------------------------------------------
//	json_demo_read_update.js
//
//					Apr/25/2011
//
// -----------------------------------------------------------------------
function json_demo_read_proc (url_json,data_send)
{
	jQuery("#outarea_dd").text ("url_json = " + url_json);

	var str_aaa = "";
	var icount = 0;

	jQuery.getJSON(url_json,function (data_json)
		{
		var out_string = table_gen_proc (data_json);

		jQuery("#result_aa").html (out_string);

		change_monitor (data_send,str_aaa);
		});
}

// -----------------------------------------------------------------------
