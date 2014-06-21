/* ------------------------------------------------------------------- */
/*
	exist_read.pl

						Aug/22/2011
*/
/* ------------------------------------------------------------------- */
exist_read :-
	use_module(library('http/http_open')),
	format('*** 開始 ***~n'),
	http_open('http://localhost:8086/exist/rest/db/cities/cities.xml', In, []),
	copy_stream_data(In, user_output),
	close(In),
	format('*** 終了 ***~n'),
	halt.
/* ------------------------------------------------------------------- */
