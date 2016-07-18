// -----------------------------------------------------------------------
//	upload_python_multi/upload_click_monitor.js
//
//					Jul/05/2016
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
			var files=jQuery("#file").prop("files");

			var array_fname = ["file_aa","file_bb","file_cc",
				"file_dd","file_ee","file_ff","file_gg",
				"file_hh","file_ii","file_jj"];


			for (var it=0; it< files.length; it += 1)
				{
				fd.append (array_fname[it],files[it]);
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
