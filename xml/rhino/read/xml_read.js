#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	xml_read.js
//
//					May/09/2011
//
// ------------------------------------------------------------------
importPackage (java.io);
load ('/var/www/data_base/common/rhino_common/xml_manipulate.js');
load ('/var/www/data_base/common/rhino_common/text_manipulate.js');
load ('/var/www/data_base/common/rhino_common/file_io.js');

var file_name=arguments[0];

print	("*** 開始 ***");

var str_in = string_read_proc (file_name);

print	("*** ppp ***");
var dict_aa = xml_to_dict_proc (str_in);

dict_display_proc (dict_aa);

// print (str_in);

//xml_parse_proc (str_in);

print	("*** 終了 ***");
// ------------------------------------------------------------------
