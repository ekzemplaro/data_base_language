#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	text_update.js
//
//						Oct/17/2011
//
// ------------------------------------------------------------------
importPackage (java.io);

load ("/var/www/data_base/common/rhino_common/file_io.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

var file_name=arguments[0];
var id_in=arguments[1];
var population_in=arguments[2];

print	("*** 開始 ***");
print	("id_in = " + id_in + "\tpopulation_in = " + population_in);

var dict_in = text_read_proc (file_name);
var dict_bb = dict_update_proc (dict_in,id_in,population_in)
text_write_proc (file_name,dict_bb);
dict_display_proc (dict_bb);

print	("*** 終了 ***");
// ------------------------------------------------------------------
