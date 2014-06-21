#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	xindice_delete.js
//
//					Jun/15/2011
//
//
// --------------------------------------------------------------
importPackage (java.util);
importPackage (org.apache.commons.httpclient);
importPackage (org.apache.commons.httpclient.methods);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/xml_manipulate.js");
load ("/var/www/data_base/common/rhino_common/net_manipulate.js");
// --------------------------------------------------------------
print ("*** 開始 ***");

var id_in=arguments[0];

print	("id_in = " + id_in);


var uri_aa = "http://cdbd026:8888/xindice/db/cities/cities";

print ("uri_aa = " + uri_aa);
var 	str_xml = readUrl (uri_aa);

var dict_aa = xml_to_dict_proc (str_xml);

delete dict_aa[id_in];

dict_display_proc (dict_aa);

var str_out_aa = dict_to_xml_proc (dict_aa);

rest_put_proc (uri_aa,str_out_aa,"text/xml");

print ("***** 終了 *****");
 
// --------------------------------------------------------------
