// -----------------------------------------------------------------------
//	upload_python_multi/upload_click_monitor.js
//
//					Nov/20/2015
//
// -----------------------------------------------------------------------
function upload_click_monitor (upload_dir)
{
	jQuery("#upload").bind ("click",function()
		{
		jQuery ("#outarea_bb").html ("*** upload clicked ***<br />");

		var fd = new FormData();

		if ( jQuery("#file").val() !== '' )
			{
			var vvx = jQuery("#file").prop("files");

			var str_out = "";

			var files=jQuery("#file").prop("files");

			str_out += JSON.stringify (vvx) + '<br />';

			for (var it in files)
				{
				str_out += JSON.stringify (files[it]) + '<br />';
				}
			str_out += '------<br />';
			str_out += "" + jQuery("#file").prop("files")[0] + '<br />';
			str_out += jQuery("#file").prop("files")[1] + '<br />';
			str_out += 'vvx.length = ' + vvx.length + '------<br />';
			jQuery ("#outarea_cc").html (str_out);

			var array_fname = ["file_aa","file_bb","file_cc",
				"file_dd","file_ee","file_ff","file_gg",
				"file_hh","file_ii","file_jj"];


			for (var it=0; it< vvx.length; it += 1)
				{
			var file_aa = jQuery("#file").prop("files")[it];
			fd.append (array_fname[it],file_aa);
				}
			}

		fd.append("upload_dir", upload_dir);
 
// dataにFormDataを指定する場合 processData,contentTypeをfalseにして
// jQueryがdataを処理しないようにする

		var postData = {
			type : "POST",
			dataType : "json",
			data : fd,
			processData : false,
			contentType : false
			};

	python_upload_proc (postData);
	});
}

// -----------------------------------------------------------------------
function python_upload_proc (postData)
{
	var url_action = "./jquery_upload_multi.py";

	jQuery.ajax (url_action,postData).done(function (rec)
		{
		jQuery ("#outarea_dd").html ("*** done ***<br />");

		var str_message = "<blockquote>";
		for (var it in rec['message'])
			{
			str_message += rec['message'][it] + '<br />';
			}

		str_message += "</blockquote>";

		jQuery ("#message").html (str_message);

		});
}

// -----------------------------------------------------------------------
