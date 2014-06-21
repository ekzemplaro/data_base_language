#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	webdav_create.js
//
//					Apr/10/2013
//
//
// --------------------------------------------------------------
importPackage (java.util);
importPackage (org.apache.commons.httpclient);
importPackage (org.apache.commons.httpclient.methods);

load ("/var/www/data_base/common/rhino_common/xml_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/net_manipulate.js");
// --------------------------------------------------------------
print ("*** 開始 ***");

var uri_aa = "http://cddn007:3004/city/tokyo.json";

var dict_aa = data_prepare_proc ();

dict_display_proc (dict_aa);

var str_out_aa = JSON.stringify (dict_aa);

rest_put_proc (uri_aa,str_out_aa,"application/json");

print ("***** 終了 *****");
 
// --------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = dict_append_proc (dict_aa,'t1351','八王子',83924,'1951-4-18');
	dict_aa = dict_append_proc (dict_aa,'t1352','立川',24157,'1951-11-21');
	dict_aa = dict_append_proc (dict_aa,'t1353','武蔵野',68741,'1951-5-2');
	dict_aa = dict_append_proc (dict_aa,'t1354','三鷹',14738,'1951-6-22');
	dict_aa = dict_append_proc (dict_aa,'t1355','青梅',49354,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t1356','府中',67563,'1951-9-12');
	dict_aa = dict_append_proc (dict_aa,'t1357','昭島',35271,'1951-3-21');
	dict_aa = dict_append_proc (dict_aa,'t1358','調布',58246,'1951-7-26');
	dict_aa = dict_append_proc (dict_aa,'t1359','町田',27459,'1951-10-2');

	return	dict_aa;
}
// --------------------------------------------------------------
