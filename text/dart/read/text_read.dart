#! /usr/bin/dart
/*
	text_read.dart

					Mar/04/2015
*/
// -------------------------------------------------------------
import 'dart:async';
import 'dart:io'; 

// -------------------------------------------------------------
main (List<String> arguments) {
	print ("*** 開始 ***");

	String file_name = '${arguments[0]}';
	File file = new File (file_name);
	Future future = file.readAsString ();
	future.then((content) {
	print (content);
	print ("*** 終了 ***");
	}); 
}

// -------------------------------------------------------------
