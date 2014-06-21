#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	webdav_update.js
//
//					Apr/10/2013
//
//
// --------------------------------------------------------------
importPackage (java.util);
importPackage (java.io);
importPackage (org.apache.commons.httpclient);
importPackage (org.apache.commons.httpclient.methods);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/net_manipulate.js");
// --------------------------------------------------------------
print ("*** 開始 ***");

var id_in=arguments[0];
var population_in=arguments[1];

print	("id_in = " + id_in + "\tpopulation_in = " + population_in);

var uri_aa = "http://cddn007:3004/city/tokyo.json";

print ("uri_aa = " + uri_aa);
var 	json_str = rest_get_proc (uri_aa,"text/json");

var dict_aa =  JSON.parse (json_str);

dict_aa = dict_update_proc (dict_aa,id_in,population_in);

dict_display_proc (dict_aa);

var str_out_aa = JSON.stringify (dict_aa);

rest_put_proc (uri_aa,str_out_aa,"text/json");

print ("***** 終了 *****");
 
// --------------------------------------------------------------
