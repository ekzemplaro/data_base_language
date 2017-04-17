// -----------------------------------------------------------------------
//	info_data_base.js
//
//					Apr/17/2017
// -----------------------------------------------------------------------
jQuery (function ()
{
	var url_json = "../statistics/data/sheet_bb.json";

	jQuery.getJSON (url_json,function (data_json)
		{
	jQuery("#outarea_gg").html ("pppp<br />");
		var out_str = show_data_base_button_proc (data_json.info);

		jQuery(".nava").html (out_str);

//		jQuery ("button.data_base").click (function ()
		jQuery ("button.data_base").on ('click', function ()
			{
			var data_base = this.id;
			jQuery ("button.data_base").css ("color","black");
			jQuery ("button#" + this.id).css ("color","blue");

			contents_init_proc (data_base);
			});
		});
});

// -----------------------------------------------------------------------
function contents_init_proc (data_base_aa)
{
	var target_src = "../data_base/" + data_base_aa.toLowerCase () + ".txt";

	jQuery.get (target_src,function (received_data)
		{

	jQuery(".contents").html (received_data);
	jQuery("#outarea_aa").html ("<br />");
	jQuery("#outarea_bb").text (data_base_aa);
	jQuery("#outarea_cc").html ("<br />");
	jQuery("#outarea_dd").html ("<br />");
	jQuery("#outarea_ee").html ("<br />");
	jQuery("#outarea_ff").html ("<br />");
	jQuery("#outarea_gg").html ("<br />");
	jQuery("#outarea_hh").html ("<br />");
		});
}

// -----------------------------------------------------------------------
