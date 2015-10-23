// -----------------------------------------------------------------------
//	sharp_convert.js
//
//					Dec/19/2012
// -----------------------------------------------------------------------
// [2]:
function sharp_convert_proc (dbase_in)
{
	var dbase_new = new Object ();

	for (var lang in dbase_in)
		{
		if (lang == "F#")
			{
			dbase_new["Fsharp"] = dbase_in[lang];
			}
		else if (lang == "C#")
			{
			dbase_new["Csharp"] = dbase_in[lang];
			}
		else
			{
			dbase_new[lang] = dbase_in[lang];
			}
		}

	return	dbase_new;
}

// -----------------------------------------------------------------------
