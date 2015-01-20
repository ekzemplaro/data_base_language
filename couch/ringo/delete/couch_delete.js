#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	couch_delete.js
//
//						Dec/19/2014
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var args = require('system').args;
var key_in = args[1];
print	(key_in);

var client= require ("ringo/httpclient");

var url='http://localhost:5984/nagano/' + key_in;

print	("*** ppp ***");
var data=client.get (url);
print (data.status);
print (data.content);
var unit_aa = JSON.parse (data.content);
if ("_rev" in unit_aa)
	{
	print (unit_aa._rev);

	var url_del = url + "?rev=" + unit_aa._rev;

	client.del (url_del);
	}

print	("*** 終了 ***");
// ------------------------------------------------------------------
