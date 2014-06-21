#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	webdav_create.js
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var client= require ("ringo/httpclient");
var url='http://host_dbase:3004/city/tokyo.json';

var data=client.get (url);
var dict_org = JSON.parse (data.content);

var id_org = dict_org._id;
var rev_org = dict_org._rev;
print (id_org);
print (rev_org);

var dict_aa = data_prepare_proc ();
dict_aa._id = id_org;
dict_aa._rev = rev_org;

text_manipulate.dict_display_proc (dict_aa);

var out_str = JSON.stringify (dict_aa);

// print (out_str);

client.put (url,out_str);


print	("*** 終了 ***");
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1351','八王子',86527,'1953-8-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1352','立川',24157,'1953-11-18');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1353','武蔵野',68493,'1953-5-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1354','三鷹',34837,'1953-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1355','青梅',45352,'1953-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1356','府中',62564,'1953-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1357','昭島',33871,'1953-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1358','調布',58296,'1953-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1359','町田',27457,'1953-10-2');


	return	dict_aa;
}

// ------------------------------------------------------------------
