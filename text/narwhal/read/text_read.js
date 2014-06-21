#! /usr/local/bin/narwhal
// ------------------------------------------------------------------
//
//	text_read.js
//
//						May/07/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/narwhal_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var args = require('system').args;
var file_in = args[1];

var dict_aa = text_manipulate.text_read_proc (file_in);
text_manipulate.dict_display_proc (dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
