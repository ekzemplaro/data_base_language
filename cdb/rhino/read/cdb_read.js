#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------------- 
/*
	cdb_read.js

					Jun/17/2015

*/
// ----------------------------------------------------------------------- 
importPackage (com.strangegizmo.cdb)

load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
// ----------------------------------------------------------------------- 
print ("*** 開始 ***")

file_cdb=arguments[0]

print (file_cdb)

ee = Cdb.elements (file_cdb)

var dict_aa = new Object ()

while (ee.hasMoreElements())
	{
	element = ee.nextElement()
	key_byte = element.getKey()
	key = new java.lang.String (key_byte)
	data_byte = element.getData()
	str_json = new java.lang.String (data_byte)

	unit_aa = JSON.parse (str_json)
	dict_aa[key] = unit_aa
	}

dict_display_proc (dict_aa)

print ("*** 終了 ***")
// ----------------------------------------------------------------------- 
