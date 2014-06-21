#! /usr/local/bin/narwhal
// ------------------------------------------------------------------
//
//	json_update.js
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
var population_in = args[3];


print	("id_in = " + id_in + "\tpopulation_in = " + population_in);


var json_str = readFile (file_json);

var dict_aa = JSON.parse (json_str);

var dict_bb = text_manipulate.dict_update_proc (dict_aa,id_in,population_in);

var out_str = JSON.stringify (dict_bb);

text_manipulate.string_write_proc (file_json,out_str);

print	("*** 終了 ***");
// ------------------------------------------------------------------
