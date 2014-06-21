#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//	mcached_create.js
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

var echoSocket = new Socket("localhost",11211);
var os = new DataOutputStream(echoSocket.getOutputStream());
var is = new BufferedReader
	(new InputStreamReader (echoSocket.getInputStream())); 

var dict_aa = data_prepare_proc ();

for (var key in dict_aa)
	{
	var str_json = JSON.stringify (dict_aa[key]);
	print (str_json);

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

	dict_aa = dict_append_proc (dict_aa,'t1731','金沢',31869,'1951-10-12');
	dict_aa = dict_append_proc (dict_aa,'t1732','輪島',74357,'1951-2-25');
	dict_aa = dict_append_proc (dict_aa,'t1733','小松',65941,'1951-7-2');
	dict_aa = dict_append_proc (dict_aa,'t1734','七尾',38724,'1951-6-22');
	dict_aa = dict_append_proc (dict_aa,'t1735','珠洲',43752,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t1736','加賀',61574,'1951-9-12');
	dict_aa = dict_append_proc (dict_aa,'t1737','羽咋',32981,'1951-3-21');
	dict_aa = dict_append_proc (dict_aa,'t1738','かほく',58416,'1951-7-26');
	dict_aa = dict_append_proc (dict_aa,'t1739','白山',74851,'1951-11-8');

	return	dict_aa;
}
// --------------------------------------------------------------
