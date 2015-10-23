// -----------------------------------------------------------------------
//	show_data_base_button.js
//
//					Jul/19/2012
// -----------------------------------------------------------------------
// [4]:
function show_data_base_button_proc (info)
{
	var out_str = "<ol>";

	for (var dbx in info)
		{
		data_base = dbase_translate_proc (dbx);
		out_str += result_out_proc (data_base);
		}
		out_str += "</ol>";

	jQuery("#outarea_hh").html ("hhhh<br />");

	return out_str;
}


// -----------------------------------------------------------------------
// [4-8]:
function result_out_proc (data_base)
{
	var out_str = "<li>";
	out_str += "<button class=\"data_base\" id=\"" + data_base + "\">"
		+ data_base + "</button></li>";

	return	out_str;
}

// -----------------------------------------------------------------------
