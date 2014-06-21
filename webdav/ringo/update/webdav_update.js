#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	webdav_update.js
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var args = require('system').args;
var id_in = args[1];
var population_in = args[2];
print	(id_in + "\t" + population_in);

var client= require ("ringo/httpclient");

var url='http://host_dbase:3004/city/tokyo.json';

print	("*** ppp ***");
var data=client.get (url);
print	("*** qqq ***");

print (data.status);
// print (data.content);

var dict_aa = JSON.parse (data.content);

dict_aa = text_manipulate.dict_update_proc (dict_aa,id_in,population_in);

text_manipulate.dict_display_proc (dict_aa);

var out_str = JSON.stringify (dict_aa);

// print (out_str);

client.put (url,out_str);

print	("*** 終了 ***");
// ------------------------------------------------------------------
