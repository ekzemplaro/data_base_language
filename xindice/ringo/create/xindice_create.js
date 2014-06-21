#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	xindice_create.js
//
//						Jul/10/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
var xml_manipulate = require ('/var/www/data_base/common/ringo_common/xml_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var client= require ("ringo/httpclient");
var url='http://host_dbase:8888/xindice/db/cities/cities';


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

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0271",'青森',61865,'1953-7-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0272",'弘前',28157,'1953-11-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0273",'八戸',68741,'1953-5-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0274",'三沢',34734,'1953-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0275",'黒石',45352,'1953-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0276",'むつ',62742,'1953-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0277",'五所川原',35281,'1953-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0278",'十和田',58246,'1953-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0279",'平川',27451,'1953-10-2');


	return	dict_aa;
}

// ------------------------------------------------------------------
