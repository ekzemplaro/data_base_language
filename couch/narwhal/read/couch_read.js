#! /usr/local/bin/narwhal
// ------------------------------------------------------------------
//
//	couch_read.js
//
//						May/10/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/narwhal_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");

url_in="http://host_couch:5984/city/cities";
lines = readUrl(url_in).split("\n");  
lines.pop(); // <-- last item is empty... EOF?  


print (lines.length);  
json_str = lines[0];

var dict_aa = JSON.parse (json_str);

text_manipulate.dict_display_proc (dict_aa);

print	("*** 終了 ***");

