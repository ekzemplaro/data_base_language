#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	webdav_read.js
//
//						Jan/26/2012
//
// ------------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
// ------------------------------------------------------------------
print	("*** 開始 ***");

var url_in="http://host_dbase:3004/city/tokyo.json";

var json_str = readUrl(url_in);

var dict_aa = JSON.parse (json_str);

dict_display_proc (dict_aa);

print	("*** 終了 ***");

// ------------------------------------------------------------------
