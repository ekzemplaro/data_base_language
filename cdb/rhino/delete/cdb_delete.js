#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------------- 
/*
	cdb_delete.js

					Jun/17/2015

*/
// ----------------------------------------------------------------------- 
importPackage (java.io)
importPackage (java.net)

importPackage (com.strangegizmo.cdb)

// ----------------------------------------------------------------------- 
print ("*** 開始 ***")

var file_cdb=arguments[0]
var key_in=arguments[1]

print	("file_cdb = " + file_cdb)
print	("key_in = " + key_in)


ee = Cdb.elements (file_cdb)

// mcached_delete_proc (server,port,key_in)

print ("*** 終了 ***")
// ----------------------------------------------------------------------- 
