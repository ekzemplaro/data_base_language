// -----------------------------------------------------------------------
//	jquery_upload_python.js
//
//					Aug/25/2014
// -----------------------------------------------------------------------
jQuery(function ()
{
 
jQuery("#upload").bind ("click",function()
	{
	jQuery ("#outarea_bb").html ("*** clicked ***<br />");

	var fd = new FormData();

	if ( jQuery("#file").val() !== '' )
		{
		fd.append ("file",jQuery("#file").prop("files")[0]);
		}

	fd.append("username", "Groucho");
	fd.append("accountnum", 123456);
	fd.append("upload_dir", "./data_work");
 
// dataにFormDataを指定する場合 processData,contentTypeをfalseにしてjQueryがdataを処理しないようにする
	var postData = {
		type : "POST",
		dataType : "text",
		data : fd,
		processData : false,
		contentType : false
		};

	var url_action = "./jquery_upload.py";

	jQuery.ajax (url_action,postData).done(function (res)
		{
		jQuery ("#result_aa").html (res);
		jQuery ("#outarea_dd").html ("*** done ***<br />");

		var data_in = JSON.parse (res);

		var str_message = "<blockquote>";
		for (var it in data_in['message'])
			{
			str_message += data_in['message'][it] + '<br />';
			}

		str_message += "</blockquote>";

		jQuery ("#message").html (str_message);

		});
	});
});

// -----------------------------------------------------------------------
