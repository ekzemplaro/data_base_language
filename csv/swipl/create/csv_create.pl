#! /usr/bin/swipl -f -q
/* ------------------------------------------------------------------- */
/*
	csv_create.pl

						Oct/18/2016
*/
/* ------------------------------------------------------------------- */
:- initialization main.

data_prepare_proc(A) :-  A = 
		[row(t1271,'千葉',57829,'1942-8-26'),
		row(t1272,'勝浦',27548,'1942-4-15'),
		row(t2383,'市原',32615,'1942-6-8'),
		row(t2384,'流山',47129,'1942-10-27'),
		row(t2385,'八千代',32748,'1942-7-14'),
		row(t2386,'我孫子',24185,'1942-6-12'),
		row(t2387,'鴨川',82194,'1942-4-17'),
		row(t2388,'銚子',91582,'1942-3-24'),
		row(t2389,'市川',71264,'1942-7-8')].
/* ------------------------------------------------------------------- */
main(Argv) :-
	format('*** 開始 ***\n'),
	format('Argv: ~w\n', [Argv]),
	[File_out|_] = Argv,
	write(File_out),nl,

	data_prepare_proc(Data_a),

%	writeln(Data_a),
	csv_write_file(File_out,Data_a),

	format('*** 終了 ***\n'),
	halt.

/* ------------------------------------------------------------------- */
