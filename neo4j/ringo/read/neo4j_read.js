#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	neo4j_read.js
//
//						Aug/30/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
function neo4j_get_record_proc (dict_aa,nn)
{
	var client= require ("ringo/httpclient");
	var url='http://localhost:7474/db/data/node/' + nn + '/properties';
	var data=client.get (url);

//	print (data.content);

	var dd_aa = JSON.parse (data.content);

	if ("id" in dd_aa)
		{
		dict_aa = text_manipulate.dict_append_proc
			(dict_aa,dd_aa.id,dd_aa.name,dd_aa.population,dd_aa.date_mod);
		}

	return dict_aa;
}

// ------------------------------------------------------------------
function neo4j_to_dict_proc ()
{
	var dict_aa = new Object ();

	var keys_aa = new Array ('1','2','3','4','5','6','7','8','9');

	for (var it in keys_aa)
		{ 
		dict_aa = neo4j_get_record_proc (dict_aa,keys_aa[it]);
		}

	return	dict_aa;
}

// ------------------------------------------------------------------
print	("*** 開始 ***");

var dict_aa = neo4j_to_dict_proc ();

text_manipulate.dict_display_proc (dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
