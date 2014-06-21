#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	xindice_create.js
//
//					Jun/15/2011
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

var uri_aa = "http://cdbd026:8888/xindice/db/cities/cities";

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

	dict_aa = dict_append_proc (dict_aa,'t0271','青森',86329,'1951-5-12');
	dict_aa = dict_append_proc (dict_aa,'t0272','弘前',74357,'1951-4-25');
	dict_aa = dict_append_proc (dict_aa,'t0273','八戸',68641,'1951-5-2');
	dict_aa = dict_append_proc (dict_aa,'t0274','三沢',38724,'1951-6-22');
	dict_aa = dict_append_proc (dict_aa,'t0275','黒石',43352,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t0276','むつ',68574,'1951-9-12');
	dict_aa = dict_append_proc (dict_aa,'t0277','五所川原',37981,'1951-3-21');
	dict_aa = dict_append_proc (dict_aa,'t0278','十和田',52416,'1951-7-26');
	dict_aa = dict_append_proc (dict_aa,'t0279','平川',74857,'1951-11-8');

	return	dict_aa;
}
// --------------------------------------------------------------
