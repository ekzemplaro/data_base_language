#! /usr/bin/env jjs
// ------------------------------------------------------------------
//
//	text_delete.js
//
//					Jan/04/2017
//
// ------------------------------------------------------------------
load ("/var/www/data_base/common/nashorn_common/text_manipulate.js")
load ("/var/www/data_base/common/nashorn_common/file_io.js")

var file_name=arguments[0]
var key_in=arguments[1]

print	("*** 開始 ***")
print	("key_in = " + key_in)

var dict_in = text_read_proc (file_name)

delete dict_in[key_in]

text_write_proc (file_name,dict_in)

print	("*** 終了 ***")
// ------------------------------------------------------------------
