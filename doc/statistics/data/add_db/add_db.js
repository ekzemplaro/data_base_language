#! /usr/bin/node
// ---------------------------------------------------------------
//	add_db.js
//
//					Oct/06/2018
//
// ---------------------------------------------------------------
var fs = require("fs")
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
// ---------------------------------------------------------------
console.error ("*** 開始 ***")

var filename=process.argv[2]
var file_new=process.argv[3]
var db_new=process.argv[4]
var db_pref=process.argv[5]
var db_code=process.argv[6]

console.log (filename)
console.log (file_new)
console.log (db_new)
console.log (db_pref)
console.log (db_code)

var json_str = fs.readFileSync (filename,'utf8')

var data_aa = JSON.parse (json_str)

var data_bb = convert_proc (data_aa,db_new,db_pref,db_code)

console.error("*** check *** pppp ***")

var json_str = JSON.stringify (data_bb)

console.error("*** check *** rrrr ***")

fs.writeFile (file_new,json_str,function (err)
	{
	if (err) {
		console.error ("Error on write: " + err)
		}
	else {
		console.error("File written.")
		console.error ("*** 終了 ***")
		}
	}
	)

// ---------------------------------------------------------------
// [6]:
function convert_proc (data_aa,db_new,db_pref,db_code)
{
	data_aa['info'][db_new] = new Object ()
	data_aa['info'][db_new]['pref'] = db_pref
	data_aa['info'][db_new]['code'] = db_code

	for (var lang in data_aa.dbase)
		{
		for (var crud in data_aa.dbase[lang])
			{
			if (crud != 'year')
				{
				data_aa.dbase[lang][crud][db_new] = ""
				}
			}
		}

	return	data_aa
}

// ---------------------------------------------------------------
