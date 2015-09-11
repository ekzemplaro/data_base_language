#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	json_update.js
//
//						Aug/07/2015
//
// ------------------------------------------------------------------
importPackage (java.io)

load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
load ("/var/www/data_base/common/rhino_common/file_io.js")

print	("*** 開始 ***")
var file_name=arguments[0]
var key_in=arguments[1]
var population_in=arguments[2]

print	("key_in = " + key_in + "\tpopulation_in = " + population_in)

var json_str = string_read_proc (file_name)

var dict_aa = JSON.parse (json_str)

var dict_bb = dict_update_proc (dict_aa,key_in,population_in)

var out_str = JSON.stringify (dict_bb)

string_write_proc (file_name,out_str)

print	("*** 終了 ***")
// ------------------------------------------------------------------
