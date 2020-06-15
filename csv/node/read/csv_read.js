#! /usr/bin/node
// ---------------------------------------------------------------
//	csv_read.js
//
//					Jun/08/2020
//
// ---------------------------------------------------------------
'use strict'

var fs = require("fs")
var csv = require('csv')
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")

// ---------------------------------------------------------------
console.error ("*** 開始 ***")
//

const file_csv=process.argv[2]

console.log (file_csv)

fs.readFile(file_csv, function(err, buf)
	{
	csv.parse(buf.toString(),{comment:'#'}, function(err, array_aa)
		{
		if (err != null)
			{
			console.log ("*** error ***")
			console.log (err)
			}

		const dict_aa = text_manipulate.array_to_dict_proc (array_aa)

		text_manipulate.dict_display_proc (dict_aa)
		console.error ("*** 終了 ***")
		})
	})
// ---------------------------------------------------------------

