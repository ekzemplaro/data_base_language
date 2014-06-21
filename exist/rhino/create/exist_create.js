#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	exist_create.js
//
//					May/23/2012
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


var uri = "http://localhost:8086/exist/rest/db";

var collections = "cities";
var xml_file = "cities.xml";

var uri_aa = uri + "/" + collections + "/" + xml_file;

print ("uri_aa = " + uri_aa);
var 	str_xml = readUrl (uri_aa);

var dict_aa = data_prepare_proc ();

dict_display_proc (dict_aa);

var str_out_aa = dict_to_xml_proc (dict_aa);

rest_put_proc (uri_aa,str_out_aa,"text/xml");

print ("***** 終了 *****");
 
// --------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = dict_append_proc (dict_aa,'t4251','長崎',51863,'1951-7-12');
	dict_aa = dict_append_proc (dict_aa,'t4252','佐世保',74357,'1951-1-25');
	dict_aa = dict_append_proc (dict_aa,'t4253','島原',68641,'1951-5-2');
	dict_aa = dict_append_proc (dict_aa,'t4254','大村',38724,'1951-6-22');
	dict_aa = dict_append_proc (dict_aa,'t4255','諫早',43352,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t4256','五島',68574,'1951-9-12');
	dict_aa = dict_append_proc (dict_aa,'t4257','平戸',37981,'1951-3-21');
	dict_aa = dict_append_proc (dict_aa,'t4258','雲仙',52416,'1951-7-26');
	dict_aa = dict_append_proc (dict_aa,'t4259','松浦',74857,'1951-11-8');

	return	dict_aa;
}
// --------------------------------------------------------------
