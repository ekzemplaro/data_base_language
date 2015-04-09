#! /usr/bin/dart
/*
	csv_delete.dart

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
	String key = '${arguments[1]}';

	print (key);

	File file = new File (file_name);
	Future future = file.readAsString ();

	future.then((content)
		{
		var dict_aa = str_to_dict_proc (content,',');

		if (dict_aa.containsKey (key))
			{
			dict_aa.remove (key);

			dict_display_proc (dict_aa);

			dict_to_text_proc (',',dict_aa,file_name);
			}

		print ("*** 終了 ***");
		}); 
}

// -------------------------------------------------------------
