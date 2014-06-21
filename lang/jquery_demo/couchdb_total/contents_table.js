// -----------------------------------------------------------------------
//	contents_table.js
//
//					Jun/29/2012
// -----------------------------------------------------------------------
function contents_table_gen_proc (key,index_mode,data_json)
{
	var labels = new Array ("閲覧","編集","追加","削除","初期化");
	var out_str = "<h2>" + labels[parseInt (index_mode)] + "</h2>";

	out_str += "<b>" + key + "</b>";

	out_str += contents_table_gen_proc_exec (index_mode,data_json);

	if (index_mode !== 0)
		{
		out_str += "<button class=\"execute\"  id=\"execute\">";
		out_str += "実行</button>";
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

	for (var it in data_json)
		{
		if ((it !== "_id") && (it !== "_rev"))
			{ 
			out_str += gen_row_edit_proc (it,data_json[it])
			}
		}

	return (out_str);
}

// -----------------------------------------------------------------------
// [6-4]:
function append_table_gen_proc (data_json)
{
	var out_str = "";

	var id_last;
	for (var id in data_json)
		{
		if ((id !== "_id") && (id !== "_rev"))
			{
			id_last = id; 
			out_str += gen_row_browse_proc (id,data_json[id])
			}
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

	for (var it in data_json)
		{
		if ((it !== "_id") && (it !== "_rev"))
			{ 
			out_str += gen_row_delete_proc (it,data_json[it])
			}
		}

	return (out_str);
}

// -----------------------------------------------------------------------
// [6-8]:
function browse_table_gen_proc (data_json)
{
	var out_str = "";


	var tmp_str = "*** browse_table_gen_proc  ***";
	jQuery ("#outarea_dd").text (tmp_str);

	for (var it in data_json)
		{
		if ((it !== "_id") && (it !== "_rev"))
			{ 
			out_str += gen_row_browse_proc (it,data_json[it])
			}
		}

	return (out_str);
}

// -----------------------------------------------------------------------
function gen_row_browse_proc (it,row_in)
{
	var out_str = "<tr><td>";
	out_str +=  it + "</td><td>";
	out_str +=  row_in.name + "</td><td>";
	out_str +=  row_in.population + "</td><td>";
	out_str +=  row_in.date_mod + "</td>";
	out_str += "</tr>";

	return	out_str;
}

// -----------------------------------------------------------------------
function gen_row_edit_proc (it,row_in)
{
	var id_population = "population_" + it;
	var id_date_mod = "date_mod_" + it;

	var out_str = "<tr><td>";
	out_str += it + "</td><td>";
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
