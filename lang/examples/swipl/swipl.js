// -----------------------------------------------------------------------
//	swipl.js
//
//					Oct/21/2015
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").html ("*** swipl *** start ***<br />");

	var url_json = "./data/data_prog.json";

	jQuery.getJSON (url_json,function (data_json)
		{
		var out_str = show_command_button_proc (data_json);

		jQuery(".nava").html (out_str);

		jQuery ("button.command").on ('click', function ()
			{
			var command = this.id;

			jQuery ("button.command").css ("color","black");
			jQuery ("button#" + this.id).css ("color","blue");

			contents_init_proc (command);

			});

	//	jQuery ("button.lang").off ('click');
		});

	jQuery("#outarea_hh").html ("*** swipl *** end ***<br />");
});

// -----------------------------------------------------------------------
function contents_init_proc (command)
{
	jQuery("#outarea_bb").html (command + "<br />");

	var target_src = "data/" + command + ".txt";

	jQuery.get (target_src,function (received_data)
		{
		var str_out = "<pre>";
		str_out += received_data;
		str_out += "</pre>";

	jQuery(".contents").html (str_out);
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
