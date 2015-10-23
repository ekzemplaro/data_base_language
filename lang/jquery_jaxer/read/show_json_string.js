// -----------------------------------------------------------------------
//	show_json_string.js
//
//					Jun/09/2010
// -----------------------------------------------------------------------
function show_json_string_bb (json_str_in)
{
	var data_json = eval ("(" + json_str_in + ")");

	var out_str = "<table border=\"1\">";
	out_str += "</table>";

	jQuery("#result_aa").html (out_str);
//	jQuery("#result_aa").text (json_str_in);
}
// -----------------------------------------------------------------------
function show_json_string (json_str_in)
{
	var data_json = eval ("(" + json_str_in + ")");

	var out_str = "<table border=\"1\">";

	for (var it=0; it < data_json.cities.length; it++)
			{
			var city = data_json.cities[it];
			out_str += "<tr><td>" + city.id;
			out_str += "</td><td>" + city.name;
			out_str += "</td><td>" + city.population;
			out_str += "</td><td>" + city.date_mod;
			out_str += "</td></tr>";
			}

	out_str += "</table>";

	jQuery("#result_aa").html (out_str);
//	jQuery("#outarea_gg").text (out_str);
}

// -----------------------------------------------------------------------
