#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------    
//	redis_update.js
//
//					Jun/18/2014
//
// ------------------------------------------------------------------    
importPackage (java.io);
importPackage (java.net);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/redis_manipulate.js");
// ------------------------------------------------------------------    

print ("*** 開始 ***");

var key_in=arguments[0];
var population_in=arguments[1];

print	("key_in = " + key_in + "\tpopulation_in = " + population_in);

var echoSocket = new Socket("host_dbase",6379);
var os = new DataOutputStream(echoSocket.getOutputStream());
var is = new BufferedReader
	(new InputStreamReader (echoSocket.getInputStream()));

if (echoSocket != null && os != null && is != null)
	{
	var json_str = redis_fetch_proc (os,is,key_in);

	var unit_aa = JSON.parse (json_str);

//	unit_aa['name'] = encodeURIComponent (unit_aa['name']);
	unit_aa['name'] = escape (unit_aa['name']);
	unit_aa['population'] = population_in;
	unit_aa['date_mod'] = get_current_date_proc ();

	var json_new = JSON.stringify (unit_aa);

	print (json_str);
	print (json_new);

	redis_socket_write_proc (os,is,key_in,json_new);
	}

os.close();
is.close();
echoSocket.close();

print ("*** 終了 ***");        

// ------------------------------------------------------------------    
function redis_socket_write_proc (os,is,key_in,json_str)
{
	var value_str = new java.lang.String (json_str);

	var command = "set " + key_in + " " + value_str + "\r\n";
	print (command);

	os.writeBytes (command);

	var rec_0 = is.readLine();

	print (rec_0);
}

// ------------------------------------------------------------------    
