#! /usr/bin/node
// ---------------------------------------------------------------
//	delete/text_delete.js
//
//					Jun/08/2020
//
// ---------------------------------------------------------------
'use strict'
var fs = require("fs")
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")


// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const file_txt=process.argv[2]
const key=process.argv[3]

console.log (file_txt)
console.log (key)

if (fs.existsSync(file_txt))
	{
	var dict_aa = text_manipulate.text_read_proc (file_txt)

	if (key in dict_aa)
		{
		delete dict_aa[key]
		text_manipulate.text_write_proc (file_txt,dict_aa)
		}
	}
else
	{
	console.error ("*** error *** " + file_txt + " doesn't exist. ***")
	}

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
