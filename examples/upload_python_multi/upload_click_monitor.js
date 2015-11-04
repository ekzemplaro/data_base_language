// -----------------------------------------------------------------------
//	upload_click_monitor.js
//
//					Nov/03/2015
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

			var length = vvx.length;

			var file_aa = jQuery("#file").prop("files")[0];

			fd.append ("file_aa",file_aa);

			if (1 < length)
				{
				var file_bb = jQuery("#file").prop("files")[1];
				fd.append ("file_bb",file_bb);
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
