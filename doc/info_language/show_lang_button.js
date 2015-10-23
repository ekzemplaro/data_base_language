// -----------------------------------------------------------------------
//	show_lang_button.js
//
//					Nov/02/2011
// -----------------------------------------------------------------------
// [4]:
function show_lang_button_proc (dbase)
{
	var out_str = "<ol>";

	for (var lang in dbase)
		{
		if (lang !== "jQuery")
			{
			if (lang === "F#")
				{
				lang = "Fsharp";
				}
			else if (lang === "C#")
				{
				lang = "Csharp";
				}

			out_str += "<li>";
			out_str += "<button class=\"lang\" id=\"" + lang + "\">"
				+ lang + "</button></li>";
			}
		}

	out_str += "</ol>";

	return out_str;
}

// -----------------------------------------------------------------------
