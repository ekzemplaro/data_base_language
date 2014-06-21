#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	update/ftp_update.js
//
//					Jul/31/2011
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

var id_in=arguments[0];
var population_in=arguments[1];

print	("id_in = " + id_in + "\tpopulation_in = " + population_in);

var hostname = "host_dbase";
var user = "scott";
var passwd = "tiger";
var path_file = "city/iwate.json";

var uri_aa = "ftp://" + user + ":" + passwd;
uri_aa += "@" + hostname + "/" + path_file;

print ("uri_aa = " + uri_aa);
var 	json_str = readUrl (uri_aa);

var dict_aa =  JSON.parse (json_str);

dict_aa = dict_update_proc (dict_aa,id_in,population_in);

dict_display_proc (dict_aa);

var json_new = JSON.stringify (dict_aa);

// print	(json_new);


ftp_put_proc (hostname,user,passwd,path_file,json_new);

print ("***** 終了 *****");
 
// --------------------------------------------------------------
