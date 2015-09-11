#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	text_delete.js
//
//					Aug/07/2015
//
// ------------------------------------------------------------------
importPackage (java.io)

load ("/var/www/data_base/common/rhino_common/file_io.js")
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")

var file_name=arguments[0]
var key_in=arguments[1]

print	("*** 開始 ***")
print	("key_in = " + key_in)

var dict_in = text_read_proc (file_name)

delete dict_in[key_in]

text_write_proc (file_name,dict_in)

print	("*** 終了 ***")
// ------------------------------------------------------------------
