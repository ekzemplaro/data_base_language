#! /usr/bin/dart
/*
	text_create.dart

						Mar/16/2015
*/
// -------------------------------------------------------------
import 'dart:io'; 


import	'/var/www/data_base/common/dart_common/text_manipulate.dart';
// -------------------------------------------------------------
data_prepare_proc ()
{
	var dict_aa = new Map ();

	dict_aa = dict_append_proc (dict_aa,'t2381','名古屋',48761,'1957-9-20');
	dict_aa = dict_append_proc (dict_aa,'t2382','豊橋',17295,'1957-5-15');
	dict_aa = dict_append_proc (dict_aa,'t2383','岡崎',71674,'1957-11-14');
	dict_aa = dict_append_proc (dict_aa,'t2384','一宮',93612,'1957-9-9');
	dict_aa = dict_append_proc (dict_aa,'t2385','蒲郡',52391,'1957-4-4');
	dict_aa = dict_append_proc (dict_aa,'t2386','常滑',95187,'1957-1-21');
	dict_aa = dict_append_proc (dict_aa,'t2387','大府',31246,'1957-10-23');
	dict_aa = dict_append_proc (dict_aa,'t2388','瀬戸',65792,'1957-8-26');
	dict_aa = dict_append_proc (dict_aa,'t2389','犬山',74139,'1957-2-15');

	return	dict_aa;
}

// -------------------------------------------------------------
main (List<String> arguments)
{
	print ("*** 開始 ***");

	String file_out = '${arguments[0]}';

	var dict_aa = data_prepare_proc ();

	dict_to_text_proc ('\t',dict_aa,file_out);

	print ("*** 終了 ***");

}

// -------------------------------------------------------------
