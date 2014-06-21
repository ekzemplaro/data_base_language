#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	neo4j_read.js
//
//						Aug/30/2012
//
// ------------------------------------------------------------------
importPackage (java.io);
importPackage (org.apache.commons.httpclient);
importPackage (org.apache.commons.httpclient.methods);

load ("/var/www/data_base/common/rhino_common/net_manipulate.js");
// ------------------------------------------------------------------

print	("*** 開始 ***");

var keys = ["1","2","3","4","5","6","7","8","9"];


for (var it in keys)
	{
	var key = keys[it];
	url_in="http://localhost:7474/db/data/node/" + key + "/properties";

	lines = rest_get_proc (url_in,"text/json");
	json_parser (lines);
	}



print	("*** 終了 ***");

// ------------------------------------------------------------------
function json_parser (str_json)
{
	var unit_aa = JSON.parse (str_json);

	if ("id" in unit_aa)
		{
		var out_str = unit_aa.id + "\t" + unit_aa.name + "\t";
		out_str += unit_aa.population + "\t" + unit_aa.date_mod;
		print (out_str);
		}
}

// ------------------------------------------------------------------
