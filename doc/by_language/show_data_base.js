// -----------------------------------------------------------------------
//	show_data_base.js
//
//					Nov/11/2013
// -----------------------------------------------------------------------
function show_data_base_proc (lang,data_json)
{
	var dbase_lang = data_json.dbase[lang];
//	jQuery("#outarea_cc").text (lang);

	var dbase_all = get_dbase_proc (lang,data_json);

//	jQuery("#outarea_dd").text (dbase_all);

	for (var it in dbase_all)
		{
		dbase_all[it] = dbase_translate_proc (dbase_all[it]);
		}

	var str_navb = lang + "<p />";
//	var str_navb = "<p />";

	for (it=0; it< dbase_all.length; it++)
		{
		str_navb += "<button class=\"dbase\" id=\"";
		str_navb += dbase_all[it] + "\">";
		str_navb += dbase_all[it] + "</button><br />";
		}

	jQuery(".navb").html (str_navb);
}

// -----------------------------------------------------------------------
// [4]:
function get_dbase_proc (lang,data_json)
{
	var dbase_all = new Array ();
	var dbase_lang = data_json.dbase[lang];

	for (dbx in data_json.info)
		{
		if (dbx != "Code")
			{
			for (var crud in dbase_lang)
				{
				dbase_all = data_count_proc
					(dbx,dbase_all,dbase_lang[crud][dbx]);
				}
			}
		}

//	jQuery("#outarea_gg").text ("nn_all = " + dbase_all.length);

	return	dbase_all;
}

// -----------------------------------------------------------------------
// [4-6]:
function data_count_proc (dbx,dbase_exist,value_in)
{
	if (crud_exist_check_proc_hantei (value_in))
		{
		if (dbase_exist.indexOf (dbx) < 0)
			{
			var nn = dbase_exist.length;
			dbase_exist[nn] = dbx;
			}
		}

	return	dbase_exist;
}

// -----------------------------------------------------------------------
