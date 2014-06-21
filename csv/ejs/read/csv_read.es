#! /usr/local/bin/ejs
// ------------------------------------------------------------------
//
//	csv_read.es
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ejs_common/text_manipulate.es')
// ------------------------------------------------------------------
print	("*** 開始 ***")
var file_in = App.args[1]

var dict_aa = text_manipulate.csv_read_proc (file_in)
text_manipulate.dict_display_proc (dict_aa)

print	("*** 終了 ***")
// ------------------------------------------------------------------
