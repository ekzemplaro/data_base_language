#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	json_create.js
//
//					Dec/10/2012
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var filename=process.argv[2];

var dict_aa = data_prepare_proc ();

var json_str = JSON.stringify(dict_aa);

fs.writeFile (filename,json_str);

console.log ("*** 終了 ***");

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0921','宇都宮',61714,'1950-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0922','小山',23157,'1950-3-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0923','佐野',68741,'1950-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0924','足利',38764,'1950-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0925','日光',49352,'1950-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0926','下野',65292,'1950-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0927','さくら',31251,'1950-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0928','矢板',52486,'1950-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0929','真岡',26857,'1950-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0930','栃木',41873,'1950-12-20');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0931','大田原',45284,'1950-2-7');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0932','鹿沼',92354,'1950-5-17');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0933','那須塩原',81867,'1950-6-19');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0934','那須烏山',72758,'1950-8-14');

	return	dict_aa;
}

// ---------------------------------------------------------------

