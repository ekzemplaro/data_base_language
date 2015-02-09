#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------------- 
/*
	mcachedb_delete.js

					Feb/05/2015

*/
// ----------------------------------------------------------------------- 
importPackage (java.io)
importPackage (java.net)

load ("/var/www/data_base/common/rhino_common/mcached_manipulate.js") 
// ----------------------------------------------------------------------- 
print ("*** 開始 ***")

var key_in=arguments[0]
print	("key_in = " + key_in)

var server = "host_ubuntu1"
var port = 21201

mcached_delete_proc (server,port,key_in)

print ("*** 終了 ***")

// ----------------------------------------------------------------------- 
