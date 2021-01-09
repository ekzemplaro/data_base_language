/*
	json_read.dart

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

	File file = new File (file_name);
	Future future = file.readAsString ();

	future.then((content)
		{
		Map dict_aa = jsonDecode(content);

		dict_display_proc (dict_aa);

		stderr.writeln ("*** 終了 ***");
		}); 
}

// -------------------------------------------------------------
