#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	text_delete.js
//
//						May/09/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var args = require('system').args;
var file_txt = args[1];
var id_in = args[2];
print	(id_in);

var dict_aa = text_manipulate.text_read_proc (file_txt);

delete dict_aa[id_in];

text_manipulate.dict_display_proc (dict_aa);
text_manipulate.text_write_proc (file_txt,dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
