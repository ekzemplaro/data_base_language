// -----------------------------------------------------------------------
//	file_save.js
//
//					Jul/17/2012
// -----------------------------------------------------------------------
// [4-4-12]:
function file_save_proc (file_json,data_json)
{
//	var file_out = "/tmp/ex02.json";

	var encoded = jQuery.toJSON (data_json);

	jQuery.ajax({
		type: "POST",
		url: "write_json.php",
		data: {file: file_json,data_out: encoded}
		});
}

// -----------------------------------------------------------------------
