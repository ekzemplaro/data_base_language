#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	couch_delete.js
//
//					Jun/10/2014
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

var key_in=arguments[0];

print	("key_in = " + key_in);

var url_doc="http://localhost:5984/nagano";
var url_in= url_doc + "/" + key_in;

print ("url_in = " + url_in);

var json_str = rest_get_proc (url_in,"text/json");

var unit_aa =  JSON.parse (json_str);

if (unit_aa['_rev'])
	{
	print ("_rev = " + unit_aa['_rev']);
	var url_del = url_in + "\?rev\=" + unit_aa['_rev'];
	rest_delete_proc (url_del);
	}

print ("***** 終了 *****");
 
// --------------------------------------------------------------
