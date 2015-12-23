// -----------------------------------------------------------------------
//	zip_upload.js
//
//					Nov/04/2015
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").html
		("*** zip_upload *** start *** Nov/04/2015 ***");

	var url_in="../zip_list/list_file.py";

	var folder_in = "work_area";

	var data = {"folder_in": folder_in};

	jQuery.getJSON (url_in,data,function (data_aa)
		{
		list_file_proc (folder_in,data_aa);
		});

	upload_click_monitor (folder_in);

	jQuery("#outarea_hh").html
		("*** zip_upload *** end *** Nov/04/2015 ***");

});

// -----------------------------------------------------------------------
