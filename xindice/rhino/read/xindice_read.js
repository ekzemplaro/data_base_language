// ------------------------------------------------------------------
//
//	xindice_read.js
//
//						Jun/14/2011
//
// ------------------------------------------------------------------
load ('/var/www/data_base/common/rhino_common/xml_manipulate.js');
load ('/var/www/data_base/common/rhino_common/text_manipulate.js');

print	("*** 開始 ***");

var url_in="http://host_dbase:8888/xindice/db/cities/cities"


var xml_str  = readUrl(url_in);
// print (xml_str);
var dict_aa = xml_to_dict_proc (xml_str);

dict_display_proc (dict_aa);

print	("*** 終了 ***");

// ------------------------------------------------------------------
