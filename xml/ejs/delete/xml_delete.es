#! /usr/local/bin/ejs
// ------------------------------------------------------------------
//
//	xml_delete.es
//
//						May/29/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ejs_common/text_manipulate.es')
var xml_manipulate = require ('/var/www/data_base/common/ejs_common/xml_manipulate.es')
// ------------------------------------------------------------------
print	("*** 開始 ***")

var file_xml = App.args[1]
var key_in = App.args[2]
print	(key_in)

var str_in = readFile(file_xml)

var dict_aa =  xml_manipulate.xml_to_dict_proc (str_in)

delete dict_aa[key_in]

// text_manipulate.dict_display_proc (dict_aa)

var out_str = xml_manipulate.dict_to_xml_proc (dict_aa)

text_manipulate.string_write_proc (file_xml,out_str)

print	("*** 終了 ***")
// ------------------------------------------------------------------
