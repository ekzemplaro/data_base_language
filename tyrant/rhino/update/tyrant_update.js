#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//	tyrant_update.js
//
//					Jan/07/2014
// --------------------------------------------------------------
importPackage (java.util);
importPackage (java.io);
importPackage (java.net);

load ("/var/www/data_base/common/rhino_common/mcached_manipulate.js"); 
load ("/var/www/data_base/common/rhino_common/text_manipulate.js"); 
// --------------------------------------------------------------
 
print ("*** 開始 ***");

var key_in=arguments[0];
var population_in=arguments[1];
print	("key_in = " + key_in + "\tpopulation_in = " + population_in);

var echoSocket = new Socket("localhost",1978);
var os = new DataOutputStream(echoSocket.getOutputStream());
var is = new BufferedReader
	(new InputStreamReader (echoSocket.getInputStream())); 

var json_str = socket_read_proc (key_in,is,os);

print (json_str);

if (json_str != null)
	{
	var unit_aa = JSON.parse (json_str);
//	var name = escape_unicode_proc (unit_aa["name"]);

//	print (name);

//	unit_aa['name'] = name;
//	unit_aa['name'] = "\u73e0\u6d32";
	unit_aa['population'] = population_in;
	unit_aa['date_mod'] = get_current_date_proc ();

	print ("key_in = " + key_in);

	var json_new = JSON.stringify (unit_aa);

	print (json_new);

	socket_write_proc (key_in,json_new,is,os);
}

print ("*** qqqq ***");

os.close();
is.close();
echoSocket.close();

print ("*** 終了 ***");
 
// --------------------------------------------------------------
