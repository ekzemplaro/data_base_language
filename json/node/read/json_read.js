#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	read/json_read.js
//
//					Sep/06/2016
//
// ---------------------------------------------------------------
var fs = require("fs")
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
// ---------------------------------------------------------------
console.error ("*** 開始 ***")

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
		console.error ("*** error *** from JSON.parse ***")
		console.error (error)
		}
	}
else
	{
	console.error ("*** error *** " + filename + " doesn't exist. ***")
	}


console.error ("*** 終了 ***")
// ---------------------------------------------------------------

