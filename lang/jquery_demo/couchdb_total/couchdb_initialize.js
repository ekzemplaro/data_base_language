// -----------------------------------------------------------------------
//	coudhdb_initialaize.js
//
//					Jun/29/2012
// -----------------------------------------------------------------------
// [6]:
function couchdb_initialize_proc (url_couchdb,data_json)
{
	var tmp_str = "couchdb_initialize_proc ***<br />";

	jQuery("#outarea_ff").html (tmp_str);

	var pref = data_json["_id"];
	var rev = data_json["_rev"];

	var url_json = url_couchdb + "city_backup/" + pref;

	jQuery.getJSON (url_json,function (data_json)
		{
		var out_str = contents_table_gen_proc_exec (0,data_json);
		jQuery("#outarea_hh").html (out_str);

		data_json["_id"] = pref;
		data_json["_rev"] = rev;

		var url_post = "./couchdb_update.php";

		send_exec_proc_json (4,url_post,data_json);

		var index_mode = 0;
		out_str = contents_table_gen_proc (pref,index_mode,data_json);
		jQuery (".contents").html (out_str);
		});

}

// -----------------------------------------------------------------------
