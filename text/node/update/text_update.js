#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	update/text_update.js
//
//					Sep/06/2016
//
// ---------------------------------------------------------------
var fs = require("fs")
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")

// ---------------------------------------------------------------
console.error ("*** 開始 ***")

var file_txt=process.argv[2]
var key=process.argv[3]
var population_in=process.argv[4]

console.log (file_txt)
console.log (key + "\t" + population_in)

if (fs.existsSync(file_txt))
	{
	var dict_aa = text_manipulate.text_read_proc (file_txt)

	if (key in dict_aa)
		{
		var dict_aa = text_manipulate.dict_update_proc (dict_aa,key,population_in)
		text_manipulate.text_write_proc (file_txt,dict_aa)
		}
	}
else
	{
	console.error ("*** error *** " + file_txt + " doesn't exist. ***")
	}

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
