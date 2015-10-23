// -----------------------------------------------------------------------
//	coudhdb_initialaize.js
//
//					Aug/30/2011
// -----------------------------------------------------------------------
// [6]:
function couchdb_initialize_proc (data_json)
{
	var tmp_str = "couchdb_initialize_proc ***<br />";

	jQuery("#outarea_ff").html (tmp_str);

	var pref = data_json["_id"];
	var rev = data_json["_rev"];

	tmp_str += pref + "<br />";

	tmp_str += contents_table_gen_proc_exec (0,data_json);

	jQuery("#outarea_gg").html (tmp_str);


	var url_json = "http://localhost:5984/city_backup/" + pref;

	url_json += "?callback=?";

	jQuery.getJSON (url_json,function (data_json)
		{
		var out_str = contents_table_gen_proc_exec (0,data_json);
		jQuery("#outarea_hh").html (out_str);

		data_json["_id"] = pref;
		data_json["_rev"] = rev;

		var url_post = "./couchdb_update.php";

		send_exec_proc_json (url_post,data_json);
		});





}

// -----------------------------------------------------------------------


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
