#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------------- 
/*
	tyrant_read.js

					Apr/17/2013

*/
// ----------------------------------------------------------------------- 
importPackage (java.io);
importPackage (java.net);
importPackage (java.util);

// ----------------------------------------------------------------------- 
print ("*** 開始 ***");

var echoSocket = new Socket("localhost",1978);
var os = new DataOutputStream(echoSocket.getOutputStream());
var is = new BufferedReader
	(new InputStreamReader (echoSocket.getInputStream()));

if (echoSocket != null && os != null && is != null)
	{
	var keys = ["t4761","t4762","t4763","t4764","t4765",
			"t4766","t4767","t4768","t4769"];

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
function mcached_fetch_proc (os,is,key_in)
{

	os.writeBytes("get " + key_in + "\n"); 
	var responseLine = is.readLine();

//	print (responseLine);

	if (0 <= responseLine.indexOf ("VALUE"))
	{

	responseLine = is.readLine();
//	print (responseLine);

	if (responseLine != null)
		{
		var unit_aa = JSON.parse (responseLine);
		var name = unit_aa["name"];
		var population = unit_aa["population"];
		var date_mod = unit_aa["date_mod"];

		var out_str = key + "\t" + name + "\t";
		out_str += population + "\t" + date_mod;
		print (out_str);
		}

	responseLine = is.readLine();
	}
}
// ----------------------------------------------------------------------- 
