// -----------------------------------------------------------------------
//	show_lang.js
//
//					Jul/16/2012
// -----------------------------------------------------------------------
// [4]:
function show_lang_proc (dbase)
{
	var out_str = "<ol>";

	for (var lang in dbase)
		{
		if (lang !== "jQuery")
			{
		out_str += result_out_proc (lang);
			}
		}

		out_str += "</ol>";

	return out_str;
}


// -----------------------------------------------------------------------
// [4-8]:
function result_out_proc (language)
{
	var out_str = "<li>";
	out_str += "<button class=\"lang\" id=\"" + language + "\">"
		+ language + "</button></li>";

	return	out_str;
}

// -----------------------------------------------------------------------
