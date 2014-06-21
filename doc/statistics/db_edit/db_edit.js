// -----------------------------------------------------------------------
//	db_edit.js
//
//					Apr/21/2014
// -----------------------------------------------------------------------
jQuery (function ()
{
	var fname_json = "../data/sheet_bb.json";

	jQuery.getJSON (fname_json,function (data_json)
		{
		data_json.dbase = sharp_convert_proc (data_json.dbase);
		edit_proc01 (data_json,fname_json);
		});
});

// -----------------------------------------------------------------------
// [4]:
function edit_proc01 (data_json,fname_json)
{
	var out_str = show_lang_proc (data_json.dbase);
	jQuery(".nava").html (out_str);
	var lang = "";
	var dbase = "";

	var str_dbase = show_data_base_proc (data_json);
	jQuery(".navb").html (str_dbase);

	jQuery ("button.lang").click (function ()
		{
		lang = this.id;
		jQuery ("button.lang").css ("color","black");
		jQuery ("button#" + this.id).css ("color","blue");
		jQuery("#outarea_cc").text (lang);
		jQuery("#lang").text (lang);
		var index_mode = jQuery ("#mode").get(0).selectedIndex;
		data_display_proc (index_mode,lang,dbase,data_json,fname_json);
		});

	jQuery ("button.dbase").click (function ()
		{
		dbase = this.id;
		jQuery ("button.dbase").css ("color","black");
		jQuery ("button#" + this.id).css ("color","blue");
		jQuery("#outarea_dd").text (dbase);
		jQuery("#dbase").text (dbase);
		var index_mode = jQuery ("#mode").get(0).selectedIndex;
		data_display_proc (index_mode,lang,dbase,data_json,fname_json);
		});
}

// -----------------------------------------------------------------------
// [4-4]:
function data_display_proc (index_mode,lang,dbase,data_json,file_json)
{
	var str_out = str_head_gen_proc (index_mode,lang,dbase);

	if ((0 < lang.length) && (0 < dbase.length))
		{
		switch (index_mode)
			{
			case 0:
				str_out += data_fetch_proc_browse
					(lang,dbase,data_json);
				jQuery(".contents").html (str_out);
				break;

			case 1:
				edit_mode_proc
				(lang,dbase,data_json,str_out,file_json);
				break;

			case 2:
				str_out += data_fetch_proc_browse
						(lang,dbase,data_json);
			str_out += "<button class=\"execute\"  id=\"execute\">";
			str_out += "実行</button>";

				jQuery(".contents").html (str_out);
				all_ok_proc (lang,dbase,data_json,file_json,8);
				break;

			case 3:
				str_out += data_fetch_proc_browse
						(lang,dbase,data_json);
			str_out += "<button class=\"execute\"  id=\"execute\">";
			str_out += "実行</button>";

				jQuery(".contents").html (str_out);
				all_ok_proc (lang,dbase,data_json,file_json,4);
				break;

			}
		}
}

// -----------------------------------------------------------------------
function str_head_gen_proc (index_mode,lang,dbase)
{
	var str_out = "";

	str_out += "index_mode = " + index_mode + "<br />";
	str_out += "lang = " + lang + "<br />";
	str_out += "dbase = " + dbase + "<br />";

	return	str_out;
}

// -----------------------------------------------------------------------
function all_ok_proc (lang_in,dbase_in,data_json,file_json,nn_limit)
{
	var ids_input = new Array ();

	var icount = 0;
	for (var crud in data_json.dbase[lang_in])
		{
		if (crud != "year")
			{
			ids_input.push (crud);
			icount += 1;
			}

		if (nn_limit <= icount)
			break; 
		}

	jQuery ("button.execute").click (function ()
		{
		for (var it in ids_input)
			{
			var id = ids_input[it];

			var status_ok = "8";
			data_json.dbase[lang_in][id][dbase_in] = status_ok;
			}

		var str_out = str_head_gen_proc (2,lang_in,dbase_in);
		str_out += data_fetch_proc_browse (lang_in,dbase_in,data_json);
		jQuery(".contents").html (str_out);

		date_created_proc (data_json);
		file_save_proc (file_json,data_json);
		});
}

// -----------------------------------------------------------------------
// [4-4-6]:
function edit_mode_proc (lang,dbase,data_json,str_out,file_json)
{
	var ids_input = new Array ();
	str_out += data_fetch_proc_edit (lang,dbase,data_json,ids_input);
	jQuery(".contents").html (str_out);

	jQuery ("button.execute").click (function ()
		{
		update_proc (ids_input,lang,dbase,data_json);

		file_save_proc (file_json,data_json);
		});
}

// -----------------------------------------------------------------------
// [4-4-10]:
function update_proc (ids_input,lang,db_in,data_json)
{
	var str_tmp = "*** pushed ***<br />";
	str_tmp += lang + "<br />";
	str_tmp += db_in + "<br />";

	for (var it in ids_input)
		{
		var id = ids_input[it];
		var value = jQuery ("#" + id).val ();

		str_tmp += "id = " + id + " -- " + value +  "<br />";

		data_json.dbase[lang][id][db_in] = value;
		}

	date_created_proc (data_json);

	jQuery("#outarea_aa").html (str_tmp);
}

// -----------------------------------------------------------------------
// [4-4-10-6]:
function date_created_proc (data_json)
{
	var today = new Date ();
	var ddx = (1900 + today.getYear ()) + "-" + (today.getMonth () +1);
	ddx += "-" + today.getDate ();

	data_json.date_created = ddx;
}

// -----------------------------------------------------------------------
// [4-4-6]:
function data_fetch_proc_edit (lang_in,dbase_in,data_json,ids_input)
{
	var str_out = "<table>";

	for (var crud in data_json.dbase[lang_in])
		{
		var idx = crud;
	 	str_out += "<tr>";
		if (crud != "year")
			{
			ids_input.push (idx);
			str_out += "<td>" + crud + "</td>";
			str_out += " <td>";
			str_out += "<input size='6' type='text' value='"
 + data_json.dbase[lang_in][crud][dbase_in] + "'"
	+ " id=" + idx + " />" + "</td> ";
			}
	 	str_out += "</tr>";
		}

	str_out += "</table>";

	str_out += "<button class=\"execute\"  id=\"execute\">";
	str_out += "実行</button>";

	return	str_out;
}

// -----------------------------------------------------------------------
// [4-4-8]:
function data_fetch_proc_browse (lang,dbase,data_json)
{
	var str_out = "<table>";

	for (var crud in data_json.dbase[lang])
		{
	 	str_out += "<tr>";
		if (crud != "year")
			{
			str_out += "<td>" + crud + "</td>";
			str_out += " <td>" + data_json.dbase[lang][crud][dbase] + "</td> ";
			}
	 	str_out += "</tr>";
		}

	 str_out += "</table>";

	return	str_out;
}

// -----------------------------------------------------------------------
