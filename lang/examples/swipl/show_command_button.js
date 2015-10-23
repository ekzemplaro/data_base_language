// -----------------------------------------------------------------------
//	show_command_button.js
//
//					Oct/21/2015
// -----------------------------------------------------------------------
// [4]:
function show_command_button_proc (dbase)
{
	var out_str = "<ol>";

	for (var it in dbase)
		{
		var command = dbase[it].replace(".txt","");
		out_str += "<li>";
		out_str += "<button class=\"command\" id=\"" + command + "\">"
				+ command + "</button></li>";
		}

	out_str += "</ol>";

	return out_str;
}

// -----------------------------------------------------------------------
