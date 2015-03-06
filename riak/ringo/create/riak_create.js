#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	riak_create.js
//
//						Feb/24/2015
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var client= require ("ringo/httpclient");

var dict_aa = data_prepare_proc ();

for (var key in dict_aa)
	{
	var out_str = JSON.stringify (dict_aa[key])

	var url_city = 'http://host_ubuntu1:8098/riak/shimane/' + key;
	client.put (url_city,out_str);
	}

print	("*** 終了 ***");
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3251','松江',79165,'1953-3-25');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3252','出雲',24857,'1953-11-18');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3253','大田',65291,'1953-5-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3254','雲南',54917,'1953-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3255','江津',47352,'1953-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3256','浜田',12564,'1953-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3257','益田',93871,'1953-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3258','安来',51796,'1953-7-26');


	return	dict_aa;
}

// ------------------------------------------------------------------
