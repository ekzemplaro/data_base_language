#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------------- 
/*
	redis_delete.js

					Apr/17/2013

*/
// ----------------------------------------------------------------------- 
importPackage (java.io);
importPackage (java.net);

 
// ----------------------------------------------------------------------- 
print ("*** 開始 ***");

var key_in=arguments[0];
print	("key_in = " + key_in);

var echoSocket = new Socket("host_dbase",6379);
var os = new DataOutputStream(echoSocket.getOutputStream());
var is = new BufferedReader
	(new InputStreamReader (echoSocket.getInputStream()));

if (echoSocket != null && os != null && is != null)
	{
	redis_delete_proc (os,is,key_in);
	}

os.close();
is.close();
echoSocket.close();

print ("*** 終了 ***");
// ----------------------------------------------------------------------- 
function redis_delete_proc (os,is,key_in)
{
	os.writeBytes("del " + key_in + "\r\n"); 
	var responseLine = is.readLine();
        print (responseLine);
}

// ----------------------------------------------------------------------- 
