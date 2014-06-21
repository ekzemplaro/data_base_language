#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------------- 
/*
	mcachedb_delete.js

					Apr/17/2013

*/
// ----------------------------------------------------------------------- 
importPackage (java.io);
importPackage (java.net);

load ("/var/www/data_base/common/rhino_common/mcached_manipulate.js"); 
// ----------------------------------------------------------------------- 
print ("*** 開始 ***");

var key_in=arguments[0];
print	("key_in = " + key_in);

var echoSocket = new Socket("localhost",21201);
var os = new DataOutputStream(echoSocket.getOutputStream());
var is = new BufferedReader
	(new InputStreamReader (echoSocket.getInputStream()));

if (echoSocket != null && os != null && is != null)
	{
	mcached_delete_proc (os,is,key_in);
	}

os.close();
is.close();
echoSocket.close();

print ("*** 終了 ***");

// ----------------------------------------------------------------------- 
