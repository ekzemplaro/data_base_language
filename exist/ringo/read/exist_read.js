#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	exist_read.js
//
//						May/09/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
var xml_manipulate = require ('/var/www/data_base/common/ringo_common/xml_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");

var client= require ("ringo/httpclient");

var url='http://localhost:8086/exist/rest/db/cities/cities.xml';

var data=client.get (url);

print (data.status);
// print (data.content);

var dict_aa = xml_manipulate.xml_to_dict_proc (data.content);

text_manipulate.dict_display_proc (dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
