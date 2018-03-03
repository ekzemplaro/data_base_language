#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	text_read.js
//
//						Mar/04/2018
//
// ------------------------------------------------------------------
importPackage (java.io)
importPackage (java.lang)

load ("/var/www/data_base/common/rhino_common/file_io.js")
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")

System.err.println ("*** 開始 ***")

const file_in=arguments[0]

file = new File (file_in)

if (file.exists ())
	{
	const dict_aa = text_read_proc (file_in)
	dict_display_proc (dict_aa)
	}
else
	{
	System.err.println (file_in + " doesn't exist ***")
	}

System.err.println ("*** 終了 ***")
// ------------------------------------------------------------------
