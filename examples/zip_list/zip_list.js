// -----------------------------------------------------------------------
//	zip_list.js
//
//					Nov/03/2015
//
// -----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").html
		("*** zip_list *** start *** Nov/03/2015 ***");

	var url_in="list_file.py";

	var folder_in = "work_area";

	jQuery.getJSON (url_in,function (data_aa)
		{
		list_file_proc (folder_in,data_aa);
		});

	jQuery("#outarea_hh").html
		("*** zip_list *** end *** Nov/03/2015 ***");

});

// -----------------------------------------------------------------------
