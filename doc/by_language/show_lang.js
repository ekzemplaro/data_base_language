// -----------------------------------------------------------------------
//	show_lang.js
//
//					Dec/12/2012
// -----------------------------------------------------------------------
// [4]:
function show_lang_proc (dbase)
{
	var lang = "common";

	var out_str = "<button class=\"lang\" id=\"" + lang + "\">"
		+ lang + "</button><p />";

	out_str += "<ol>";

	for (var lang in dbase)
		{
		if (lang !== "jQuery")
			{
			out_str += "<li>";
			out_str += "<button class=\"lang\" id=\"" + lang + "\">"
				+ lang + "</button></li>";
			}
		}

	out_str += "</ol>";

	return out_str;
}


// -----------------------------------------------------------------------
