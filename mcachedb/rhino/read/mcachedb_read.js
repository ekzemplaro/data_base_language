#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------------- 
/*
	mcachedb_read.js

					Apr/17/2013

*/
// ----------------------------------------------------------------------- 
importPackage (java.io);
importPackage (java.net);
importPackage (java.util);

load ("/var/www/data_base/common/rhino_common/mcached_manipulate.js");
// ----------------------------------------------------------------------- 
print ("*** 開始 ***");

var echoSocket = new Socket("localhost",21201);
var os = new DataOutputStream(echoSocket.getOutputStream());
var is = new BufferedReader
	(new InputStreamReader (echoSocket.getInputStream()));

print ("*** aaaa ***");
if (echoSocket != null && os != null && is != null)
	{
	var keys = ["t1521","t1522","t1523","t1524","t1525",
			"t1526","t1527","t1528","t1529",
			"t1530","t1531","t1532"];

print ("*** bbbb ***");
	for (var it in keys)
		{
		var key = keys[it]

//		print (key);

//		var json_str = socket_read_proc (key,is,os);

//		print (json_str);
		mcached_fetch_proc (os,is,key);
		}
	}

os.close();
is.close();
echoSocket.close();

print ("*** 終了 ***");
// ----------------------------------------------------------------------- 
