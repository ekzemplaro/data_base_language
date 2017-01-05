#! /usr/bin/env jjs
// ------------------------------------------------------------------
//
//	csv_create.js
//
//						Jan/04/2017
//
// ------------------------------------------------------------------

load ("/var/www/data_base/common/nashorn_common/file_io.js")
load ("/var/www/data_base/common/nashorn_common/text_manipulate.js")

var file_out=arguments[0]

print	("*** 開始 ***")

var dict_aa = data_prepare_proc ()

csv_write_proc (file_out,dict_aa)

print	("*** 終了 ***")
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa["t1271"] = {"name": "千葉", "population": 47931, "date_mod": "1911-8-22"}
	dict_aa["t1272"] = {"name": "勝浦", "population": 61235, "date_mod": "1911-7-15"}
	dict_aa["t1273"] = {"name": "市原", "population": 59147, "date_mod": "1911-2-24"}
	dict_aa["t1274"] = {"name": "流山", "population": 62839, "date_mod": "1911-8-16"}
	dict_aa["t1275"] = {"name": "八千代", "population": 51834, "date_mod": "1911-9-8"}
	dict_aa["t1276"] = {"name": "我孫子", "population": 82736, "date_mod": "1911-3-25"}
	dict_aa["t1277"] = {"name": "鴨川", "population": 19832, "date_mod": "1911-4-19"}
	dict_aa["t1278"] = {"name": "銚子", "population": 93851, "date_mod": "1911-5-18"}
	dict_aa["t1279"] = {"name": "市川", "population": 63415, "date_mod": "1911-2-1"}

	return	dict_aa
}

// ------------------------------------------------------------------
