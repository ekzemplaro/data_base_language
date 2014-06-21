#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	exist_create.js
//
//						May/18/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
var xml_manipulate = require ('/var/www/data_base/common/ringo_common/xml_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var client= require ("ringo/httpclient");
var url='http://localhost:8086/exist/rest/db/cities/cities.xml';

var dict_aa = data_prepare_proc ();

text_manipulate.dict_display_proc (dict_aa);

var out_str = xml_manipulate.dict_to_xml_proc (dict_aa);

// print (out_str);

client.put (url,out_str);


print	("*** 終了 ***");
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4251",'長崎',86529,'1953-7-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4252",'佐世保',23657,'1953-11-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4253",'島原',68741,'1953-5-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4254",'大村',73452,'1953-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4255",'諫早',45368,'1953-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4256",'五島',62391,'1953-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4257",'平戸',37542,'1953-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4258",'雲仙',58246,'1953-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4259",'松浦',27451,'1953-10-2');

	return	dict_aa;
}

// ------------------------------------------------------------------
