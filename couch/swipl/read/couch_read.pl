#! /usr/bin/swipl -f -q
/* ------------------------------------------------------------------- */
/*
	couch_read.pl

						Oct/07/2015
*/
/* ------------------------------------------------------------------- */
:- initialization main.
main() :-
	use_module(library('http/http_open')),
	format('*** 開始 ***\n'),
	http_open('http://localhost:5984/nagano/_all_docs?include_docs=true', In, []),
	copy_stream_data(In,user_output),
	close(In),
	format('*** 終了 ***\n'),
	halt.
/* ------------------------------------------------------------------- */
