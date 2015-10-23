// -----------------------------------------------------------------------
//	show_common.js
//
//					Nov/11/2013
// -----------------------------------------------------------------------
function show_common_proc ()
{
	var common_json = "./common.json";

	jQuery.getJSON (common_json,function (data_in)
		{
		var out_str = "common<p />";

		for (var ffx in data_in)
			{
			if (0 < ffx.length)
				{
			out_str += "<button class=\"common\" id = \"" + ffx  + "\">";
			out_str += ffx + "</button><br />";
				}
			}

		jQuery(".navb").html (out_str);

		show_common_proc_s2 (data_in);

		});

//	jQuery("#outarea_dd").text ("*** show_common_proc *** end ***");
}

// -----------------------------------------------------------------------
function show_common_proc_s2 (data_in)
{
//	jQuery ("button.common").click (function ()
	jQuery ("button.common").on ('click',function ()
		{
		var common = this.id;

		jQuery ("button.common").css ("color","black");
		jQuery ("button.common#" + this.id).css ("color","blue");

	var out_str = "show_common_proc_s2<br />";
	out_str += this.id + "<br />";
	jQuery("#outarea_cc").html (out_str);

	jQuery(".contents").html ("<br />");

		jQuery(".selection").html ("<h2>" + common + "</h2><br />");

		var out_str = "<br />";


		for (var jt in data_in[common])
			{
			var ffx = data_in[common][jt];

			out_str += "<button class=\"library\" id = \"" + ffx  + "\">";
			out_str += ffx + "</button>";
			}
		out_str += "<br />";

		jQuery(".crud").html (out_str);

		show_common_proc_s4 (common);
		});

}

// -----------------------------------------------------------------------
function show_common_proc_s4 (common)
{
//	jQuery ("button.library").click (function ()
	jQuery ("button.library").on ('click',function ()
		{
		var file_name = this.id;
		var path = "../../";

		if (common === "js")
			{
			path += "js";
			}
		else
			{
			path += "common/" + common;

			if (common !== "common_lisp")
				{
				path += "_common";
				}
			}

		path += "/html_src/" + file_name + ".txt";

		jQuery.get (path,function (data_text)
			{
			var title = "<b>source</b></br>";
			show_contents_proc (".contents",title,data_text);

			});
/*
		var out_str2 = "s4<br />";
		out_str2 += file_name + "<br />";
		out_str2 += path + "<br />";

	jQuery("#outarea_dd").html (out_str2);
*/
		});
}

// -----------------------------------------------------------------------
