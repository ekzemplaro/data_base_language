#! /usr/bin/dart
/*
	csv_read.dart

					Mar/17/2015
*/
// -------------------------------------------------------------
import 'dart:async';
import 'dart:io'; 

import	'/var/www/data_base/common/dart_common/text_manipulate.dart';
// -------------------------------------------------------------
main (List<String> arguments) {
	print ("*** 開始 ***");

	String file_name = '${arguments[0]}';

	File file = new File (file_name);
	Future future = file.readAsString ();

	future.then((content)
		{
		var dict_aa = str_to_dict_proc (content,',');

		dict_display_proc (dict_aa);

		print ("*** 終了 ***");
		}); 
}

// -------------------------------------------------------------
