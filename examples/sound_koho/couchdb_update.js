// -----------------------------------------------------------------------
//	couchdb_update.js
//
//					Oct/28/2011
// -----------------------------------------------------------------------
// [6]:
function couchdb_update_proc (data_json)
{
	var url_post = "./sound_koho_update.php";

	var str_json = jQuery.toJSON (data_json);

	jQuery.post (url_post,{my_data: str_json},
		function (data_receive,text_status)
		{
		var obj = jQuery.parseJSON (data_receive);
		data_json["_rev"] = obj.rev;
		});
}

// -----------------------------------------------------------------------
