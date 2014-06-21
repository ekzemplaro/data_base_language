#! /usr/local/bin/ejs
// ------------------------------------------------------------------
//
//	json_delete.es
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ejs_common/text_manipulate.es')
// ------------------------------------------------------------------

print	("*** 開始 ***")
var file_json = App.args[1]
var key_in = App.args[2]

print	("key_in = " + key_in)

var json_str = readFile (file_json)

var dict_aa = JSON.parse (json_str)

delete dict_aa[key_in]

var out_str = JSON.stringify (dict_aa)

text_manipulate.string_write_proc (file_json,out_str)

print	("*** 終了 ***")
// ------------------------------------------------------------------
