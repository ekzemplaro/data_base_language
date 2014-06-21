#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	riak_update.js
//
//						Mar/15/2013
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var args = require('system').args;
var key_in = args[1];
var population_in = args[2];
print	(key_in + "\t" + population_in);

var client= require ("ringo/httpclient");

var url_target='http://localhost:8098/riak/shimane/' + key_in;

var data=client.get (url_target);

print (data.status);

var city = JSON.parse (data.content);

print (city.name);

city.population = population_in;
city.date_mod = text_manipulate.get_current_date_proc ();
var out_str = JSON.stringify (city);

client.put (url_target,out_str);

print	("*** 終了 ***");
// ------------------------------------------------------------------
