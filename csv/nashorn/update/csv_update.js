#! /usr/bin/env jjs
// ------------------------------------------------------------------
//
//	csv_update.js
//
//						Jan/04/2017
//
// ------------------------------------------------------------------
load ("/var/www/data_base/common/nashorn_common/file_io.js")
load ("/var/www/data_base/common/nashorn_common/text_manipulate.js")

var file_name=arguments[0]
var key_in=arguments[1]
var population_in=arguments[2]

print	("*** 開始 ***")
print	("key_in = " + key_in + "\tpopulation_in = " + population_in)

var dict_in = csv_read_proc (file_name)
var dict_bb = dict_update_proc (dict_in,key_in,population_in)
csv_write_proc (file_name,dict_bb)

print	("*** 終了 ***")
// ------------------------------------------------------------------
