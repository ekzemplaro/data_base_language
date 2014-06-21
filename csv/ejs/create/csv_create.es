#! /usr/local/bin/ejs
// ------------------------------------------------------------------
//
//	csv_create.es
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ejs_common/text_manipulate.es')
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1271','千葉',61861,'1952-7-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1272','勝浦',57984,'1952-11-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1273','市原',68741,'1952-5-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1274','流山',34734,'1952-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1275','八千代',45352,'1952-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1276','我孫子',62872,'1952-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1277','鴨川',39251,'1952-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1278','銚子',58246,'1952-7-16')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1279','市川',46932,'1952-11-22')

	return	dict_aa
}

// ------------------------------------------------------------------
print	("*** 開始 ***")
var file_out = App.args[1]

var dict_aa = data_prepare_proc ()
text_manipulate.dict_display_proc (dict_aa)
text_manipulate.csv_write_proc (file_out,dict_aa)

print	("*** 終了 ***")
// ------------------------------------------------------------------
