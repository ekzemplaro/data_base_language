// -----------------------------------------------------------------------
//	by_language.js
//
//					Nov/11/2013
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_json = "../statistics/data/sheet_bb.json";

	jQuery.getJSON (url_json,function (data_json)
		{
		data_json.dbase = sharp_convert_proc (data_json.dbase);
		proc01 (data_json);
		});
});

// -----------------------------------------------------------------------
// [4]:
function proc01 (data_json)
{
	var out_str = show_lang_proc (data_json.dbase);

	jQuery(".nava").html (out_str);

//	jQuery ("button.lang").click (function ()
	jQuery ("button.lang").on ('click',function ()
		{
		var lang = this.id;

		jQuery ("button.lang").css ("color","black");
		jQuery ("button#" + this.id).css ("color","blue");

		var lang_mod = lang_define_proc (lang);
		crud_init_proc (lang,lang_mod);
		contents_init_proc ();

		if (lang === "common")
			{
			show_common_proc ();
			}
		else
			{
			show_data_base_proc (lang,data_json);

//			jQuery ("button.dbase").click (function ()
			jQuery ("button.dbase").on ('click',function ()
				{
				var dbase_cur = this.id;

				jQuery ("button.dbase").css ("color","black");
				jQuery ("#" + dbase_cur).css ("color","blue");

				jQuery(".contents").html ("<br />");
				jQuery(".makefile").html ("<br />");
				jQuery(".execute").html ("<br />");
				dbase_process (lang,dbase_cur,data_json.dbase);
				});


			button_selection_process ();

			}

		});
}

// -----------------------------------------------------------------------
// [4-2]:
function crud_init_proc (lang,lang_mod)
{
	var out_str =
	"<button class=\"selection\" id=\"" + lang_mod + "\" value=\"lang\">"
		+ lang + "</button><p />";

	var str_selection = out_str;

	var out_str = "crud<p />";

	jQuery(".selection").html (str_selection);
	jQuery(".crud").html (out_str);
}

// -----------------------------------------------------------------------
// [4-6]:
function contents_init_proc ()
{
	var out_str = "<h2>contents</h2><p />";

	jQuery(".contents").html (out_str);
	jQuery(".makefile").html ("<br />");
	jQuery(".execute").html ("<br />");
	jQuery("#outarea_cc").html ("<br />");
	jQuery("#outarea_dd").html ("<br />");
	jQuery("#outarea_ee").html ("<br />");
	jQuery("#outarea_ff").html ("<br />");
	jQuery("#outarea_gg").html ("<br />");
	jQuery("#outarea_hh").html ("<br />");
}

// -----------------------------------------------------------------------
// [6]:
function button_selection_process ()
{
//	jQuery ("button.selection").click (function ()
	jQuery ("button.selection").on ('click',function ()
		{
		var idx = this.id;
		var value = this.value

		var target_src = "";
		if (value === "lang")
		{
		target_src = "/data_base/doc/language/" + idx + ".txt";
		}
		else
		{
		target_src = "/data_base/doc/data_base/" + idx.toLowerCase () + ".txt";
		}

/*
		var out_str_bb = "check aaa<br />";
		out_str_bb += "this.id = " + this.id + "<br />";
		out_str_bb += "this.value = " + this.value + "<br />";
		out_str_bb += target_src + "<br />"
		out_str_bb += "check aaa<br />";

		jQuery("#outarea_aa").html (out_str_bb);
*/

		jQuery.get (target_src,function (received_data)
               		{
		        jQuery(".contents").html (received_data);
			jQuery(".makefile").html ("<br />");
			jQuery(".execute").html ("<br />");
			});

		});
}

// -----------------------------------------------------------------------
