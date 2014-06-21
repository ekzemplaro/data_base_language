#! /usr/local/bin/ejs
// ------------------------------------------------------------------
//
//	xml_read.es
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ejs_common/text_manipulate.es')
var xml_manipulate = require ('/var/www/data_base/common/ejs_common/xml_manipulate.es')
// ------------------------------------------------------------------
print	("*** 開始 ***")

var file_in = App.args[1]

var str_in = readFile(file_in)

var dict_aa =  xml_manipulate.xml_to_dict_proc (str_in)

text_manipulate.dict_display_proc (dict_aa)

print	("*** 終了 ***")
// ------------------------------------------------------------------
