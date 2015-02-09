#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//	mcached_update.js
//
//					Feb/05/2015
// --------------------------------------------------------------
importPackage (java.util)
importPackage (java.io)
importPackage (java.net)

load ("/var/www/data_base/common/rhino_common/mcached_manipulate.js") 
load ("/var/www/data_base/common/rhino_common/text_manipulate.js") 
// --------------------------------------------------------------
print ("*** 開始 ***")

var key_in=arguments[0]
var population_in=arguments[1]
print	("key_in = " + key_in + "\tpopulation_in = " + population_in)

var server = "localhost"
var port = 11211

mcached_update_proc (server,port,key_in,population_in)

print ("*** 終了 ***")
 
// --------------------------------------------------------------
