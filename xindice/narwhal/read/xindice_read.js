#! /usr/local/bin/narwhal
// ------------------------------------------------------------------
//
//	xindice_read.js
//
//						May/10/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/narwhal_common/text_manipulate.js');
var xml_manipulate = require ('/var/www/data_base/common/narwhal_common/xml_manipulate.js');
// ------------------------------------------------------------------

print	("*** 開始 ***");

url_in="http://host_xindice:8888/xindice/db/cities/cities"
lines = readUrl(url_in).split("\n");  

// lines.pop(); // <-- last item is empty... EOF?  

var xml_str = "";

for (ii in lines)
	{  
	xml_str += lines[ii];
	}

// print (lines.length);  

// print (xml_str);

var dict_aa = xml_manipulate.xml_to_dict_proc (xml_str);

text_manipulate.dict_display_proc (dict_aa);

print	("*** 終了 ***");

// ------------------------------------------------------------------
