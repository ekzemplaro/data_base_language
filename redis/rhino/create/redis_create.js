#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// -------------------------------------------------------------
//
//	redis_create.js
//
//						Jun/17/2014
// -------------------------------------------------------------
importPackage (java.util);
importPackage (java.io);
importPackage (java.net);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
// -------------------------------------------------------------
print ("*** 開始 ***");

var dict_aa = data_prepare_proc ();

var echoSocket = new Socket("host_dbase",6379);
var os = new DataOutputStream(echoSocket.getOutputStream());
var is = new BufferedReader
	(new InputStreamReader (echoSocket.getInputStream()));

for (var key in dict_aa)
	{
	var str_json = JSON.stringify (dict_aa[key]);

	redis_socket_write_proc (key,str_json,is,os);
	}

os.close ();
is.close ();
echoSocket.close ();

print ("*** 終了 ***");

// -------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = dict_append_proc (dict_aa,'t1851','福井',86321,'1951-2-15');
//	dict_aa = dict_append_proc (dict_aa,'t1851','Fukui',87521,'1951-2-15');
	dict_aa = dict_append_proc (dict_aa,'t1852','敦賀',71354,'1951-8-25');

//	dict_aa = dict_append_proc (dict_aa,'t1853','小浜',64137,'1951-9-12');
	dict_aa = dict_append_proc (dict_aa,'t1853','Obama',28139,'1951-9-12');
	dict_aa = dict_append_proc (dict_aa,'t1854','大野',31724,'1951-1-22');
	dict_aa = dict_append_proc (dict_aa,'t1855','勝山',43952,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t1856','鯖江',68574,'1951-9-12');
	dict_aa = dict_append_proc (dict_aa,'t1857','あわら',37981,'1951-3-21');
	dict_aa = dict_append_proc (dict_aa,'t1858','越前',52416,'1951-7-26');
	dict_aa = dict_append_proc (dict_aa,'t1859','坂井',14257,'1951-11-8');

	return	dict_aa;
}

// -------------------------------------------------------------
function redis_socket_write_proc (key_in,value_in,is,os)
{
	print (value_in);
	var value_str = new java.lang.String (value_in);
	var llx = value_str.getBytes().length;

	var command = "set " + key_in + " " + value_in + "\r\n";
//	var command = "set " + key_in + " " + value_str.getBytes("UTF-8") + "\r\n";
	os.writeBytes (command);

	var rec_0 = is.readLine();
}
// -------------------------------------------------------------
