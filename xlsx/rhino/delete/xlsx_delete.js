#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------
/*
	xlsx_delete.js
					Jan/26/2016

*/
// ----------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
load ("/var/www/data_base/common/rhino_common/xlsx_manipulate.js")

// ----------------------------------------------------------------
print ("*** 開始 ***")

var xlsx_file = arguments[0]
var key=arguments[1]

print	("key = " + key)

file = new File (xlsx_file)

if (file.exists ())
	{
	var dict_aa = xlsx_read_proc (xlsx_file)

	if (key in dict_aa)
		{
		delete dict_aa[key]
		xlsx_write_proc (xlsx_file,dict_aa)
		}
	}
else
	{
	System.err.println	(xlsx_file + " doesn't exist ***")
	}

print ("*** 終了 ***")  
  
// ----------------------------------------------------------------
