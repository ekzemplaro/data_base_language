#! /usr/local/bin/narwhal
// ------------------------------------------------------------------
//
//	neo4j_read.js
//
//						May/23/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/narwhal_common/text_manipulate.js');
// ------------------------------------------------------------------
function neo4j_get_record_proc (dict_aa,nn)
{
	var url_in='http://localhost:7474/db/data/node/' + nn + '/properties';

	var lines = readUrl(url_in).split("\n");  
	lines.pop(); 

	var json_str = lines[0];

	print (json_str);

//	var dd_aa = JSON.parse (json_str);

//	dict_aa = text_manipulate.dict_append_proc
//		(dict_aa,dd_aa.id,dd_aa.name,dd_aa.population,dd_aa.date_mod);

	return dict_aa;
}

// ------------------------------------------------------------------
function neo4j_to_dict_proc ()
{
	var dict_aa = new Object ();

//	var keys_aa = new Array ('25','26','27','28','29','30','31','32','33');
//	var keys_aa = new Array ('25','26');
	var keys_aa = new Array ('31');

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
