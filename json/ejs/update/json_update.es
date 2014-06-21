#! /usr/local/bin/ejs
// ------------------------------------------------------------------
//
//	json_update.es
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ejs_common/text_manipulate.es')
// ------------------------------------------------------------------

print	("*** 開始 ***")
var file_json = App.args[1]
var key_in = App.args[2]
var population_in = App.args[3]


print	("key_in = " + key_in + "\tpopulation_in = " + population_in)


var json_str = readFile (file_json)

var dict_aa = JSON.parse (json_str)

var dict_bb = text_manipulate.dict_update_proc (dict_aa,key_in,population_in)

var out_str = JSON.stringify (dict_bb)

text_manipulate.string_write_proc (file_json,out_str)

print	("*** 終了 ***")
// ------------------------------------------------------------------
