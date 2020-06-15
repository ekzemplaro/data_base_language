#! /usr/bin/node
// ---------------------------------------------------------------
//	read/json_read.js
//
//					Jun/08/2020
//
// ---------------------------------------------------------------
'use strict'

var fs = require("fs")
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const filename=process.argv[2]

console.log (filename)

if (fs.existsSync(filename))
	{
	const json_str = fs.readFileSync (filename,'utf8')

	try
		{
		const dict_aa = JSON.parse (json_str)
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

