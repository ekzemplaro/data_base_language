// -----------------------------------------------------------------------
//	show_contents.js
//
//					Nov/26/2013
// -----------------------------------------------------------------------
function show_contents_proc (url_couchdb,key)
{
	var data_send = new Array ();

	var tmp_str = "show_contents_proc *** " + key;
	jQuery ("#outarea_cc").text (tmp_str);

	var url_json = url_couchdb + "sound_koho/" + key;

	var url_proxy = "./php_proxy_get.php"  + '?url=' + url_json;

	url_json += "?callback=?";

	jQuery.getJSON (url_proxy,function (data_json)
		{
		var index_mode = jQuery ("#mode").get(0).selectedIndex;

	tmp_str += " *** ppp ***";
	jQuery ("#outarea_dd").text (tmp_str);

		var out_str = contents_table_gen_proc (key,index_mode,data_json);

		jQuery (".contents").html (out_str);

		jQuery ("button.execute").on ('click',function ()
			{
			switch (index_mode)
				{
				case	1:
					couchdb_update_proc (data_json);
					break;
				};
			});

		change_monitor (data_json,data_send);
		});
}

// -----------------------------------------------------------------------
