// -----------------------------------------------------------------------
//	file_upload_multi.js
//
//					Feb/11/2014
//
// -----------------------------------------------------------------------
jQuery (function ()
{


});

// -----------------------------------------------------------------------
// [6]:
function file_upload_multi ()
{
	jQuery("#outarea_aa").html
		("*** file_upload_multi *** start *** Feb/11/2014 ***");

	var message_sending = '<span id="green">*** sending ***</span><br />';
	jQuery("#result").html (message_sending);
	jQuery("#outarea_cc").html ("upload_file *** *** check aaa ***<br />");


	var param_aa = "aaa_0123";
	var param_bb = "bbb_0456";
	
	jQuery('#upload_id').upload('upload_file_multi.php',
		{
		param_aa: param_aa,
		param_bb: param_bb
		},
		function (res)
			{
			var data_aa = jQuery.parseJSON (res);
var str_out = "";

			for (var it in data_aa.message)
				{
				var line = data_aa.message[it];
				str_out += line + '<br />';
				}

			jQuery("#result").html (str_out);

			jQuery("#outarea_ff").text("*** check ***");
			},
		'text'
	);

	jQuery("#outarea_hh").html
		("*** file_upload_multi *** end *** Feb/11/2014 ***");

}

// -----------------------------------------------------------------------
