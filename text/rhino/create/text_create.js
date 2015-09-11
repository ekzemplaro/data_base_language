#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	text_create.js
//
//					Aug/25/2015
//
// ------------------------------------------------------------------
importPackage (java.io)

load ("/var/www/data_base/common/rhino_common/file_io.js")
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")

var file_out=arguments[0]

print	("*** 開始 ***")

var dict_aa = data_prepare_proc ()

text_write_proc (file_out,dict_aa)

print	("*** 終了 ***")
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = dict_append_proc (dict_aa,'t2381','名古屋',51263,'1951-7-25')
	dict_aa = dict_append_proc (dict_aa,'t2382','豊橋',94357,'1951-2-8')
	dict_aa = dict_append_proc (dict_aa,'t2383','岡崎',52641,'1951-5-2')
	dict_aa = dict_append_proc (dict_aa,'t2384','一宮',38724,'1951-6-12')
	dict_aa = dict_append_proc (dict_aa,'t2385','蒲郡',43952,'1951-8-14')
	dict_aa = dict_append_proc (dict_aa,'t2386','常滑',61579,'1951-10-19')
	dict_aa = dict_append_proc (dict_aa,'t2387','大府',37481,'1951-3-21')
	dict_aa = dict_append_proc (dict_aa,'t2388','瀬戸',52316,'1951-9-26')
	dict_aa = dict_append_proc (dict_aa,'t2389','犬山',74152,'1951-11-8')

	return	dict_aa
}

// ------------------------------------------------------------------
