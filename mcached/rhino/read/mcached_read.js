#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------------- 
/*
	mcached_read.js

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

var server = "localhost"
var port = 11211

var keys = ["t1731","t1732","t1733","t1734","t1735",
			"t1736","t1737","t1738","t1739"]

dict_aa = mcached_to_dict_proc (server,port,keys)

dict_display_proc (dict_aa)

print ("*** 終了 ***")
// ----------------------------------------------------------------------- 
