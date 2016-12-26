#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	read/text_read.js
//
//					Dec/26/2016
//
// ---------------------------------------------------------------
var fs = require("fs")
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")

// ---------------------------------------------------------------
console.error ("*** 開始 ***")
//
const file_in=process.argv[2]

console.log (file_in)

if (fs.existsSync(file_in))
	{
	const dict_aa = text_manipulate.text_read_proc (file_in)

	text_manipulate.dict_display_proc (dict_aa)
	}
else
	{
	console.error ("*** error *** " + file_in + " doesn't exist. ***")
	}

console.error ("*** 終了 ***")
// ---------------------------------------------------------------

