#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	riak_create.js
//
//					Sep/22/2015
//
// ---------------------------------------------------------------
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
var http_manipulate = require('/var/www/data_base/common/node_common/http_manipulate');
// ---------------------------------------------------------------
var http = require('http');

console.log ("*** 開始 ***");
//
var dict_aa = data_prepare_proc ();


for (var key in dict_aa)
	{
	var json_str = JSON.stringify (dict_aa[key]);

	http_manipulate.put_proc
		('host_ubuntu',8098,'/riak/shimane/' + key,json_str);
	}

console.log ("*** 終了 ***");

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3251','松江',38514,'1950-3-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3252','出雲',15327,'1950-8-11');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3253','大田',64871,'1950-11-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3254','雲南',86934,'1950-9-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3255','江津',45618,'1950-2-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3256','浜田',65792,'1950-1-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3257','益田',38251,'1950-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3258','安来',52486,'1950-7-26');

	return	dict_aa;
}	

// ---------------------------------------------------------------
