// -----------------------------------------------------------------------
//	contents_table.js
//
//					Oct/30/2014
// -----------------------------------------------------------------------
function contents_table_gen_proc (key,index_mode,data_json)
{
	var labels = new Array ("閲覧","編集","追加","削除","初期化");
	var out_str = "<h2>" + labels[parseInt (index_mode)] + "</h2>";

	out_str += "<b>" + key + "</b>";

	if (index_mode !== 0)
		{
		out_str += "<div class=\"right\">";
		out_str += "<button class=\"execute\"  id=\"execute\">";
		out_str += "実行</button>";
		out_str += "</div>";
		out_str += "<p />";
		}

	out_str += contents_table_gen_proc_exec (index_mode,data_json);

	if (index_mode !== 0)
		{
		out_str += "<button class=\"execute\"  id=\"execute\">";
		out_str += "実行</button>";
		out_str += "<p />";
		}

var tmp_str = "*** browse_table_gen_proc aaa ***";
jQuery ("#outarea_ee").text (tmp_str);

	return	(out_str);
}

// -----------------------------------------------------------------------
// [6]:
function contents_table_gen_proc_exec (index_mode,data_json)
{
	var out_str = "<table id='table_aa'>";
	out_str += "<tr><th>key</th>";
	out_str += "<th>name</th>";
	out_str += "<th>population</th>";
	out_str += "<th>date_mod</th>";
	out_str += "<tr>";

	var nnx = data_json.length;
	var tmp_str = "nnx = " + nnx + " " + index_mode + "<br />";

	jQuery ("#outarea_dd").html (tmp_str);

	switch (index_mode)
		{
		case	1:
			out_str += edit_table_gen_proc (data_json);
			break;

		case	2:
			out_str += append_table_gen_proc (data_json);
			break;

		case	3:
			out_str += delete_table_gen_proc (data_json);
			break;

		default:
			out_str += browse_table_gen_proc (data_json);
			break;
		}

		out_str += "</table>";
		out_str += "<p />";

	return out_str;
}

// -----------------------------------------------------------------------
// [6-2]:
function edit_table_gen_proc (data_json)
{
	var out_str = "";

	var keylist = get_sorted_key_proc (data_json);

	for (var it in keylist)
		{
		var key = keylist[it];

		out_str += gen_row_edit_proc (key,data_json[key])
		}

	return (out_str);
}

// -----------------------------------------------------------------------
// [6-4]:
function append_table_gen_proc (data_json)
{
	var out_str = "";

	var keylist = get_sorted_key_proc (data_json);

	var id_last;

	for (var it in keylist)
		{
		var key = keylist[it];

		id_last = key; 
		out_str += gen_row_browse_proc (key,data_json[key])
		}

	var nn_tmp = 1 + parseInt (id_last.slice(3));
	var index = id_last.substring (0,3) + nn_tmp;
	today = get_current_date_proc ();
	data_json[index] = {"name": "A---","population": 0,"date_mod": today};
	out_str += gen_row_append_proc (index,data_json[index]);

	return (out_str);
}

// -----------------------------------------------------------------------
// [6-6]:
function delete_table_gen_proc (data_json)
{
	var out_str = "";

	var keylist = get_sorted_key_proc (data_json);

	for (var it in keylist)
		{
		var key = keylist[it];

		out_str += gen_row_delete_proc (key,data_json[key])
		}

	return (out_str);
}

// -----------------------------------------------------------------------
// [6-8]:
function browse_table_gen_proc (data_json)
{
	var out_str = "";

	var keylist = get_sorted_key_proc (data_json);

	for (var it in keylist)
		{
		var key = keylist[it];
		out_str += gen_row_browse_proc (key,data_json[key]);
		}

	return (out_str);
}

// -----------------------------------------------------------------------
// [6-8-4]:
function get_sorted_key_proc (data_json)
{
	var keylist=new Array ();

	for(var key in data_json)
		{
		if ((key !== "_id") && (key !== "_rev"))
			{ 
 			keylist.push(key);
			}
		}

	keylist.sort();

	return	(keylist);
}

// -----------------------------------------------------------------------
// [6-8-8]:
function gen_row_browse_proc (key,row_in)
{
	var out_str = "<tr><td>";
	out_str +=  key + "</td><td>";
	out_str +=  row_in.name + "</td><td>";
	out_str +=  row_in.population + "</td><td>";
	out_str +=  row_in.date_mod + "</td>";
	out_str += "</tr>";

	return	out_str;
}

// -----------------------------------------------------------------------
function gen_row_edit_proc (key,row_in)
{
	var id_population = "population_" + key;
	var id_date_mod = "date_mod_" + key;

	var out_str = "<tr><td>";
	out_str += key + "</td><td>";
	out_str += row_in.name;
	out_str += "</td><td>";
	out_str += "<input size='10' type='text' value=" + row_in.population;
	out_str += " id=" + id_population;
	out_str += " /></td><td id=" + id_date_mod;
	out_str += ">";
	out_str += row_in.date_mod;
	out_str += "</td></tr>";

	return	out_str;
}

// -----------------------------------------------------------------------
function gen_row_append_proc (index,row_in)
{
	var id_name = "name_" + index;
	var id_population = "population_" + index;

	var out_str = "<tr><td>";
	out_str +=  index + "</td><td>";
	out_str += "<input size='10' type='text' value=" + row_in.name;
	out_str += " id=" + id_name;
	out_str +=  "></td><td>";
	out_str += "<input size='10' type='text' value=" + row_in.population;
	out_str += " id=" + id_population;
	out_str +=  " /></td><td>";
	out_str += row_in.date_mod;
	out_str += "</td></tr>";

	return	out_str;
}

// -----------------------------------------------------------------------
function gen_row_delete_proc (index,row_in)
{
	var id_delete = "delete_" + index;
	var id_population = "population_" + index;
	var id_date_mod = "date_mod_" + index;

	var out_str = "<tr><td>";
	out_str +=  index + "</td><td>";
	out_str += row_in.name;
	out_str +=  "</td>";
	out_str +=  "<td id =" + id_population + ">";
	out_str += row_in.population;
	out_str +=  "</td>";
	out_str +=  "<td id =" + id_date_mod + ">";
	out_str += row_in.date_mod;
	out_str +=  "</td><td>";
	out_str += "<input type=\"checkbox\" ";
	out_str += "id=" + id_delete + "></td>";
	out_str += "</tr>";

	return	out_str;
}

// -----------------------------------------------------------------------
