#! /usr/bin/swipl -f -q
/* ------------------------------------------------------------------- */
/*
	couch_update.pl

						Oct/08/2015
*/
/* ------------------------------------------------------------------- */
:- initialization main.
main(Argv) :-
	use_module(library('http/http_open')),
	format('*** 開始 ***\n'),
	[Key|Tail] = Argv,
	[Population|_] = Tail,
	write(Key),nl,
	write(Population),nl,
	concat_atom(['http://localhost:5984/nagano',Key], '/', Url),
	http_open(Url, In, []),
	copy_stream_data(In,user_output),
	close(In),
	format('*** 終了 ***\n'),
	halt.
/* ------------------------------------------------------------------- */
