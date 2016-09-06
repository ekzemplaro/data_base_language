#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	json_create.js
//
//					Sep/06/2016
//
// ---------------------------------------------------------------
var fs = require("fs")
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
// ---------------------------------------------------------------
console.error ("*** 開始 ***")

var file_json = process.argv[2]

var dict_aa = data_prepare_proc ()

var json_str = JSON.stringify(dict_aa)

fs.writeFile (file_json,json_str,function (err)
	{
	if (err) {
		console.error ("Error on write: " + err)
		}
	else {
		fs.chmodSync (file_json,0666)
		console.log("File written.")
		console.error ("*** 終了 ***")
		}
	})

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0921','宇都宮',68714,'1950-9-24')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0922','小山',29157,'1950-3-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0923','佐野',65741,'1950-10-7')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0924','足利',38164,'1950-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0925','日光',49675,'1950-8-28')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0926','下野',65813,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0927','さくら',37251,'1950-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0928','矢板',52416,'1950-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0929','真岡',26857,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0930','栃木',48923,'1950-12-20')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0931','大田原',75284,'1950-2-7')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0932','鹿沼',92354,'1950-5-17')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0933','那須塩原',81937,'1950-6-19')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0934','那須烏山',72158,'1950-8-14')

	return	dict_aa
}

// ---------------------------------------------------------------

