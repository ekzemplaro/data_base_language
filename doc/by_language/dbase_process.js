// -----------------------------------------------------------------------
//	dbase_process.js
//
//					Nov/11/2013
//
// -----------------------------------------------------------------------
function dbase_process (lang,dbase_cur,dbase_aa)
{
	var lang_mod = lang_define_proc (lang);

	var url_ref_json;

	if ( reference (lang))
		{
		url_ref_json = "/data_base/" + dbase_cur.toLowerCase ()
		+ "/" + lang_mod + "/reference.json";
		}
	else
		{
		url_ref_json = "/data_base/tools/reference/reference.json";
		}

	jQuery.getJSON (url_ref_json,function (data_ref)
		{
		show_crud_proc (lang,lang_mod,dbase_cur,dbase_aa,data_ref);

//	jQuery ("button.crud").click (function ()
	jQuery ("button.crud").on ('click',function ()
		{
		var crud = this.id;
		var id_crud = crud;

		var str_split = "\\.";
		var ipx = crud.search (str_split);

		if (0 <= ipx)
			{
			var array_aa = crud.split (".");

			var id_crud = array_aa[0] + str_split + array_aa[1];
			}

		jQuery ("button.crud").css ("color","black");
		jQuery ("button#" + id_crud).css ("color","blue");

		show_selection_proc (lang,lang_mod,dbase_cur,crud);
		crud_button_parser (lang_mod,dbase_cur,crud);

	button_selection_process ();

		});

	button_selection_process ();

		});
}

// -----------------------------------------------------------------------
// [6]:
function crud_button_parser (lang_mod,dbase,crud)
{
	var target = target_define_proc (lang_mod,dbase,crud);
	
	var out_str2 = "crud_button_parser : " + lang_mod + "<br />";
	out_str2 += "dbase = " + dbase + "<br />";
	out_str2 += "crud_button_parser: crud = " + crud + "<p />";
	out_str2 += target[0] + "<p />";
	jQuery("#outarea_hh").html (out_str2);

	crud_button_parser_exec (target);
}

// -----------------------------------------------------------------------
// [6-4]:
function crud_button_parser_exec (target)
{
	var data_text = "";

	jQuery.get (target[0],function (data_text)
		{
		var title = "<b>source</b></br>";
		show_contents_proc (".contents",title,data_text);

		show_make_proc (target);
		show_run_script_proc (target);
		});
}

// -----------------------------------------------------------------------
// [6-4-4]:
function show_make_proc (target)
{
	if (0 < target[1].length)
		{
		var data_text_make = "";
		jQuery.get (target[1],function (data_text_make)
			{
			if (0 < data_text_make.length)
				{
				var title = "<b>Makefile</b></br>";
				show_contents_proc (".makefile",title,data_text_make);
				}
			});
		}
	else
		{
		jQuery(".makefile").html ("");
		}
}

// -----------------------------------------------------------------------
// [6-4-8]:
function show_run_script_proc (target)
{
	if (0 < target[2].length)
		{
		var data_text_run = "";
		jQuery.get (target[2],function (data_text_run)
			{
			var title_run = "<b>run script</b></br>";
			show_contents_proc (".execute",title_run,data_text_run);
			});
		}
	else
		{
		jQuery(".execute").html ("");
		}
}

// -----------------------------------------------------------------------
// [6-6]:
function show_contents_proc (area_div,title_in,text_in)
{
	var str_rep = text_in.toString ();

	str_rep = str_rep.replace(/</g,"&lt;");
	str_rep = str_rep.replace(/>/g,"&gt;");

	var out_str = title_in + "<br /><pre>";
	out_str += str_rep;
	out_str += "</pre>";

	jQuery(area_div).html (out_str);
}

// -----------------------------------------------------------------------
