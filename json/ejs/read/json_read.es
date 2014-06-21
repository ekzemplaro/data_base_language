#! /usr/local/bin/ejs
// ------------------------------------------------------------------
//
//	json_read.es
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ejs_common/text_manipulate.es')
// ------------------------------------------------------------------

print	("*** 開始 ***")

var file_in = App.args[1]

var json_str = readFile(file_in)

var dict_aa = JSON.parse (json_str)

text_manipulate.dict_display_proc (dict_aa)

print	("*** 終了 ***")
// ------------------------------------------------------------------
