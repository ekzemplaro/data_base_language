#! /usr/bin/env jjs
// ------------------------------------------------------------------
//
//	text_read.js
//
//						Jan/04/2017
//
// ------------------------------------------------------------------
load ("/var/www/data_base/common/nashorn_common/text_manipulate.js")
load ("/var/www/data_base/common/nashorn_common/file_io.js")
// ------------------------------------------------------------------

print	("*** 開始 ***")
print("Arguments: " + arguments)

file_in=arguments[0]

var dict_aa = text_read_proc (file_in)
dict_display_proc (dict_aa)

print	("*** 終了 ***")
// ------------------------------------------------------------------
