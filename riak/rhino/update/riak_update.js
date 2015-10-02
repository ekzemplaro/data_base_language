#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	update/riak_update.js
//
//					Sep/22/2015
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

// var url_base = 'http://host_ubuntu:8098/riak/shimane';
var url_base = 'http://cddn007-ee:8098/riak/shimane';

var url_target = url_base + '/' + key_in;

var 	json_city = rest_get_proc (url_target,"text/json");

var city = JSON.parse (json_city);

print (city.name);

city.population = population_in;
city.date_mod = get_current_date_proc ();

var json_new = JSON.stringify (city);

rest_put_proc (url_target,json_new,"text/json");

print ("***** 終了 *****");
 
// --------------------------------------------------------------
