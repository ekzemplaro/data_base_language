#! /usr/local/bin/ejs
// ------------------------------------------------------------------
//
//	text_update.es
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ejs_common/text_manipulate.es')
// ------------------------------------------------------------------
print	("*** 開始 ***")
var file_txt = App.args[1]
var id_in = App.args[2]
var population_in = App.args[3]
print	(id_in + "\t" + population_in)

var dict_aa = text_manipulate.text_read_proc (file_txt)
dict_aa = text_manipulate.dict_update_proc (dict_aa,id_in,population_in)
text_manipulate.dict_display_proc (dict_aa)
text_manipulate.text_write_proc (file_txt,dict_aa)

print	("*** 終了 ***")
// ------------------------------------------------------------------
