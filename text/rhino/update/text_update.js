#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	text_update.js
//
//						Mar/04/2018
//
// ------------------------------------------------------------------
importPackage (java.io)
importPackage (java.lang)

load ("/var/www/data_base/common/rhino_common/file_io.js")
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")

const file_name=arguments[0]
const id_in=arguments[1]
const population_in=arguments[2]

System.err.println ("*** 開始 ***")
print	("id_in = " + id_in + "\tpopulation_in = " + population_in)

var dict_in = text_read_proc (file_name)
var dict_bb = dict_update_proc (dict_in,id_in,population_in)
text_write_proc (file_name,dict_bb)

System.err.println ("*** 終了 ***")
// ------------------------------------------------------------------
