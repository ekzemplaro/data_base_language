// -----------------------------------------------------------------------
//	file_upload.js
//
//					Aug/27/2012
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start *** file_upload.js ***");

	help_proc ();

	upload_file_proc ();

	jQuery("#outarea_hh").text ("*** end *** file_upload.js ***");
});

// -----------------------------------------------------------------------
function help_proc ()
{
	jQuery ("button").click (function ()
	{
	var url_json;

	var folder = "";

	var folder_portion = this.id;
	var str_tmp = "*** " + this.className + " *** " + folder_portion + " ***";
	jQuery("#outarea_bb").text (str_tmp);

	if (this.className === "support")
		{
		var url_help = "./help.txt";
		jQuery.get (url_help,function (text_received)
			{
			var str_out = "<pre>";
			str_out += text_received;
			str_out += "</pre>";

			jQuery("#result").html (str_out);
			});
		}

	});
}

// -----------------------------------------------------------------------
function upload_file_proc ()
{
	jQuery("#upload").change(function()
		{
		jQuery('#upload').upload(
			'file_upload.php',
			{now:'2012/08/23'},
			function (res) {

			var data_aa = jQuery.parseJSON (res);
			var str_out = "";

			for (var it in data_aa.message)
				{
				var line = data_aa.message[it];
				str_out += line + '<br />';
				}

			jQuery("#result").html (str_out);
				},
			'text'
		);
	});
}

// -----------------------------------------------------------------------
