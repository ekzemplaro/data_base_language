#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	riak_read.js
//
//						Apr/08/2013
//
// ------------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
// ------------------------------------------------------------------
print	("*** 開始 ***");

var url_base="http://host_ubuntu1:8098/riak/shimane";

dict_aa = riak_to_dict_proc (url_base);

dict_display_proc (dict_aa);

print	("*** 終了 ***");

// ------------------------------------------------------------------
function riak_to_dict_proc (url_base)
{
	var url_in=url_base + '?keys=true';

	var json_str = readUrl(url_in);

	var data_aa = JSON.parse (json_str);

	var dict_aa = new Object ();

	for (var it in data_aa.keys)
		{
		var key = data_aa.keys[it];
		var url_city = url_base + '/' + key;
		var json_city = readUrl(url_city);
		var city = JSON.parse (json_city);
		dict_aa[key] = city;
		}

	return	dict_aa;
}


// ------------------------------------------------------------------
