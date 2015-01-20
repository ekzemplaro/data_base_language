#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	csv_read.js
//
//					Jan/13/2015
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate");

// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//

var file_in=process.argv[2];

console.log (file_in);

if (fs.existsSync(file_in))
	{
	var dict_aa = text_manipulate.csv_read_proc (file_in);

	text_manipulate.dict_display_proc (dict_aa);
	}
else
	{
	console.log ("*** error *** " + file_in + " doesn't exist. ***");
	}

console.log ("*** 終了 ***");
// ---------------------------------------------------------------

