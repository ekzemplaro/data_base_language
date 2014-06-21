// ------------------------------------------------------------------
//
//	csv_delete.js
//
//					Feb/21/2011
//
// ------------------------------------------------------------------
importPackage (java.io);

load ("/var/www/data_base/common/rhino_common/file_io.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

var file_name=arguments[0];
var id_in=arguments[1];

print	("*** 開始 ***");
print	("id_in = " + id_in);

var dict_in = csv_read_proc (file_name);

delete dict_in[id_in];

csv_write_proc (file_name,dict_in);

dict_display_proc (dict_in);

print	("*** 終了 ***");
// ------------------------------------------------------------------
