#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	couch_create.js
//
//						Dec/19/2014
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var client= require ("ringo/httpclient");
var url='http://localhost:5984/nagano';

client.del (url);
client.put (url);

var dict_aa = data_prepare_proc ();

for (var key in dict_aa)
	{
	print (key);
	var unit_aa = dict_aa[key];
	var out_str = JSON.stringify (unit_aa);
	var url_target = url + "/" + key;
	client.put (url_target,out_str);
	}

print	("*** 終了 ***");
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2021','長野',73865,'1953-8-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2022','松本',24157,'1953-11-18');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2023','上田',68491,'1953-5-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2024','小諸',54837,'1953-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2025','岡谷',47352,'1953-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2026','塩尻',12564,'1953-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2027','茅野',93871,'1953-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2028','飯田',58296,'1953-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2029','中野',28457,'1953-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2030','諏訪',45873,'1953-12-20');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2031','駒ヶ根',91857,'1953-2-7');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2032','佐久',23954,'1953-5-17');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2033','伊那',81675,'1953-6-19');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2034','千曲',72548,'1953-10-14');


	return	dict_aa;
}

// ------------------------------------------------------------------
