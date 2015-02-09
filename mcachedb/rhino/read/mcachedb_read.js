#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------------- 
/*
	mcachedb_read.js

					Feb/05/2015

*/
// ----------------------------------------------------------------------- 
importPackage (java.io)
importPackage (java.net)
importPackage (java.util)

load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
load ("/var/www/data_base/common/rhino_common/mcached_manipulate.js")
// ----------------------------------------------------------------------- 
print ("*** 開始 ***")

var server = "host_ubuntu1"
var port = 21201

var keys = ["t1521","t1522","t1523","t1524","t1525",
		"t1526","t1527","t1528","t1529","t1530","t1531","t1532"]

dict_aa = mcached_to_dict_proc (server,port,keys)

dict_display_proc (dict_aa)

print ("*** 終了 ***")
// ----------------------------------------------------------------------- 
