#! /usr/local/bin/narwhal
// ------------------------------------------------------------------
//
//	xml_read.js
//
//						May/09/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/narwhal_common/text_manipulate.js');
var xml_manipulate = require ('/var/www/data_base/common/narwhal_common/xml_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");

var args = require('system').args;
var file_in = args[1];

var str_in = readFile(file_in);

var dict_aa =  xml_manipulate.xml_to_dict_proc (str_in);

text_manipulate.dict_display_proc (dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
