#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	couch_read.js
//
//						Jun/10/2014
//
// ------------------------------------------------------------------
importPackage (java.io);

importPackage (org.apache.commons.httpclient);
importPackage (org.apache.commons.httpclient.methods);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/net_manipulate.js");
// ------------------------------------------------------------------
print	("*** 開始 ***");

var url_doc="http://localhost:5984/nagano";
var url_in= url_doc + "/_all_docs";

var json_str = rest_get_proc (url_in,"text/json");

var keys = JSON.parse (json_str);

if (keys.rows)
{
for (var it in keys.rows)
	{
	var key = keys.rows[it].key;
	url_in = url_doc + "/" + key;
	json_str = readUrl(url_in);
	unit_aa = JSON.parse (json_str);
	var out_str = unit_aa._id + '\t';
	out_str += unit_aa.name + '\t';
	out_str += unit_aa.population + '\t';
	out_str += unit_aa.date_mod;
	print (out_str);
	}
}
print	("*** 終了 ***");

// ------------------------------------------------------------------
