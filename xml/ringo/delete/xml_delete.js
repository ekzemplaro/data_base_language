#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	xml_delete.js
//
//						Dec/27/2013
//
// ------------------------------------------------------------------
var fs= require ("fs");
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
var xml_manipulate = require ('/var/www/data_base/common/ringo_common/xml_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");

var args = require('system').args;
var file_xml = args[1];
var id_in = args[2];
print	(id_in);

var str_in = fs.read (file_xml);


var dict_aa =  xml_manipulate.xml_to_dict_proc (str_in);

delete dict_aa[id_in];

text_manipulate.dict_display_proc (dict_aa);

var out_str = xml_manipulate.dict_to_xml_proc (dict_aa);

text_manipulate.string_write_proc (file_xml,out_str);

print	("*** 終了 ***");
// ------------------------------------------------------------------
