/*
	json_create.dart

						Jan/09/2021
*/
// -------------------------------------------------------------
import 'dart:io';
import 'dart:convert';


import	'/var/www/data_base/common/dart_common/text_manipulate.dart';
// -------------------------------------------------------------
data_prepare_proc ()
{
	var dict_aa = new Map ();

	dict_aa = dict_append_proc (dict_aa,'t0921','宇都宮',42761,'1957-2-20');
	dict_aa = dict_append_proc (dict_aa,'t0922','小山',17895,'1957-8-15');
	dict_aa = dict_append_proc (dict_aa,'t0923','佐野',71564,'1957-12-14');
	dict_aa = dict_append_proc (dict_aa,'t0924','足利',93672,'1957-5-9');
	dict_aa = dict_append_proc (dict_aa,'t0925','日光',72351,'1957-6-4');
	dict_aa = dict_append_proc (dict_aa,'t0926','下野',35187,'1957-3-21');
	dict_aa = dict_append_proc (dict_aa,'t0927','さくら',31246,'1957-10-23');
	dict_aa = dict_append_proc (dict_aa,'t0928','矢板',65792,'1957-8-26');
	dict_aa = dict_append_proc (dict_aa,'t0929','真岡',74139,'1957-2-15');
	dict_aa = dict_append_proc (dict_aa,'t0930','栃木',29831,'1957-8-7');
	dict_aa = dict_append_proc (dict_aa,'t0931','大田原',54927,'1957-5-12');
	dict_aa = dict_append_proc (dict_aa,'t0932','鹿沼',36842,'1957-4-24');
	dict_aa = dict_append_proc (dict_aa,'t0933','那須塩原',93875,'1957-2-9');
	dict_aa = dict_append_proc (dict_aa,'t0934','那須烏山',38254,'1957-3-21');

	return	dict_aa;
}

// -------------------------------------------------------------
main (List<String> arguments)
{
	stderr.writeln ("*** 開始 ***");

	String file_out = '${arguments[0]}';

	var dict_aa = data_prepare_proc ();

	var str_out = jsonEncode(dict_aa);

	str_to_file_proc (str_out,file_out);

	stderr.writeln ("*** 終了 ***");

}

// -------------------------------------------------------------
