// -----------------------------------------------------------------------
//	couchdb_update.js
//
//					Oct/30/2014
// -----------------------------------------------------------------------
// [6]:
function couchdb_update_proc (data_json)
{
	var tmp_str = "*** outarea_ff couchdb_update_proc *** start ***<br />";
	tmp_str += "<br />";
	jQuery("#outarea_ff").html (tmp_str);

	tmp_str = "_id = " + data_json["_id"] + "<br />";
	tmp_str += "_rev = " +  data_json["_rev"] + "<br />";

	var key = data_json["_id"];

//	tmp_str += contents_table_gen_proc_exec (0,data_json);
//	jQuery("#outarea_aa").html (tmp_str);

//	var url_post = "./couchdb_update.php";
	var url_post = "./couchdb_update.py";

	var url_couchdb="http://localhost:5984";

	var url_key = url_couchdb + "/city/" + key;

	send_exec_proc_json (0,url_post,url_key,data_json);
}

// -----------------------------------------------------------------------
// [6-4]:
function send_exec_proc_json (index_mode,url_post,url_key,data_json)
{
	var pref = data_json["_id"];

	var str_json = JSON.stringify (data_json);

	jQuery.post (url_post,{url_key: url_key,my_data: str_json},
		function (data_receive,text_status)
		{
		var out_str =  "*** outarea_hh <br />";
		out_str +=  "data_receive :" + data_receive + "<br />";
		out_str += "text_status : " + text_status + "<br />"
		out_str += "this.url : " + this.url + "<br />";

		out_str += "*** data_receive = " + data_receive + "<p />";

//		var obj = JSON.parse (data_receive);

		for (var it in data_receive.message)
			{ 
		out_str += "message: " + data_receive.message[it] + "<br />";
			}
/*
		out_str += "obj.ok = " + obj.ok + "<br />";
		out_str += "obj.id = " + obj.id + "<br />";
		out_str += "obj.rev = " + obj.rev + "<br />";

		out_str += "data_json._rev = " + data_json._rev + "<br />";

		data_json["_rev"] = obj.rev;

		out_str += "data_json._rev = " + data_json._rev + "<br />";
*/
		jQuery("#outarea_hh").html (out_str);

/*
		if (index_mode === 3)
			{
			out_str = contents_table_gen_proc
					(pref,index_mode,data_json);
			jQuery (".contents").html (out_str);
			}
*/
		});
}

// -----------------------------------------------------------------------
