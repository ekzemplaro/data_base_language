/* ------------------------------------------------------------------- */
/*
	xindice_read.pl

						Aug/22/2011
*/
/* ------------------------------------------------------------------- */
xindice_read :-
	use_module(library('http/http_open')),
	format('*** 開始 ***~n'),
	http_open('http://host_xindice:8888/xindice/db/cities/cities', In, []),
	copy_stream_data(In, user_output),
	close(In),
	format('*** 終了 ***~n'),
	halt.
/* ------------------------------------------------------------------- */
