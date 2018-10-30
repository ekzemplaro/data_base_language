#! /usr/bin/swipl  -f -q
/* ------------------------------------------------------------------- */
/*
	csv_read.pl

						Oct/19/2018
*/
/* ------------------------------------------------------------------- */
:- initialization main.

/* ------------------------------------------------------------------- */
row_out_proc(A) :-
	row(C1, C2, C3, C4) = A,
	format('~w\t',C1),
	format('~w\t',C2),
	format('~w\t',C3),
	format('~w\n',C4).
/* ------------------------------------------------------------------- */
main(Argv) :-
	format('*** 開始 ***\n'),
	format('Argv: ~w\n', [Argv]),
	[File_in|_] = Argv,
	write(File_in),nl,
%
	csv_read_file(File_in,Rows),
	length(Rows,X),
	write(X),nl,
	format('length: ~w\n', X),
%
	maplist(row_out_proc,Rows),
	format('*** 終了 ***\n'),
	halt.
/* ------------------------------------------------------------------- */
