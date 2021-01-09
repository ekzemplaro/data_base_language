/*
	json_delete.dart

					Jan/09/2021
*/
// -------------------------------------------------------------
import 'dart:async';
import 'dart:io';
import 'dart:convert';

import	'/var/www/data_base/common/dart_common/text_manipulate.dart';
// -------------------------------------------------------------
main (List<String> arguments) {
	stderr.writeln ("*** 開始 ***");

	String file_name = '${arguments[0]}';
	String key = '${arguments[1]}';

	print (key);

	File file = new File (file_name);
	Future future = file.readAsString ();

	future.then((content)
		{
		var dict_aa = jsonDecode(content);

		if (dict_aa.containsKey (key))
			{
			dict_aa.remove (key);

			var str_out = jsonEncode(dict_aa);

			str_to_file_proc (str_out,file_name);
			}

		stderr.writeln ("*** 終了 ***");
		}); 
}

// -------------------------------------------------------------
