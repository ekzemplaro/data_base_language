// ------------------------------------------------------------------
//
//	csv_create.js
//
//						Jul/06/2011
//
// ------------------------------------------------------------------
importPackage (java.io);

load ("/var/www/data_base/common/rhino_common/file_io.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

var file_out=arguments[0];

print	("*** 開始 ***");

var dict_aa = data_prepare_proc ();

dict_display_proc (dict_aa);

csv_write_proc (file_out,dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa["t1271"] = {"name": "千葉", "population": 85431, "date_mod": "1951-8-22"};
	dict_aa["t1272"] = {"name": "勝浦", "population": 57635, "date_mod": "1951-7-15"};
	dict_aa["t1273"] = {"name": "市原", "population": 32547, "date_mod": "1951-2-24"};
	dict_aa["t1274"] = {"name": "流山", "population": 69839, "date_mod": "1951-8-16"};
	dict_aa["t1275"] = {"name": "八千代", "population": 41834, "date_mod": "1951-9-8"};
	dict_aa["t1276"] = {"name": "我孫子", "population": 82836, "date_mod": "1951-3-25"};
	dict_aa["t1277"] = {"name": "鴨川", "population": 19832, "date_mod": "1951-4-19"};
	dict_aa["t1278"] = {"name": "銚子", "population": 93854, "date_mod": "1951-5-18"};
	dict_aa["t1279"] = {"name": "市川", "population": 37615, "date_mod": "1951-2-1"};

	return	dict_aa;
}

// ------------------------------------------------------------------
