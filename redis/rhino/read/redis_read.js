#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------------- 
/*
	redis_read.js

					Jan/27/2014

*/
// ----------------------------------------------------------------------- 
importPackage (java.io);
importPackage (java.net);
importPackage (java.util);

load ("/var/www/data_base/common/rhino_common/redis_manipulate.js");
// ----------------------------------------------------------------------- 
print ("*** 開始 ***");

var echoSocket = new Socket("host_dbase",6379);
var os = new DataOutputStream(echoSocket.getOutputStream());
var is = new BufferedReader
	(new InputStreamReader (echoSocket.getInputStream()));

if (echoSocket != null && os != null && is != null)
	{
	var keys = redis_keys_fetch_proc (os,is);

	for (var it in keys)
		{
		var key = keys[it]
		redis_fetch_proc (os,is,key);
		}
	}

os.close();
is.close();
echoSocket.close();

print ("*** 終了 ***");
// ----------------------------------------------------------------------- 
