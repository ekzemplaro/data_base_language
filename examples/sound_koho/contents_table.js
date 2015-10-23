// -----------------------------------------------------------------------
//	contents_table.js
//
//					Dec/21/2011
// -----------------------------------------------------------------------
function contents_table_gen_proc (key,index_mode,data_json)
{
	var labels = new Array ("閲覧","編集");
	var out_str = "<h2>" + labels[parseInt (index_mode)] + "</h2>";

	out_str += "<b>" + key + "</b>";

	out_str += contents_table_gen_proc_exec (index_mode,data_json);

	if (index_mode !== 0)
		{
		out_str += "<button class=\"execute\"  id=\"execute\">";
		out_str += "実行</button>";
		}

	return	(out_str);
}

// -----------------------------------------------------------------------
// [6]:
function contents_table_gen_proc_exec (index_mode,data_json)
{
	var out_str = "<table id='table_aa'>";
	out_str += "<tr><th>コード</th>";
	out_str += "<th>区市町村名</th>";
	out_str += "<th>視覚広報</th>";
	out_str += "<th>音声広報</th>";
	out_str += "<th>URL</th>";
	out_str += "<tr>";

	var nnx = data_json.length;
	var tmp_str = "nnx = " + nnx + " " + index_mode + "<br />";

	jQuery ("#outarea_dd").html (tmp_str);

	switch (index_mode)
		{
		case	1:
			out_str += edit_table_gen_proc (data_json);
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
// [6-8]:
function browse_table_gen_proc (data_json)
{
	var out_str = "";

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
	out_str +=  row_in.name + "</td>";

	out_str +=  select_display_proc (row_in.paper);
	out_str +=  select_display_proc (row_in.sound);

	out_str +=  "<td>";
	out_str +=  row_in.url_city + "</td>";
	out_str += "</tr>";

	return	out_str;
}

// -----------------------------------------------------------------------
// [6-2-4]:
function select_display_proc (value)
{
	var ivv = parseInt (value);

	var out_str = "<td";

	if (ivv === 1)
		{	
//		out_str += "color=\"green\">有";
		out_str += " class=\"green\">有";
//		out_str += ">有";
		}
	else if (ivv === 0)
		{	
		out_str += ">-";
		}
	else if (ivv === -1)
		{	
		out_str += ">無";
		}

	out_str += "</td>";

	return	out_str;
}

// -----------------------------------------------------------------------
// [6-2-4]:
function gen_row_edit_proc (it,row_in)
{
	var id_paper = "paper_" + it;
	var id_sound = "sound_" + it;
	var id_url_city = "url_city_" + it;

	var out_str = "<tr><td>";
	out_str += it + "</td><td>";
	out_str += row_in.name;
	out_str += "</td>";

	out_str += select_gen_proc (id_paper,row_in.paper);
	out_str += select_gen_proc (id_sound,row_in.sound);

	var vvx = row_in.url_city;

	if (vvx.length === 0)
		{
		vvx = "-";
		}

	out_str += "<td>";
	out_str += "<input type='text' value=" + vvx;
	out_str += " id=" + id_url_city;
	out_str += " /></td>";
	out_str += "</tr>";

	return	out_str;
}

// -----------------------------------------------------------------------
// [6-2-4]:
function select_gen_proc (idx,value)
{
	var out_str = "<td>";
	out_str += "<select id = \"" + idx + "\">";

	var ivv = parseInt (value);

	if (ivv === 1)
		{	
		out_str += "<option value = \"1\" selected>有</option>";
		out_str += "<option value = \"0\">-</option>";
		out_str += "<option value = \"-1\">無</option>";
		}
	else if (ivv === 0)
		{	
		out_str += "<option value = \"1\">有</option>";
		out_str += "<option value = \"0\" selected>-</option>";
		out_str += "<option value = \"-1\">無</option>";
		}
	else if (ivv === -1)
		{	
		out_str += "<option value = \"1\">有</option>";
		out_str += "<option value = \"0\">-</option>";
		out_str += "<option value = \"-1\" selected>無</option>";
		}

	out_str += "</select>";
	out_str += "</td>";

	return	out_str;
}

// -----------------------------------------------------------------------
