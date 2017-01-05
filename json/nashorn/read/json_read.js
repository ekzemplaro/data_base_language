#! /usr/bin/env jjs
// ------------------------------------------------------------------
//
//	json_read.js
//
//						Jan/05/2017
//
// ------------------------------------------------------------------
load ("/var/www/data_base/common/nashorn_common/text_manipulate.js")
load ("/var/www/data_base/common/nashorn_common/file_io.js")

var file_in=arguments[0]

print	("*** 開始 ***")

var json_str = file_to_str_proc (file_in)

var dict_aa = JSON.parse (json_str)

dict_display_proc (dict_aa)

print	("*** 終了 ***")
// ------------------------------------------------------------------
