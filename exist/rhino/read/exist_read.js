#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	exist_read.js
//
//						May/23/2012
//
// ------------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/xml_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var url_in="http://localhost:8086/exist/rest/db/cities/cities.xml";

var xml_str = readUrl(url_in)

print (xml_str.length);  
// print (xml_str);  

var dict_aa = xml_to_dict_proc (xml_str);

dict_display_proc (dict_aa);

print	("*** 終了 ***");

// ------------------------------------------------------------------
