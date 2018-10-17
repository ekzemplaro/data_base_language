#! /usr/bin/swipl  -f -q
/* ------------------------------------------------------------------- */
/*
	json_delete.pl

						Oct/18/2018
*/
/* ------------------------------------------------------------------- */
:- use_module([ library(http/json) ]).
:- initialization main.
 
/* ------------------------------------------------------------------- */
% [8]:
data_out_proc(File_out,Dict) :-
	dict_keys(Dict,Keys),
	length(Keys,Ll),
	writeln(current_output , Ll),
	tell(File_out),
	json_write_dict(current_output, Dict),
	told.
/* ------------------------------------------------------------------- */
% [6]:
delete_proc(Dict,Key_in,Dict_bb) :-
	dict_keys(Dict,Keys),
	length(Keys,Ll),
	writeln(current_output , Ll),
	get_dict(Key_in, Dict, Value_aa),
	writeln(current_output , Value_aa),
	del_dict(Key_in,Dict,_,Dict_bb).
%
%
/* ------------------------------------------------------------------- */
% [4]:
reading_JSON_term(File_in,Dict) :-
	write(File_in),nl,
	open(File_in, read, Stream, [] ),
	json_read_dict(Stream, Dict, []),
	close(Stream).
%
/* ------------------------------------------------------------------- */
main(Argv) :-
	format('*** 開始 ***\n'),
	format('Argv: ~w\n', [Argv]),
	[File_in|Yy] = Argv,
	[Key_in|_] = Yy,
	write(Key_in),nl,
%
	reading_JSON_term(File_in,Dict),
%
	delete_proc(Dict,Key_in,Dict_bb),
%
	data_out_proc(File_in,Dict_bb),
%
	format('*** 終了 ***\n'),
	halt.
%
/* ------------------------------------------------------------------- */
