#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	neo4j_create.js
//
//						May/23/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
function neo4j_put_record_proc (nn)
{
	var client= require ("ringo/httpclient");
	var url='http://localhost:7474/db/data/node/' + nn + '/properties';

	var unit_aa = new Object;

	unit_aa["id"] = "t4051";
	unit_aa["name"] = "福岡";
	unit_aa["population"] = "812401";
	unit_aa["date_mod"] = "1953-4-17";

	var out_str = JSON.stringify (unit_aa);

	print (url);
	print (out_str);
	var data=client.put (url,out_str);

	print (data.status);
	print (data.body);



//	return dict_aa;
}

// ------------------------------------------------------------------
function neo4j_to_dict_proc ()
{
//	var dict_aa = new Object ();

	var keys_aa = new Array ('25','26','27','28','29','30','31','32','33');

//	dict_aa = neo4j_get_record_proc (dict_aa,keys_aa[it]);

}

// ------------------------------------------------------------------
print	("*** 開始 ***");

// var dict_aa = neo4j_to_dict_proc ();

neo4j_put_record_proc ('25');

// text_manipulate.dict_display_proc (dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
