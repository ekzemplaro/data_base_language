#! /usr/bin/node
// ---------------------------------------------------------------
//	csv_delete.js
//
//					Jun/08/2020
//
// ---------------------------------------------------------------
'use strict'

var fs = require("fs")
var csv = require("csv")
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")


// ---------------------------------------------------------------
console.error ("*** 開始 ***")
//

const file_csv=process.argv[2]
const key_in=process.argv[3]

console.log (file_csv)
console.log (key_in)

fs.readFile(file_csv, function(err, buf)
	{
	csv.parse(buf.toString(),{comment:'#'}, function(err, array_aa)
		{
		if (err != null)
			{
			console.log ("*** error ***")
			console.log (err)
			}

		var dict_aa = text_manipulate.array_to_dict_proc (array_aa)

	if (key_in in dict_aa)
		{
		delete dict_aa[key_in]

		text_manipulate.csv_write_proc (file_csv,dict_aa)
		}
	console.error ("*** 終了 ***")
		})
	})



// ---------------------------------------------------------------
