#! /usr/local/bin/narwhal
// ------------------------------------------------------------------
//
//	json_delete.js
//
//						May/07/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/narwhal_common/text_manipulate.js');
// ------------------------------------------------------------------

print	("*** 開始 ***");
var args = require('system').args;
var file_json = args[1];
var id_in = args[2];

print	("id_in = " + id_in);

var json_str = readFile (file_json);

var dict_aa = JSON.parse (json_str);

delete dict_aa[id_in];

var out_str = JSON.stringify (dict_aa);

text_manipulate.string_write_proc (file_json,out_str);

print	("*** 終了 ***");
// ------------------------------------------------------------------
