#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	riak_create.js
//
//					Feb/09/2015
//
//
// --------------------------------------------------------------
importPackage (java.util);
importPackage (org.apache.commons.httpclient);
importPackage (org.apache.commons.httpclient.methods);

load ("/var/www/data_base/common/rhino_common/xml_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/net_manipulate.js");
// --------------------------------------------------------------
print ("*** 開始 ***");

var url_base = 'http://host_ubuntu1:8098/riak/shimane';

	var url_in=url_base + '?keys=true';

	var json_str = readUrl(url_in);

	var data_aa = JSON.parse (json_str);

	var dict_aa = new Object ();

	for (var it in data_aa.keys)
		{
		var key = data_aa.keys[it];
		var uri_aa = url_base + '/' + key;
		rest_delete_proc (uri_aa);
		}

var dict_aa = data_prepare_proc ();

dict_display_proc (dict_aa);

for (var key in dict_aa)
	{
	var uri_aa = url_base + '/' + key;
	var str_city = JSON.stringify (dict_aa[key]);
	rest_put_proc (uri_aa,str_city,"text/json");
	}

print ("***** 終了 *****");
 
// --------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = dict_append_proc (dict_aa,'t3251','松江',59863,'1951-7-18');
	dict_aa = dict_append_proc (dict_aa,'t3252','出雲',83157,'1951-11-21');
	dict_aa = dict_append_proc (dict_aa,'t3253','大田',68741,'1951-9-2');
	dict_aa = dict_append_proc (dict_aa,'t3254','雲南',51734,'1951-3-22');
	dict_aa = dict_append_proc (dict_aa,'t3255','江津',45382,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t3256','浜田',62539,'1951-2-12');
	dict_aa = dict_append_proc (dict_aa,'t3257','益田',38271,'1951-8-21');
	dict_aa = dict_append_proc (dict_aa,'t3258','安来',58246,'1951-7-26');
	return	dict_aa;
}
// --------------------------------------------------------------
