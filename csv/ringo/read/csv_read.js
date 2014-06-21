#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	csv_read.js
//
//						May/10/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var args = require('system').args;
var file_in = args[1];

var dict_aa = text_manipulate.csv_read_proc (file_in);
text_manipulate.dict_display_proc (dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
