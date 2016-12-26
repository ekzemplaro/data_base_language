#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	text_create.js
//
//					Dec/26/2016
//
// ---------------------------------------------------------------
var fs = require("fs")
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")
//

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2381','名古屋',93814,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2382','豊橋',23657,'1950-3-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2383','岡崎',65291,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2384','一宮',31864,'1950-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2385','蒲郡',49158,'1950-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2386','常滑',65792,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2387','大府',38251,'1950-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2388','瀬戸',52486,'1950-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2389','犬山',26857,'1950-11-18')
	
	return	dict_aa
}

// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const file_out=process.argv[2]

const dict_aa = data_prepare_proc ()

text_manipulate.text_write_proc (file_out,dict_aa)

fs.chmodSync (file_out,0666)

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
