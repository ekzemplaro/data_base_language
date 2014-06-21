#! /usr/bin/node
// ---------------------------------------------------------------
//	exist_create.js
//
//					Sep/19/2011
// ---------------------------------------------------------------
var request = require('request');
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
var xml_manipulate = require('/var/www/data_base/common/node_common/xml_manipulate');
var http_manipulate = require('/var/www/data_base/common/node_common/http_manipulate');
// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4251','長崎',93714,'1950-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4252','佐世保',28157,'1950-3-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4253','島原',65241,'1950-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4254','大村',34864,'1950-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4255','諫早',49357,'1950-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4256','五島',65292,'1950-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4257','平戸',31251,'1950-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4258','雲仙',52486,'1950-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4259','松浦',26857,'1950-10-2');
	

	return	dict_aa;
}
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

dict_aa = data_prepare_proc ();

text_manipulate.dict_display_proc (dict_aa);

var out_str = xml_manipulate.dict_to_xml_proc(dict_aa);
http_manipulate.put_proc('localhost',8086,'/exist/rest/cities/cities.xml',out_str);
console.log	("*** 終了 ***")

// ---------------------------------------------------------------
