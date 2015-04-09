#! /usr/bin/dart
/*
	csv_create.dart

						Mar/17/2015
*/
// -------------------------------------------------------------
import 'dart:io'; 


import	'/var/www/data_base/common/dart_common/text_manipulate.dart';
// -------------------------------------------------------------
data_prepare_proc ()
{
	var dict_aa = new Map ();

	dict_aa = dict_append_proc (dict_aa,'t1271','千葉',28761,'1957-2-21');
	dict_aa = dict_append_proc (dict_aa,'t1272','勝浦',37295,'1957-8-17');
	dict_aa = dict_append_proc (dict_aa,'t1273','市原',51674,'1957-12-18');
	dict_aa = dict_append_proc (dict_aa,'t1274','流山',83612,'1957-3-5');
	dict_aa = dict_append_proc (dict_aa,'t1275','八千代',72391,'1957-7-4');
	dict_aa = dict_append_proc (dict_aa,'t1276','我孫子',45187,'1957-5-21');
	dict_aa = dict_append_proc (dict_aa,'t1277','鴨川',81246,'1957-10-23');
	dict_aa = dict_append_proc (dict_aa,'t1278','銚子',15792,'1957-8-26');
	dict_aa = dict_append_proc (dict_aa,'t1279','市川',52139,'1957-9-15');

	return	dict_aa;
}

// -------------------------------------------------------------
main (List<String> arguments)
{
	print ("*** 開始 ***");

	String file_out = '${arguments[0]}';

	var dict_aa = data_prepare_proc ();

	dict_to_text_proc (',',dict_aa,file_out);

	print ("*** 終了 ***");

}

// -------------------------------------------------------------
