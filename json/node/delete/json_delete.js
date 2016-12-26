#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	delete/json_delete.js
//
//					Sep/26/2016
//
// ---------------------------------------------------------------
var fs = require("fs")

console.error ("*** 開始 ***")
const filename=process.argv[2]
const key_in=process.argv[3]

console.log (filename)
console.log (key_in)

if (fs.existsSync(filename))
	{
	const json_str = fs.readFileSync(filename,'utf8')
	var dict_aa = JSON.parse (json_str)

	if (key_in in dict_aa)
		{ 
		delete dict_aa[key_in]

		const json_str_out = JSON.stringify(dict_aa)

		fs.writeFile (filename,json_str_out,function (err)
			{
			if (err) {
			console.error ("Error on write: " + err)
			}
			})
		}
	}
else
	{
	console.error ("*** error *** " + filename + " doesn't exist. ***")
	}

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
