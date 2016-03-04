#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	json_read.js
//
//						Jan/27/2016
//
// ------------------------------------------------------------------
importPackage (java.io)
importPackage (java.lang)

load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
load ("/var/www/data_base/common/rhino_common/file_io.js")

var file_in=arguments[0]

print	("*** 開始 ***")

file = new File (file_in)

if (file.exists ())
	{
	var json_str = string_read_proc (file_in)

	var dict_aa = JSON.parse (json_str)

	dict_display_proc (dict_aa)
	}
else
	{
	System.err.println	(file_in + " doesn't exist ***")
	}

print	("*** 終了 ***")
// ------------------------------------------------------------------
