#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	json_delete.js
//
//					Mar/04/2018
//
// ------------------------------------------------------------------
importPackage (java.io)
importPackage (java.lang)

load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
load ("/var/www/data_base/common/rhino_common/file_io.js")

System.err.println ("*** 開始 ***")
const file_name=arguments[0]
const key_in=arguments[1]

print	("key_in = " + key_in)

var json_str = string_read_proc (file_name)

var dict_aa = JSON.parse (json_str)

if (dict_aa[key_in])
	{
	delete dict_aa[key_in]
	json_str = JSON.stringify (dict_aa)
	string_write_proc (file_name,json_str)
	}

System.err.println ("*** 終了 ***")
// ------------------------------------------------------------------
