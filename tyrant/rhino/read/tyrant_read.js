#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------------- 
/*
	tyrant_read.js

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
var port = 1978

var keys = ["t4761","t4762","t4763","t4764","t4765",
			"t4766","t4767","t4768","t4769"]

dict_aa = mcached_to_dict_proc (server,port,keys)

dict_display_proc (dict_aa)

print ("*** 終了 ***")

// ----------------------------------------------------------------------- 
