#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	update/couch_update.js
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
var population_in=arguments[1];

print	("key_in = " + key_in + "\tpopulation_in = " + population_in);

var url_doc="http://localhost:5984/nagano";
var url_in= url_doc + "/" + key_in;

print ("url_in = " + url_in);

var 	json_str = rest_get_proc (url_in,"text/json");
print (json_str);

var unit_aa =  JSON.parse (json_str);

if (unit_aa['_rev'])
{
print ("_rev = " + unit_aa['_rev']);

unit_aa.population = population_in;
unit_aa.date_mod = get_current_date_proc ();

var str_out_aa = JSON.stringify (unit_aa);

rest_put_proc (url_in,str_out_aa,"text/json");
}

print ("***** 終了 *****");
 
// --------------------------------------------------------------
