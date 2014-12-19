#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	delete/text_delete.js
//
//					Nov/25/2014
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate");


// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var file_txt=process.argv[2];
var key=process.argv[3];

console.log (file_txt);
console.log (key);

if (fs.existsSync(file_txt))
	{
	var dict_aa = text_manipulate.text_read_proc (file_txt);

	if (key in dict_aa)
		{
		delete dict_aa[key];
		text_manipulate.text_write_proc (file_txt,dict_aa);
		}
	}
else
	{
	console.log ("*** error *** " + file_txt + " doesn't exist. ***");
	}

console.log ("*** 終了 ***");

// ---------------------------------------------------------------
