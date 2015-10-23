// -----------------------------------------------------------------------
//	file_save.js
//
//					Oct/16/2014
// -----------------------------------------------------------------------
// [4-4-12]:
function file_save_proc (file_json,data_json)
{
//	var file_out = "/tmp/ex02.json";

//	var encoded = jQuery.toJSON (data_json);
	var encoded = JSON.stringify (data_json);

	jQuery.ajax({
		type: "POST",
//		url: "write_json.php",
		url: "write_json.py",
		data: {file: file_json,data_out: encoded}
		});
}

// -----------------------------------------------------------------------
