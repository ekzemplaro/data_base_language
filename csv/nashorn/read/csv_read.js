#! /usr/bin/env jjs
// ------------------------------------------------------------------
//
//	csv_read.js
//
//						Jan/04/2017
//
// ------------------------------------------------------------------
load ("/var/www/data_base/common/nashorn_common/file_io.js");
load ("/var/www/data_base/common/nashorn_common/text_manipulate.js");

// ------------------------------------------------------------------
file_in=arguments[0];

print	("*** 開始 ***");

var dict_aa = csv_read_proc (file_in);

dict_display_proc (dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
