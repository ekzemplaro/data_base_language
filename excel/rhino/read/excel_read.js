#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------
/*
	excel_read.js
					Aug/08/2013

*/
// ----------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/excel_manipulate.js");

// ----------------------------------------------------------------
print ("*** 開始 ***");

var excel_file = arguments[0];

var dict_aa = excel_read_proc (excel_file);

dict_display_proc (dict_aa);

print ("*** 終了 ***");  
  
// ----------------------------------------------------------------
