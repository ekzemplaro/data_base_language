#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------
/*
	excel_update.js
					Aug/08/2013

*/
// ----------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/excel_manipulate.js");

// ----------------------------------------------------------------
print ("*** 開始 ***");

var excel_file = arguments[0];
var key=arguments[1];
var population_in= parseInt (arguments[2]);

print	("key = " + key + "\tpopulation_in = " + population_in);

var dict_aa = excel_read_proc (excel_file);

if (key in dict_aa)
	{
	var dict_bb = dict_update_proc (dict_aa,key,population_in);
	dict_display_proc (dict_bb);
	excel_write_proc (excel_file,dict_bb);
	}

print ("*** 終了 ***");  
  
// ----------------------------------------------------------------
