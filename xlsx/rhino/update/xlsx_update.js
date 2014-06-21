#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------
/*
	xlsx_update.js
					Aug/05/2013

*/
// ----------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/xlsx_manipulate.js");

// ----------------------------------------------------------------
print ("*** 開始 ***");

var xlsx_file = arguments[0];
var key=arguments[1];
var population_in= parseInt (arguments[2]);

print	("key = " + key + "\tpopulation_in = " + population_in);

var dict_aa = xlsx_read_proc (xlsx_file);

if (key in dict_aa)
	{
	var dict_bb = dict_update_proc (dict_aa,key,population_in);
	dict_display_proc (dict_bb);
	xlsx_write_proc (xlsx_file,dict_bb);
	}

print ("*** 終了 ***");  
  
// ----------------------------------------------------------------
