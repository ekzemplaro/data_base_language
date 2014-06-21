#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	webdav_delete.js
//
//					Apr/10/2013
//
//
// --------------------------------------------------------------
importPackage (java.util);
importPackage (org.apache.commons.httpclient);
importPackage (org.apache.commons.httpclient.methods);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/net_manipulate.js");
// --------------------------------------------------------------
print ("*** 開始 ***");

var key_in=arguments[0];

print	("key_in = " + key_in);

var uri_aa = "http://cddn007:3004/city/tokyo.json";

print ("uri_aa = " + uri_aa);
var 	json_str = readUrl (uri_aa);

var dict_aa =  JSON.parse (json_str);


if (dict_aa[key_in])
	{
	delete dict_aa[key_in];
	dict_display_proc (dict_aa);
	json_str = JSON.stringify (dict_aa);
	rest_put_proc (uri_aa,json_str,"text/json");
	}

print ("***** 終了 *****");
 
// --------------------------------------------------------------
