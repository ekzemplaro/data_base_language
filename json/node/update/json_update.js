#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	json_update.js
//
//					Dec/26/2016
//
// ---------------------------------------------------------------

var fs = require("fs")
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')

// ---------------------------------------------------------------
console.error ("*** 開始 ***")
const filename=process.argv[2]
const key_in=process.argv[3]
const population_in=process.argv[4]

console.log (filename)
console.log (key_in + "\t" + population_in)

if (fs.existsSync(filename))
	{
	const json_str = fs.readFileSync(filename,'utf8')
	const dict_aa = JSON.parse (json_str)

	const dict_bb = text_manipulate.dict_update_proc (dict_aa,key_in,population_in)

	const json_str_out = JSON.stringify(dict_bb)

	fs.writeFile (filename,json_str_out,function (err)
		{
		if (err) {
			console.error ("Error on write: " + err)
			}
		})
	}
else
	{
	console.error ("*** error *** " + filename + " doesn't exist. ***")
	}

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
