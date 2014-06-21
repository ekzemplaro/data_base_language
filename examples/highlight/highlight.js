// -----------------------------------------------------------------------
//
//	highlight.js
//
//					Nov/18/2015
// -----------------------------------------------------------------------
jQuery (function()
{
	var file_json = './tochigi.json';

	jQuery.getJSON (file_json,function (data_aa)
		{
		var out_str = table_gen_execute_proc (data_aa);

		jQuery ("#sample").html (out_str);

		highlight_monitor ();
		});
});

// -----------------------------------------------------------------------
function table_gen_execute_proc (data_aa)
{
	var out_str = "<table id='table_aa'>";
	out_str += "<tr><th>key</th>";
	out_str += "<th>name</th>";
	out_str += "<th>population</th>";
	out_str += "<th>date_mod</th>";
	out_str += "</tr>";

	for (var it in data_aa)
		{
		var row_in = data_aa[it];
		out_str += "<tr><td>";
		out_str +=  it + "</td><td>";
		out_str +=  row_in.name + "</td><td>";
		out_str +=  row_in.population + "</td><td>";
		out_str +=  row_in.date_mod + "</td>";
		out_str += "</tr>";
		}

	return	out_str;
}

// -----------------------------------------------------------------------
