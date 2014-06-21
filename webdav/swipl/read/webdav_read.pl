/* ------------------------------------------------------------------- */
/*
	webdav_read.pl

						Mar/30/2012
*/
/* ------------------------------------------------------------------- */
webdav_read :-
	use_module(library('http/http_open')),
	format('*** 開始 ***~n'),
	http_open('http://host_dbase:3004/city/tokyo.json', In, []),
	copy_stream_data(In, user_output),
	close(In),
	format('*** 終了 ***~n'),
	halt.
/* ------------------------------------------------------------------- */
