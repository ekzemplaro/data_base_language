#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------------- 
/*
	mcached_read.js

					Apr/17/2013

*/
// ----------------------------------------------------------------------- 
importPackage (java.io);
importPackage (java.net);
importPackage (java.util);

load ("/var/www/data_base/common/rhino_common/mcached_manipulate.js");
// ----------------------------------------------------------------------- 
print ("*** 開始 ***");

var echoSocket = new Socket("localhost",11211);
var os = new DataOutputStream(echoSocket.getOutputStream());
var is = new BufferedReader
	(new InputStreamReader (echoSocket.getInputStream()));

if (echoSocket != null && os != null && is != null)
	{
	var keys = ["t1731","t1732","t1733","t1734","t1735",
			"t1736","t1737","t1738","t1739"];

	for (var it in keys)
		{
		var key = keys[it]
		mcached_fetch_proc (os,is,key);
		}
	}

os.close();
is.close();
echoSocket.close();

print ("*** 終了 ***");
// ----------------------------------------------------------------------- 
