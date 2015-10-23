// -----------------------------------------------------------------------
//	show_data_base.js
//
//					Aug/08/2013
// -----------------------------------------------------------------------
function show_data_base_proc (data_json)
{
	var str_navb = "<ol>";

	for (var dbase in data_json.info)
		{
		if (dbase !== "Code")
			{
		str_navb += "<li><button class=\"dbase\" id=\"";
		str_navb += dbase + "\">";
		str_navb += dbase + "</button></li>";
			}
		}

	str_navb += "</ol>";

	return	str_navb;
}

// -----------------------------------------------------------------------
