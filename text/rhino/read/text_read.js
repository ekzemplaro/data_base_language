#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	text_read.js
//
//						Aug/07/2015
//
// ------------------------------------------------------------------
importPackage (java.io)
importPackage (java.lang)

load ("/var/www/data_base/common/rhino_common/file_io.js")
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")

print	("*** 開始 ***")

file_in=arguments[0]

file = new File (file_in)

if (file.exists ())
	{
	var dict_aa = text_read_proc (file_in)
	dict_display_proc (dict_aa)
	}
else
	{
	System.err.println	(file_in + " doesn't exist ***")
	}

print	("*** 終了 ***")
// ------------------------------------------------------------------
