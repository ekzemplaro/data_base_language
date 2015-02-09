#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//	mcached_create.js
//
//					Jan/07/2014
// --------------------------------------------------------------
importPackage (java.util)
importPackage (java.io)
importPackage (java.net)
 
// --------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/mcached_manipulate.js")
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
 
// --------------------------------------------------------------
print ("*** 開始 ***")

var server = "localhost"
var port = 11211

var dict_aa = data_prepare_proc ()

dict_to_mcached_proc (server,port,dict_aa)

print ("*** 終了 ***")
 
// --------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = dict_append_proc (dict_aa,'t1731','金沢',31879,'1951-10-12')
	dict_aa = dict_append_proc (dict_aa,'t1732','輪島',24357,'1951-2-25')
	dict_aa = dict_append_proc (dict_aa,'t1733','小松',65941,'1951-7-2')
	dict_aa = dict_append_proc (dict_aa,'t1734','七尾',38124,'1951-6-22')
	dict_aa = dict_append_proc (dict_aa,'t1735','珠洲',43792,'1951-8-14')
	dict_aa = dict_append_proc (dict_aa,'t1736','加賀',61524,'1951-9-12')
	dict_aa = dict_append_proc (dict_aa,'t1737','羽咋',32981,'1951-3-21')
	dict_aa = dict_append_proc (dict_aa,'t1738','かほく',58416,'1951-7-26')
	dict_aa = dict_append_proc (dict_aa,'t1739','白山',74851,'1951-11-8')

	return	dict_aa
}
// --------------------------------------------------------------
