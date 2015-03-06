#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	riak_read.js
//
//						Feb/24/2015
//
// ------------------------------------------------------------------
print	("*** 開始 ***");

var client= require ("ringo/httpclient");

var url_base='http://host_ubuntu1:8098/riak/shimane';

var url_in = url_base + '?keys=true';
var data=client.get (url_in);

var data_aa = JSON.parse (data.content);

for (var it in data_aa.keys)
	{
	var key = data_aa.keys[it];

	var url_city = url_base + '/' + key;
	var data_city=client.get (url_city);
	var city = JSON.parse (data_city.content);
	var str_out = key + '\t';
	str_out += city.name + '\t';
	str_out += city.population + '\t';
	str_out += city.date_mod;
	print (str_out);
	}

print	("*** 終了 ***");
// ------------------------------------------------------------------
