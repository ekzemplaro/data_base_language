#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	ftp_delete.js
//
//					Jan/26/2012
//
//
// --------------------------------------------------------------
importPackage (java.util);
importPackage (java.io);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/file_io.js");
load ("/var/www/data_base/common/rhino_common/ftp_manipulate.js");
// --------------------------------------------------------------
print ("*** 開始 ***");

var key_in=arguments[0];

print	("key_in = " + key_in);

var hostname = "host_dbase";
var user = "scott";
var passwd = "tiger";
var path_file = "city/iwate.json";

var uri_aa = "ftp://" + user + ":" + passwd;
uri_aa += "@" + hostname + "/" + path_file;

print ("uri_aa = " + uri_aa);
var 	json_str = readUrl (uri_aa);

var dict_aa =  JSON.parse (json_str);

if (dict_aa[key_in])
	{
	delete dict_aa[key_in];

	dict_display_proc (dict_aa);

	json_str = JSON.stringify (dict_aa);

	ftp_put_proc (hostname,user,passwd,path_file,json_str);
	}

print ("***** 終了 *****");
 
// --------------------------------------------------------------
