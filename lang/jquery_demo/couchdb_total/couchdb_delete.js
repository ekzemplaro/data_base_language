// -----------------------------------------------------------------------
//	couchdb_delete.js
//
//					Sep/05/2011
// -----------------------------------------------------------------------
// [6]:
function couchdb_delete_proc (data_json,data_send)
{
	var pref = data_json["_id"];

	var tmp_str = "*** couchdb_delete_proc *** data_send.length = " + data_send.length;
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

		var id_population = "population_" + index;
		jQuery("#" + id_population).text ("-----").css ({color: "green"});

		var id_date_mod = "date_mod_" + index;
		jQuery("#" + id_date_mod).text ("-----").css ({color: "green"});
		}

	tmp_str += delete_send_data_display_proc (data_send);

	tmp_str += contents_table_gen_proc_exec (0,data_json);
	jQuery("#outarea_hh").html (tmp_str);

	var url_post = "./couchdb_update.php";

	var index_mode = 3;
	send_exec_proc_json (index_mode,url_post,data_json);

}

// -----------------------------------------------------------------------
// [6-4]:
function delete_send_data_display_proc (data_send)
{
	var tmp_str = "<table>"

	for (var id in data_send)
		{
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

		tmp_str += data_send[id];

		tmp_str += "</td></tr>";
		}

	tmp_str += "</table>";

	return	tmp_str;
}

// -----------------------------------------------------------------------
