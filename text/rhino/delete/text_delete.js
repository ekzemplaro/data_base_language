#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	text_delete.js
//
//					Mar/04/2018
//
// ------------------------------------------------------------------
importPackage (java.io)
importPackage (java.lang)

load ("/var/www/data_base/common/rhino_common/file_io.js")
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")

const file_name=arguments[0]
const key_in=arguments[1]

System.err.println ("*** 開始 ***")
print	("key_in = " + key_in)

var dict_in = text_read_proc (file_name)

delete dict_in[key_in]

text_write_proc (file_name,dict_in)

System.err.println ("*** 終了 ***")
// ------------------------------------------------------------------
