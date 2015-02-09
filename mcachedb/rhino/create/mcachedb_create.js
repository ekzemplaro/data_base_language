#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//	mcachedb_create.js
//
//					Feb/05/2015
// --------------------------------------------------------------
importPackage (java.util)
importPackage (java.io)
importPackage (java.net)
 
// --------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/mcached_manipulate.js")
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
 
// --------------------------------------------------------------
print ("*** 開始 ***")

var server = "host_ubuntu1"
var port = 21201

var dict_aa = data_prepare_proc ()

dict_to_mcached_proc (server,port,dict_aa)


print ("*** 終了 ***")
 
// --------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = dict_append_proc (dict_aa,'t1521','新潟',21869,'1951-4-12')
	dict_aa = dict_append_proc (dict_aa,'t1522','長岡',94352,'1951-9-25')
	dict_aa = dict_append_proc (dict_aa,'t1523','新発田',68541,'1951-5-2')
	dict_aa = dict_append_proc (dict_aa,'t1524','上越',38724,'1951-6-22')
	dict_aa = dict_append_proc (dict_aa,'t1525','糸魚川',41352,'1951-8-14')
	dict_aa = dict_append_proc (dict_aa,'t1526','加茂',68574,'1951-9-12')
	dict_aa = dict_append_proc (dict_aa,'t1527','三条',37981,'1951-3-21')
	dict_aa = dict_append_proc (dict_aa,'t1528','佐渡',52416,'1951-7-26')
	dict_aa = dict_append_proc (dict_aa,'t1529','柏崎',24859,'1951-11-8')
	dict_aa = dict_append_proc (dict_aa,'t1530','村上',81725,'1951-5-4')
	dict_aa = dict_append_proc (dict_aa,'t1531','十日町',48651,'1951-7-9')
	dict_aa = dict_append_proc (dict_aa,'t1532','五泉',37492,'1951-2-15')

	return	dict_aa
}
// --------------------------------------------------------------
