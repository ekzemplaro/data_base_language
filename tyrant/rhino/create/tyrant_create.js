#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//	tyrant_create.js
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
var port = 1978

var dict_aa = data_prepare_proc ()

dict_to_mcached_proc (server,port,dict_aa)

print ("*** 終了 ***")
 
// --------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = dict_append_proc (dict_aa,'t4761','那覇',81974,'1951-9-18')
	dict_aa = dict_append_proc (dict_aa,'t4762','宜野湾',92357,'1951-3-25')
	dict_aa = dict_append_proc (dict_aa,'t4763','石垣',62841,'1951-5-2')
	dict_aa = dict_append_proc (dict_aa,'t4764','浦添',35724,'1951-6-22')
	dict_aa = dict_append_proc (dict_aa,'t4765','名護',43152,'1951-10-14')
	dict_aa = dict_append_proc (dict_aa,'t4766','糸満',68514,'1951-2-12')
	dict_aa = dict_append_proc (dict_aa,'t4767','沖縄',37981,'1951-3-21')
	dict_aa = dict_append_proc (dict_aa,'t4768','豊見城',52416,'1951-7-26')
	dict_aa = dict_append_proc (dict_aa,'t4769','うるま',74357,'1951-11-8')

	return	dict_aa
}
// --------------------------------------------------------------
