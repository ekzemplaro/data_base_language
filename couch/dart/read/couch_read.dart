#! /usr/bin/dart
/*
	text_read.dart

					Mar/17/2015
*/
// -------------------------------------------------------------
import 'dart:convert';
import 'package:http/http.dart' as http;

// -------------------------------------------------------------
fetch_unit_proc (url_json,key)
{
	var url_in = url_json + key;

	http.get(url_in).then((response)
		{
		var unit_aa = JSON.decode(response.body);
		var str_out = key + '\t' + unit_aa['name'];
		str_out += '\t' + unit_aa['population'].toString ();
		str_out += '\t' + unit_aa['date_mod'];
		print (str_out);
		});
}

// -------------------------------------------------------------
void main (List<String> arguments)
{
	print ("*** 開始 ***");

	String url_json = 'http://localhost:5984/nagano/';

	http.get(url_json + '_all_docs').then((response)
		{
		var dict_hh = JSON.decode(response.body);

		for (final pp in dict_hh['rows'])
			{
			fetch_unit_proc (url_json,pp['id']);
			}

		print ("*** 終了 ***");
		});
}

// -------------------------------------------------------------
