// -----------------------------------------------------------------------
//	couchdb_update.js
//
//					Aug/30/2011
// -----------------------------------------------------------------------
// [6]:
function couchdb_update_proc (data_json)
{
	var tmp_str = "couchdb_update_proc ***<br />";
	tmp_str += "<br />";
	jQuery("#outarea_ff").html (tmp_str);

	tmp_str = "_id = " + data_json["_id"] + "<br />";
	tmp_str += "_rev = " +  data_json["_rev"] + "<br />";

	var key = data_json["_id"];

	tmp_str += contents_table_gen_proc_exec (0,data_json);
	jQuery("#outarea_aa").html (tmp_str);

	var url_post = "./couchdb_update.php";

	send_exec_proc_json (url_post,data_json);
}

// -----------------------------------------------------------------------
// [6-4]:
function display_send_data_proc (data_send)
{
	var tmp_str = "<table>"

	for (var id in data_send)
		{
//		var array = data_send[it].id.split ("_");
		var array = id.split ("_");

		if (array.length === 2)
			{
			var index = array[1];
			var place = array[0];
			}
		else
			{
			var index = array[2];
			var place = array[0] + "_" + array[1];
			}

		tmp_str += "<tr><td>" + id;
		tmp_str += "</td><td>" + index;
		tmp_str += "</td><td>" + place;
		tmp_str += "</td><td>";

		if (jQuery.isPlainObject (data_send[id]))
			{
			tmp_str += data_send[id]["population"];
			}
		else
			{
			tmp_str += data_send[id];
			}
		tmp_str += "</td></tr>";
		}

	tmp_str += "</table>";

	return	tmp_str;
}

// -----------------------------------------------------------------------
// [6-4-8]:
function send_exec_proc_json (url_post,data_json)
{
	var str_json = jQuery.toJSON (data_json);
	jQuery.post (url_post,{my_data: str_json},
		function (data_receive,text_status)
		{
		var out_str =  "data_receive :" + data_receive + "<br />";
		out_str += "text_status : " + text_status + "<br />"
		out_str += "this.url : " + this.url + "<br />";

		out_str += "*** data_receive = " + data_receive + "<p />";
//		jQuery("#outarea_hh").html (out_str);


var index_mode = 0;
var key = data_json["_id"];
out_str = contents_table_gen_proc (key,index_mode,data_json);

	jQuery (".contents").html (out_str);

		});
}

// -----------------------------------------------------------------------
