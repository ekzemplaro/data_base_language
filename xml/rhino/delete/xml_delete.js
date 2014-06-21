// ------------------------------------------------------------------
//
//	xml_delete.js
//
//						May/10/2011
//
// ------------------------------------------------------------------
importPackage (java.io);

load ("/var/www/data_base/common/rhino_common/xml_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/file_io.js");

print	("*** 開始 ***");
var file_name=arguments[0];
var id_in=arguments[1];
print	(id_in);

var xml_str = string_read_proc (file_name);

var dict_aa = xml_to_dict_proc (xml_str);

delete dict_aa[id_in];

var xml_str_out = dict_to_xml_proc (dict_aa);

string_write_proc (file_name,xml_str_out);

print	("*** 終了 ***");
// ------------------------------------------------------------------
