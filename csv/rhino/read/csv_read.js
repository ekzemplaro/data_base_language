// ------------------------------------------------------------------
//
//	csv_read.js
//
//						Feb/21/2011
//
// ------------------------------------------------------------------
importPackage (java.io);

load ("/var/www/data_base/common/rhino_common/file_io.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

file_in=arguments[0];

print	("*** 開始 ***");

var dict_aa = csv_read_proc (file_in);

dict_display_proc (dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
