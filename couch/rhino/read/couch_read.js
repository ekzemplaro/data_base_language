#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	couch_read.js
//
//						May/07/2015
//
// ------------------------------------------------------------------
importPackage (java.io);

importPackage (org.apache.commons.httpclient);
importPackage (org.apache.commons.httpclient.methods);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/net_manipulate.js");
// ------------------------------------------------------------------
function couch_to_dict_proc (url_in)
{
	var dict_aa = new Object ();

	var url_all_docs= url_in + "/_all_docs?include_docs=true";

	var json_str = rest_get_proc (url_all_docs,"text/json");

	var doc_all = JSON.parse (json_str);

	if (doc_all.rows)
	{
	for (var it in doc_all.rows)
		{
		var key = doc_all.rows[it].key;
		var unit_aa = doc_all.rows[it].doc;

		dict_aa[key] = unit_aa;
		}
	}

	return	dict_aa;
}

// ------------------------------------------------------------------
print	("*** 開始 ***");

var url_in="http://localhost:5984/nagano";

var dict_aa = couch_to_dict_proc (url_in);

dict_display_proc (dict_aa);

print	("*** 終了 ***");

// ------------------------------------------------------------------
