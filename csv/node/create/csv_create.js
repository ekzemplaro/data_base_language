#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	csv_create.js
//
//					Jan/13/2015
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate");
//

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa["t1271"] = {"name": "千葉", "population": 23956, "date_mod": "1950-8-12"};
	dict_aa["t1272"] = {"name": "勝浦", "population": 57149, "date_mod": "1950-9-15"};
	dict_aa["t1273"] = {"name": "市原", "population": 74529, "date_mod": "1950-2-24"};
	dict_aa["t1274"] = {"name": "流山", "population": 61945, "date_mod": "1950-8-16"};
	dict_aa["t1275"] = {"name": "八千代", "population": 47932, "date_mod": "1950-9-8"};
	dict_aa["t1276"] = {"name": "我孫子", "population": 87546, "date_mod": "1950-3-25"};
	dict_aa["t1277"] = {"name": "鴨川", "population": 16892, "date_mod": "1950-4-19"};
	dict_aa["t1278"] = {"name": "銚子", "population": 91738, "date_mod": "1950-5-18"};
	dict_aa["t1279"] = {"name": "市川", "population": 35841, "date_mod": "1950-2-1"};

	return	dict_aa;
}

// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var file_out=process.argv[2];

dict_aa = data_prepare_proc ();
text_manipulate.dict_display_proc (dict_aa);

text_manipulate.csv_write_proc (file_out,dict_aa);

fs.chmodSync (file_out,0666);

console.log ("*** 終了 ***");

// ---------------------------------------------------------------

