#!/usr/bin/env jjs
// ------------------------------------------------------------------
//
//	text_create.js
//
//					Jan/04/2017
//
// ------------------------------------------------------------------
load ("/var/www/data_base/common/nashorn_common/text_manipulate.js")
load ("/var/www/data_base/common/nashorn_common/file_io.js")
// ------------------------------------------------------------------
var file_out=arguments[0]

print	("*** 開始 ***")

var dict_aa = data_prepare_proc ()

text_write_proc (file_out,dict_aa)

print	("*** 終了 ***")
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = dict_append_proc (dict_aa,'t2381','名古屋',52163,'1911-7-25')
	dict_aa = dict_append_proc (dict_aa,'t2382','豊橋',98357,'1911-2-8')
	dict_aa = dict_append_proc (dict_aa,'t2383','岡崎',57641,'1911-5-2')
	dict_aa = dict_append_proc (dict_aa,'t2384','一宮',35724,'1911-6-12')
	dict_aa = dict_append_proc (dict_aa,'t2385','蒲郡',43152,'1911-8-14')
	dict_aa = dict_append_proc (dict_aa,'t2386','常滑',61579,'1911-10-19')
	dict_aa = dict_append_proc (dict_aa,'t2387','大府',37481,'1911-3-21')
	dict_aa = dict_append_proc (dict_aa,'t2388','瀬戸',59316,'1911-9-26')
	dict_aa = dict_append_proc (dict_aa,'t2389','犬山',78152,'1911-11-8')

	return	dict_aa
}

// ------------------------------------------------------------------
