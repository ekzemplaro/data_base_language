#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	ftp_read.js
//
//						Jun/15/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------

print	("*** 開始 ***");
var args = require('system').args;
var file_in = args[1];

var client= require ("ringo/httpclient");

client.username = 'scott';
client.password = 'tiger';
print	("*** ppp ***");

// var url='ftp://scott:tiger@host_dbase/city/iwate.json';
// var url='ftp://cdbd026/city/iwate.json';
var url='ftp://host_dbase/home/scott/city/iwate.json';

print	("*** qqq ***");
var data=client.get (url);
print	("*** rrrr ***");

print (data.status);
print (data.content);

var dict_aa = JSON.parse (data.content);

text_manipulate.dict_display_proc (dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
