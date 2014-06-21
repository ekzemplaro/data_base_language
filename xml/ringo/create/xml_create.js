#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	xml_create.js
//
//						Aug/06/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
var xml_manipulate = require ('/var/www/data_base/common/ringo_common/xml_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var args = require('system').args;
var file_out = args[1];

var dict_aa = data_prepare_proc ();

text_manipulate.dict_display_proc (dict_aa);

var out_str = xml_manipulate.dict_to_xml_proc (dict_aa);


text_manipulate.string_write_proc (file_out,out_str);

print	("*** 終了 ***");
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2261','静岡',63861,'1953-7-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2262','浜松',27157,'1953-11-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2263','沼津',68491,'1953-5-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2264','三島',34834,'1953-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2265','富士',45352,'1953-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2266','熱海',62472,'1953-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2267','富士宮',31291,'1953-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2268','藤枝',58296,'1953-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2269','御殿場',27457,'1953-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2270','島田',43873,'1953-12-20');

	return	dict_aa;
}

// ------------------------------------------------------------------
