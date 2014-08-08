// -----------------------------------------------------------------------
//	info_language.js
//
//					Jul/21/2014
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").html ("info_language *** start ***<br />");

	var url_json = "../statistics/data/sheet_bb.json";

	jQuery.getJSON (url_json,function (data_json)
		{
		var out_str = show_lang_button_proc (data_json.dbase);

		jQuery(".nava").html (out_str);

		jQuery ("button.lang").on ('click', function ()
			{
			var lang = this.id;

			jQuery ("button.lang").css ("color","black");
			jQuery ("button#" + this.id).css ("color","blue");

			contents_init_proc (lang);

			});

	//	jQuery ("button.lang").off ('click');
		});

	jQuery("#outarea_hh").html ("info_language *** end ***<br />");
});

// -----------------------------------------------------------------------
function contents_init_proc (lang)
{
	var lang_mod = lang_define_proc (lang);
	jQuery("#outarea_bb").html (lang_mod + "<br />");

	var target_src = "../language/" + lang_mod + ".txt";

	jQuery.get (target_src,function (received_data)
		{
	jQuery(".contents").html (received_data);
	jQuery("#outarea_aa").html ("<br />");
	jQuery("#outarea_cc").html ("<br />");
	jQuery("#outarea_dd").html ("<br />");
	jQuery("#outarea_ee").html ("<br />");
	jQuery("#outarea_ff").html ("<br />");
	jQuery("#outarea_gg").html ("<br />");
	jQuery("#outarea_hh").html ("<br />");
		});
}

// -----------------------------------------------------------------------
