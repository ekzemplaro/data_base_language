#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	json_read.js
//
//						Oct/20/2011
//
// ------------------------------------------------------------------
importPackage (java.io);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/file_io.js");

var file_in=arguments[0];

print	("*** 開始 ***");


var json_str = string_read_proc (file_in);

var dict_aa = JSON.parse (json_str);

dict_display_proc (dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
