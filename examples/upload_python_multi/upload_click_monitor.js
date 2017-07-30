// -----------------------------------------------------------------------
//	upload_python_multi/upload_click_monitor.js
//
//					Jul/29/2017
//
// -----------------------------------------------------------------------
function upload_click_monitor (upload_dir)
{
	jQuery("#upload").bind ("click",function()
		{
		jQuery ("#outarea_bb").html ("*** upload clicked ***<br />")

		if (jQuery("#file").val() !== '')
			{
			var fd = new FormData()

			var files=jQuery("#file").prop("files")

			for (var it=0; it< files.length; it += 1)
				{
				const fname="file_" + it
				fd.append (fname,files[it])
				}

			fd.append("upload_dir", upload_dir)
 
			python_upload_proc (fd)
			}
		})
}

// -----------------------------------------------------------------------
function python_upload_proc (fd)
{
// dataにFormDataを指定する場合 processData,contentTypeをfalseにして
// jQueryがdataを処理しないようにする

	var postData = {
		type : "POST",
		dataType : "json",
		data : fd,
		processData : false,
		contentType : false
		}

	const url_action = "./jquery_upload_multi.py"

	jQuery.ajax (url_action,postData).done(function (rec)
		{
		jQuery ("#outarea_dd").html ("*** done ***<br />")

		var str_message = "<blockquote>"
		for (var it in rec['message'])
			{
			str_message += rec['message'][it] + '<br />'
			}

		str_message += "</blockquote>"

		jQuery ("#message").html (str_message)
		})
}

// -----------------------------------------------------------------------
