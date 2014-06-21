// ------------------------------------------------------------------
//
//	ftp_read.js
//
//						Jun/15/2011
//
// ------------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var url_in="ftp://scott:tiger@host_dbase/city/iwate.json";

var json_str = readUrl(url_in);

var dict_aa = JSON.parse (json_str);

dict_display_proc (dict_aa);

print	("*** 終了 ***");

// ------------------------------------------------------------------
