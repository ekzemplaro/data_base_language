#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	read/json_read.js
//
//					Dec/11/2015
//
// ---------------------------------------------------------------
var fs = require("fs")
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
// ---------------------------------------------------------------
console.log ("*** 開始 ***")

var filename=process.argv[2]

console.log (filename)

if (fs.existsSync(filename))
	{
	var json_str = fs.readFileSync (filename,'utf8')

	try
		{
		var dict_aa = JSON.parse (json_str)
		text_manipulate.dict_display_proc (dict_aa)
		}
	catch (error)
		{
		console.log ("*** error *** from JSON.parse ***")
		console.log (error)
		}
	}
else
	{
	console.log ("*** error *** " + filename + " doesn't exist. ***")
	}


console.log ("*** 終了 ***")
// ---------------------------------------------------------------

