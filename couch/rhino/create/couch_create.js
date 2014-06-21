#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	couch_create.js
//
//					Jun/10/2014
//
//
// --------------------------------------------------------------
importPackage (java.io);
importPackage (org.apache.commons.httpclient);
importPackage (org.apache.commons.httpclient.methods);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/net_manipulate.js");
// --------------------------------------------------------------
print ("*** 開始 ***");

var url_doc="http://localhost:5984/nagano";

rest_delete_proc (url_doc);
rest_put_proc (url_doc,"{}","test/json");

var dict_aa = data_prepare_proc ();

for (var key in dict_aa)
	{
	var url_aa = url_doc + "/" + key;

	var str_out_aa = JSON.stringify (dict_aa[key]);

	rest_put_proc (url_aa,str_out_aa,"text/json");
	} 

print ("*** 終了 ***");
 
// --------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

dict_aa = dict_append_proc (dict_aa,'t2021','長野',41862,'1951-7-18');
	dict_aa = dict_append_proc (dict_aa,'t2022','松本',29357,'1951-9-15');
	dict_aa = dict_append_proc (dict_aa,'t2023','上田',63741,'1951-2-2');
	dict_aa = dict_append_proc (dict_aa,'t2024','小諸',51734,'1951-3-22');
	dict_aa = dict_append_proc (dict_aa,'t2025','岡谷',45382,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t2026','塩尻',62539,'1951-2-12');
	dict_aa = dict_append_proc (dict_aa,'t2027','茅野',38271,'1951-3-21');
	dict_aa = dict_append_proc (dict_aa,'t2028','飯田',58246,'1951-7-26');
	dict_aa = dict_append_proc (dict_aa,'t2029','中野',27451,'1951-10-2');
	dict_aa = dict_append_proc (dict_aa,'t2030','諏訪',49873,'1951-12-20');
	dict_aa = dict_append_proc (dict_aa,'t2031','駒ヶ根',51857,'1951-2-7');
	dict_aa = dict_append_proc (dict_aa,'t2032','佐久',92394,'1951-5-17');
	dict_aa = dict_append_proc (dict_aa,'t2033','伊那',81375,'1951-6-19');
	dict_aa = dict_append_proc (dict_aa,'t2034','千曲',62148,'1951-10-14');

	return	dict_aa;
}
// --------------------------------------------------------------
