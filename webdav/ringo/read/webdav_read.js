#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	webdav_read.js
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");

var client= require ("ringo/httpclient");

var url='http://host_dbase:3004/city/tokyo.json';

print	("*** ppp ***");
var data=client.get (url);
print	("*** qqq ***");

print (data.status);
// print (data.content);

var dict_aa = JSON.parse (data.content);

text_manipulate.dict_display_proc (dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
