#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	xindice_update.js
//
//						May/18/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
var xml_manipulate = require ('/var/www/data_base/common/ringo_common/xml_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var args = require('system').args;
var id_in = args[1];
var population_in = args[2];
print	(id_in + "\t" + population_in);

var client= require ("ringo/httpclient");

var url='http://host_dbase:8888/xindice/db/cities/cities';

print	("*** ppp ***");
var data=client.get (url);
print	("*** qqq ***");

print (data.status);
// print (data.content);

var dict_aa = xml_manipulate.xml_to_dict_proc (data.content);

text_manipulate.dict_display_proc (dict_aa);

dict_aa = text_manipulate.dict_update_proc (dict_aa,id_in,population_in);

var out_str = xml_manipulate.dict_to_xml_proc (dict_aa);

// print (out_str);

client.put (url,out_str);

print	("*** 終了 ***");
// ------------------------------------------------------------------
