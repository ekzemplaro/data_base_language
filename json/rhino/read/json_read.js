#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	json_read.js
//
//						Mar/04/2018
//
// ------------------------------------------------------------------
importPackage (java.io)
importPackage (java.lang)

load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
load ("/var/www/data_base/common/rhino_common/file_io.js")

const file_in=arguments[0]

System.err.println ("*** 開始 ***")

file = new File (file_in)

if (file.exists ())
	{
	const json_str = string_read_proc (file_in)

	var dict_aa = JSON.parse (json_str)

	dict_display_proc (dict_aa)
	}
else
	{
	System.err.println	(file_in + " doesn't exist ***")
	}

System.err.println ("*** 終了 ***")
// ------------------------------------------------------------------
