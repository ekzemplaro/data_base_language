#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	json_append.js
//
//					Oct/31/2012
//
// ---------------------------------------------------------------
var fs = require("fs");
// var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
// ---------------------------------------------------------------
merge_proc = function (dict_aa,dict_bb)
{
	var dict_merged = new Object ();

	console.log ("*** merge_proc ***");

	for (var key in dict_aa)
		{
		dict_merged[key] = dict_aa[key];

		if (key in dict_bb)
			{
			for (var key_small in dict_bb[key])
				{
				dict_merged[key][key_small]
					= dict_bb[key][key_small];
				}
			}
		}

	return	dict_merged;
}

// ---------------------------------------------------------------
dict_display_proc = function (dict_aa)
{
	for (var key in dict_aa)
		{
		if (key)
			{
			if ((key != '_id') && (key != '_rev'))
			{
			var out_str = key + "\t";
			for (var key_small in dict_aa[key])
				{
				out_str += dict_aa[key][key_small] + "\t";
				}
			console.log (out_str);
			}
			}
		}	

}
// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//

var file_aa=process.argv[2];
var file_bb=process.argv[3];
var file_out=process.argv[4];

console.log (file_aa);
console.log (file_bb);
console.log (file_out);

fs.readFile(file_aa, function (err,json_str_aa)
{
	if (err) {
		console.log("Error on read: " + err)
                }
	else {
		console.log("File read.");
		}

	var dict_aa = JSON.parse (json_str_aa);

	fs.readFile(file_bb, function (err,json_str_bb)
		{
		var dict_bb = JSON.parse (json_str_bb);

		var dict_merged = merge_proc (dict_aa,dict_bb);

		dict_display_proc (dict_merged);

		var json_str_merged = JSON.stringify (dict_merged);

		fs.writeFile (file_out,json_str_merged);

		console.log ("*** 終了 ***");
		});
});

// ---------------------------------------------------------------

