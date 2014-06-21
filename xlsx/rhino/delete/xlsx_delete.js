#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------
/*
	xlsx_delete.js
					Aug/05/2013

*/
// ----------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/xlsx_manipulate.js");

// ----------------------------------------------------------------
print ("*** 開始 ***");

var xlsx_file = arguments[0];
var key=arguments[1];

print	("key = " + key);

var dict_aa = xlsx_read_proc (xlsx_file);

if (key in dict_aa)
	{
	delete dict_aa[key];
	dict_display_proc (dict_aa);
	xlsx_write_proc (xlsx_file,dict_aa);
	}

print ("*** 終了 ***");  
  
// ----------------------------------------------------------------
