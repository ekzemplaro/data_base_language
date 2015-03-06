#! /usr/bin/dart
/*
	text_create.dart

						Mar/05/2015
*/
// -------------------------------------------------------------
import 'dart:io'; 

// -------------------------------------------------------------
main (List<String> arguments) {
	print ("*** 開始 ***");

	String file_name = '${arguments[0]}';

	var file = new File(file_name);
	var sink = file.openWrite();

sink.write('t2381\t名古屋\t51746\t1957-3-25\n');
sink.write('t2382	豊橋	49813	1957-7-27\n');
sink.write('t2383	岡崎	91872	1957-2-8\n');
sink.write('t2384	一宮	17945	1957-1-15\n');
sink.write('t2385	蒲郡	87163	1957-5-24\n');
sink.write('t2386	常滑	21589	1957-8-7\n');
sink.write('t2387	大府	42693	1957-4-21\n');
sink.write('t2388	瀬戸	54187	1957-8-12\n');
sink.write('t2389	犬山	79326	1957-10-28\n');

	sink.close();

	print ("*** 終了 ***");

}

// -------------------------------------------------------------
