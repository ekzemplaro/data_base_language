// -----------------------------------------------------------------------
//	show_contents.js
//
//					Oct/30/2014
// -----------------------------------------------------------------------
function show_contents_proc (url_proxy,url_couchdb,key)
{
	var data_send = new Array ();

	var url_json = url_couchdb + "city/" + key;

	jQuery.getJSON (url_proxy,{url:url_json},function (data_json)
		{
		var index_mode = jQuery ("#mode").get(0).selectedIndex;

		var out_str = contents_table_gen_proc (key,index_mode,data_json);

		jQuery (".contents").html (out_str);

		jQuery ("button.execute").click (function ()
			{
			switch (index_mode)
				{
				case	1:
				case	2:
					couchdb_update_proc (data_json);
					break;

				case	3:
					couchdb_delete_proc
						(data_json,data_send);
					break;

				case	4:
					couchdb_initialize_proc (url_couchdb,data_json);
					break;
				};
			});

		change_monitor (data_json,data_send);
		});
}

// -----------------------------------------------------------------------
