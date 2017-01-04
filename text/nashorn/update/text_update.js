#! /usr/bin/env jjs
// ------------------------------------------------------------------
//
//	text_update.js
//
//						Jan/04/2017
//
// ------------------------------------------------------------------
load ("/var/www/data_base/common/nashorn_common/text_manipulate.js")
load ("/var/www/data_base/common/nashorn_common/file_io.js")

// ------------------------------------------------------------------
var file_name=arguments[0]
var id_in=arguments[1]
var population_in=arguments[2]

print	("*** 開始 ***")
print	("id_in = " + id_in + "\tpopulation_in = " + population_in)

var dict_in = text_read_proc (file_name)
var dict_bb = dict_update_proc (dict_in,id_in,population_in)
text_write_proc (file_name,dict_bb)

print	("*** 終了 ***")
// ------------------------------------------------------------------
