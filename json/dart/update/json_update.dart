#! /usr/bin/dart
/*
	json_update.dart

					Mar/17/2015
*/
// -------------------------------------------------------------
import 'dart:async';
import 'dart:io';
import 'dart:convert';

import	'/var/www/data_base/common/dart_common/text_manipulate.dart';
// -------------------------------------------------------------
main (List<String> arguments) {
	print ("*** 開始 ***");

	String file_name = '${arguments[0]}';
	String key = '${arguments[1]}';
	String population = int.parse ('${arguments[2]}');

	print (key + '\t' + population.toString ());

	File file = new File (file_name);
	Future future = file.readAsString ();

	future.then((content)
		{
		var dict_aa = JSON.decode(content);

		if (dict_aa.containsKey (key))
			{
			dict_aa = dict_update_proc (dict_aa,key,population);

			var str_out = JSON.encode(dict_aa);

			str_to_file_proc (str_out,file_name);
			}

		print ("*** 終了 ***");
		}); 
}

// -------------------------------------------------------------
