#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	csv_create.js
//
//						May/10/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var args = require('system').args;
var file_out = args[1];

var dict_aa = data_prepare_proc ();
text_manipulate.dict_display_proc (dict_aa);
text_manipulate.csv_write_proc (file_out,dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1271','千葉',61861,'1953-7-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1272','勝浦',25782,'1953-11-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1273','市原',68741,'1953-5-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1274','流山',34734,'1953-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1275','八千代',45352,'1953-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1276','我孫子',62872,'1953-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1277','鴨川',39251,'1953-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1278','銚子',54686,'1953-7-16');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1279','市川',47934,'1953-11-22');

	return	dict_aa;
}

// ------------------------------------------------------------------
