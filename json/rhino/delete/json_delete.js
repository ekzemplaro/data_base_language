#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	json_delete.js
//
//					Aug/07/2015
//
// ------------------------------------------------------------------
importPackage (java.io)

load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
load ("/var/www/data_base/common/rhino_common/file_io.js")

print	("*** 開始 ***")
var file_name=arguments[0]
var key_in=arguments[1]

print	("key_in = " + key_in)

var json_str = string_read_proc (file_name)

var dict_aa = JSON.parse (json_str)

if (dict_aa[key_in])
	{
	delete dict_aa[key_in]
	json_str = JSON.stringify (dict_aa)
	string_write_proc (file_name,json_str)
	}

print	("*** 終了 ***")
// ------------------------------------------------------------------
