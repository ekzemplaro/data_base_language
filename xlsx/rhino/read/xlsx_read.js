#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------
/*
	xlsx_read.js
					Jan/26/2016

*/
// ----------------------------------------------------------------
importPackage (java.lang)
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
load ("/var/www/data_base/common/rhino_common/xlsx_manipulate.js")

// ----------------------------------------------------------------
print ("*** 開始 ***")

var xlsx_file = arguments[0]

file = new File (xlsx_file)

if (file.exists ())
	{
	var dict_aa = xlsx_read_proc (xlsx_file)

	dict_display_proc (dict_aa)
	}
else
	{
	System.err.println	(xlsx_file + " doesn't exist ***")
	}

print ("*** 終了 ***")
  
// ----------------------------------------------------------------
