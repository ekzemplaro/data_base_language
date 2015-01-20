#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	text_update.js
//
//					Jan/13/2015
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate");

// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//


var file_csv=process.argv[2];
var key_in=process.argv[3];
var population_in=process.argv[4];

console.log (file_csv);
console.log (key_in + "\t" + population_in);

if (fs.existsSync(file_csv))
	{
	var dict_aa = text_manipulate.csv_read_proc (file_csv);

	var dict_bb = text_manipulate.dict_update_proc (dict_aa,key_in,population_in);

	text_manipulate.dict_display_proc (dict_bb);

	text_manipulate.csv_write_proc (file_csv,dict_bb);
	}
else
	{
	console.log ("*** error *** " + file_csv + " doesn't exist. ***");
	}

console.log ("*** 終了 ***");


// ---------------------------------------------------------------
