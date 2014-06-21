#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//	mcachedb_create.js
//
//					Jan/07/2014
// --------------------------------------------------------------
importPackage (java.util);
importPackage (java.io);
importPackage (java.net);
 
// --------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/mcached_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
 
// --------------------------------------------------------------
print ("*** 開始 ***");

var echoSocket = new Socket("localhost",21201);
var os = new DataOutputStream(echoSocket.getOutputStream());
var is = new BufferedReader
	(new InputStreamReader (echoSocket.getInputStream())); 

var dict_aa = data_prepare_proc ();

for (var key in dict_aa)
	{
	var str_json = JSON.stringify (dict_aa[key]);
//	print (str_json);
	socket_write_proc (key,str_json,is,os);
}

os.close();
is.close();
echoSocket.close();

print ("*** 終了 ***");
 
// --------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = dict_append_proc (dict_aa,'t1521','新潟',31869,'1951-4-12');
	dict_aa = dict_append_proc (dict_aa,'t1522','長岡',74352,'1951-9-25');
	dict_aa = dict_append_proc (dict_aa,'t1523','新発田',68541,'1951-5-2');
	dict_aa = dict_append_proc (dict_aa,'t1524','上越',38724,'1951-6-22');
	dict_aa = dict_append_proc (dict_aa,'t1525','糸魚川',41352,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t1526','加茂',68574,'1951-9-12');
	dict_aa = dict_append_proc (dict_aa,'t1527','三条',37981,'1951-3-21');
	dict_aa = dict_append_proc (dict_aa,'t1528','佐渡',52416,'1951-7-26');
	dict_aa = dict_append_proc (dict_aa,'t1529','柏崎',24859,'1951-11-8');
	dict_aa = dict_append_proc (dict_aa,'t1530','村上',81725,'1951-5-4');
	dict_aa = dict_append_proc (dict_aa,'t1531','十日町',48651,'1951-7-9');
	dict_aa = dict_append_proc (dict_aa,'t1532','五泉',37492,'1951-2-15');

	return	dict_aa;
}
// --------------------------------------------------------------
