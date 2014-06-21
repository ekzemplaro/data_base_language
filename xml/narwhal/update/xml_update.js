#! /usr/local/bin/narwhal
// ------------------------------------------------------------------
//
//	xml_update.js
//
//						May/09/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/narwhal_common/text_manipulate.js');
var xml_manipulate = require ('/var/www/data_base/common/narwhal_common/xml_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");

var args = require('system').args;
var file_xml = args[1];
var id_in = args[2];
var population_in = args[3];
print	(id_in + "\t" + population_in);

var str_in = readFile(file_xml);


var dict_aa =  xml_manipulate.xml_to_dict_proc (str_in);

dict_aa = text_manipulate.dict_update_proc (dict_aa,id_in,population_in);

text_manipulate.dict_display_proc (dict_aa);

var out_str = xml_manipulate.dict_to_xml_proc (dict_aa);

text_manipulate.string_write_proc (file_xml,out_str);

print	("*** 終了 ***");
// ------------------------------------------------------------------
