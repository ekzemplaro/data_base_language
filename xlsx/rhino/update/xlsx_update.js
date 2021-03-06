#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------
/*
	xlsx_update.js
					Jan/26/2016

*/
// ----------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
load ("/var/www/data_base/common/rhino_common/xlsx_manipulate.js")

// ----------------------------------------------------------------
print ("*** 開始 ***")

var xlsx_file = arguments[0]
var key=arguments[1]
var population_in= parseInt (arguments[2])

print	("key = " + key + "\tpopulation_in = " + population_in)

file = new File (xlsx_file)

if (file.exists ())
	{
	var dict_aa = xlsx_read_proc (xlsx_file)

	if (key in dict_aa)
		{
		var dict_bb = dict_update_proc (dict_aa,key,population_in)
		xlsx_write_proc (xlsx_file,dict_bb)
		}
	}
else
	{
	System.err.println	(xlsx_file + " doesn't exist ***")
	}

print ("*** 終了 ***")  
  
// ----------------------------------------------------------------
