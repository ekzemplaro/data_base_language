#! /usr/bin/node
// ---------------------------------------------------------------
//	xindice_create.js
//
//					Jul/19/2012
// ---------------------------------------------------------------
var request = require('request');
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
var xml_manipulate = require('/var/www/data_base/common/node_common/xml_manipulate');
var http_manipulate = require('/var/www/data_base/common/node_common/http_manipulate');
// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0271','青森',93714,'1950-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0272','弘前',28157,'1950-3-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0273','八戸',65241,'1950-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0274','三沢',34864,'1950-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0275','黒石',49357,'1950-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0276','むつ',65292,'1950-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0277','五所川原',31251,'1950-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0278','十和田',52486,'1950-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0279','平川',26857,'1950-10-2');
	

	return	dict_aa;
}
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

dict_aa = data_prepare_proc ();

text_manipulate.dict_display_proc (dict_aa);

var out_str = xml_manipulate.dict_to_xml_proc(dict_aa);

http_manipulate.put_proc('host_dbase',8888,'/xindice/db/cities/cities',out_str);
console.log	("*** 終了 ***")

// ---------------------------------------------------------------
