#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	update/exist_update.js
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

var id_in=arguments[0];
var population_in=arguments[1];

print	("id_in = " + id_in + "\tpopulation_in = " + population_in);

var uri = "http://localhost:8086/exist/rest/db";

var collections = "cities";
var xml_file = "cities.xml";

var uri_aa = uri + "/" + collections + "/" + xml_file;

print ("uri_aa = " + uri_aa);
var 	str_xml = readUrl (uri_aa);

var dict_aa = xml_to_dict_proc (str_xml);

dict_aa = dict_update_proc (dict_aa,id_in,population_in);

dict_display_proc (dict_aa);

var str_out_aa = dict_to_xml_proc (dict_aa);

rest_put_proc (uri_aa,str_out_aa,"text/xml");

print ("***** 終了 *****");
 
// --------------------------------------------------------------
