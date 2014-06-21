#! /usr/local/bin/narwhal
// ------------------------------------------------------------------
//
//	xml_create.js
//
//						May/07/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/narwhal_common/text_manipulate.js');
var xml_manipulate = require ('/var/www/data_base/common/narwhal_common/xml_manipulate.js');
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

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2261','静岡',63861,'1952-7-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2262','浜松',20157,'1952-11-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2263','沼津',68491,'1952-5-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2264','三島',34834,'1952-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2265','富士',45352,'1952-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2266','熱海',62472,'1952-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2267','富士宮',31201,'1952-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2268','藤枝',58296,'1952-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2269','御殿場',27457,'1952-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2270','島田',43873,'1952-12-20');

	return	dict_aa;
}

// ------------------------------------------------------------------
