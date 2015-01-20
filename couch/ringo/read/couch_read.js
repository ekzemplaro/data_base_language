#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	couch_read.js
//
//						Dec/19/2014
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");

var client= require ("ringo/httpclient");

var url='http://localhost:5984/nagano';

var data=client.get (url + "/_all_docs");

var data_aa = JSON.parse (data.content);

for (var it in data_aa.rows)
	{
	var key = data_aa.rows[it].key;
	var data_unit =client.get (url + "/" + key);
	var data_unit_aa = JSON.parse (data_unit.content);
	var str_out = key + "\t";
	str_out += data_unit_aa.name + "\t";
	str_out += data_unit_aa.population + "\t";
	str_out += data_unit_aa.date_mod;

	print (str_out);
	}

print	("*** 終了 ***");
// ------------------------------------------------------------------
