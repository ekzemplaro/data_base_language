/* ------------------------------------------------------------------- */
/*
	text_read.pl

						Feb/28/2020
*/
/* ------------------------------------------------------------------- */
:- initialization main.


/* ------------------------------------------------------------------- */
read_file_to_lines(File_in, Lines ) :-
	open(File_in, read, Stream, [] ),
	read_line_to_codes( Stream, Line ),
	read_stream_to_lines( Line, Stream, Lines ),
	close( Stream ).


read_stream_to_lines( end_of_file, _Stream, [] ) :- !.

read_stream_to_lines( Line, Stream, [ Line | Rest ] ) :-
	read_line_to_codes( Stream, NextLine ),
	read_stream_to_lines( NextLine, Stream, Rest ). 

/* ------------------------------------------------------------------- */
line_out_proc(A) :-
	text_to_string(A,Str),
	format('~w\n',Str).
/* ------------------------------------------------------------------- */
main(Argv) :-
	format('*** 開始 ***\n'),
	format('Argv: ~w\n', [Argv]),
	[File_in|_] = Argv,
	write(File_in),nl,

	read_file_to_lines(File_in,Lines),
	length(Lines,X),
	write(X),nl,
	format('length: ~w\n', X),

	maplist(line_out_proc,Lines),
	format('*** 終了 ***\n'),
	halt.
/* ------------------------------------------------------------------- */
