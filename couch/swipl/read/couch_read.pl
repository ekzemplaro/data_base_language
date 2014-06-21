/* ------------------------------------------------------------------- */
/*
	couch_read.pl

						Feb/03/2014
*/
/* ------------------------------------------------------------------- */
couch_read :-
	use_module(library('http/http_open')),
	format('*** 開始 ***~n'),
	http_open('http://host_dbase:5984/city/cities', In, []),
	copy_stream_data(In, user_output),
	close(In),
	format('*** 終了 ***~n'),
	halt.
/* ------------------------------------------------------------------- */
