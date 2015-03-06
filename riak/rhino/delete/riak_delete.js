#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	update/riak_delete.js
//
//					Feb/09/2015
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

var url_base = 'http://host_ubuntu1:8098/riak/shimane';
var url_target = url_base + '/' + key_in;

rest_delete_proc (url_target);

print ("***** 終了 *****");
 
// --------------------------------------------------------------
