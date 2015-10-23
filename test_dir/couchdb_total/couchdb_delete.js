// -----------------------------------------------------------------------
//	couchdb_delete.js
//
//					Aug/30/2011
// -----------------------------------------------------------------------
// [6]:
function couchdb_delete_proc (data_json,data_send)
{
	var tmp_str = "couchdb_delete_proc *** data_send.length = " + data_send.length;
	tmp_str += "<br />";

	for (var id in data_send)
		{
		tmp_str += id + " : ";  
		tmp_str += data_send[id] + "<br />";  
		}

	jQuery("#outarea_ff").html (tmp_str);

	tmp_str = "_id = " + data_json["_id"] + "<br />";
	tmp_str += "_rev = " +  data_json["_rev"] + "<br />";

	var key = data_json["_id"];

	data_send.sort ();

	for (var id in data_send)
		{
		var array = id.split ("_");

		var index = array[1];
		var place = array[0];

		if (data_send[id])
			{
			delete data_json[index];
			}
		}

	tmp_str += display_send_data_proc (data_send);

	tmp_str += contents_table_gen_proc_exec (0,data_json);
	jQuery("#outarea_hh").html (tmp_str);

	var url_post = "./couchdb_update.php";

	send_exec_proc_json (url_post,data_json);
}

// -----------------------------------------------------------------------
