#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	couch_update.js
//
//						Dec/19/2014
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

var url='http://localhost:5984/nagano/' + key_in;

print	("*** ppp ***");
var data_unit=client.get (url);
print (data_unit.content);

var unit_aa = JSON.parse (data_unit.content);

if ("_id" in unit_aa)
	{
	var str_out = key_in + "\t";
	str_out += unit_aa.name + "\t";
	str_out += unit_aa.population + "\t";
	str_out += unit_aa.date_mod;

	print (str_out);
print	("*** qqq ***");
	unit_aa.population = population_in;
	unit_aa.date_mod = text_manipulate.get_current_date_proc ();
	var out_str = JSON.stringify (unit_aa);
	client.put (url,out_str);
	}

// print (data.status);
// print (data.content);

// var unit_aa = JSON.parse (data.content);

//dict_aa = text_manipulate.dict_update_proc (dict_aa,id_in,population_in);

//text_manipulate.dict_display_proc (dict_aa);

//var out_str = JSON.stringify (dict_aa);

// print (out_str);

//client.put (url,out_str);

print	("*** 終了 ***");
// ------------------------------------------------------------------
