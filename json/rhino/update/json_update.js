#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	json_update.js
//
//						Mar/04/2018
//
// ------------------------------------------------------------------
importPackage (java.io)
importPackage (java.lang)

load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
load ("/var/www/data_base/common/rhino_common/file_io.js")

System.err.println ("*** 開始 ***")
const file_name=arguments[0]
const key_in=arguments[1]
const population_in=arguments[2]

print	("key_in = " + key_in + "\tpopulation_in = " + population_in)

const json_str = string_read_proc (file_name)

var dict_aa = JSON.parse (json_str)

var dict_bb = dict_update_proc (dict_aa,key_in,population_in)

const out_str = JSON.stringify (dict_bb)

string_write_proc (file_name,out_str)

System.err.println ("*** 終了 ***")
// ------------------------------------------------------------------
