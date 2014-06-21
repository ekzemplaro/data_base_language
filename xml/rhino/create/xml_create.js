// ------------------------------------------------------------------
//
//	rhino/create/xml_create.js
//
//						Aug/06/2011
//
// ------------------------------------------------------------------
importPackage (java.io);
load ("/var/www/data_base/common/rhino_common/file_io.js");
load ("/var/www/data_base/common/rhino_common/xml_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

var file_out=arguments[0];

print	("*** 開始 ***");

var dict_aa = data_prepare_proc ();

var out_str = dict_to_xml_proc (dict_aa);

string_write_proc (file_out,out_str);

print	("*** 終了 ***");

// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = dict_append_proc (dict_aa,'t2261','静岡',51863,'1951-4-21');
	dict_aa = dict_append_proc (dict_aa,'t2262','浜松',74157,'1951-1-25');
	dict_aa = dict_append_proc (dict_aa,'t2263','沼津',68241,'1951-5-2');
	dict_aa = dict_append_proc (dict_aa,'t2264','三島',38624,'1951-6-22');
	dict_aa = dict_append_proc (dict_aa,'t2265','富士',43952,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t2266','熱海',68274,'1951-9-12');
	dict_aa = dict_append_proc (dict_aa,'t2267','富士宮',37281,'1951-3-21');
	dict_aa = dict_append_proc (dict_aa,'t2268','藤枝',52416,'1951-7-26');
	dict_aa = dict_append_proc (dict_aa,'t2269','御殿場',74857,'1951-11-8');
	dict_aa = dict_append_proc (dict_aa,'t2270','島田',91865,'1951-12-21');

	return	dict_aa;
}

// ------------------------------------------------------------------
