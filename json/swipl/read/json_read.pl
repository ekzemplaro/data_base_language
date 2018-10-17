#! /usr/bin/swipl  -f -q
/* ------------------------------------------------------------------- */
/*
	json_read.pl

						Oct/18/2018
*/
/* ------------------------------------------------------------------- */
:- use_module([ library(http/json) ]).
:- initialization main.
 
/* ------------------------------------------------------------------- */
%% [6-4-8]:
display_line_proc(Dict,Key) :-
	write(current_output ,Key),
	write(current_output ,'\t'),
	write(current_output ,Dict.Key.name),
	write(current_output ,'\t'),
	write(current_output ,Dict.Key.population),
	write(current_output ,'\t'),
	writeln(current_output ,Dict.Key.date_mod).
/* ------------------------------------------------------------------- */
%% [6-4]:
print_list(Dict,[]).
print_list(Dict,[Element|List]) :-
	display_line_proc(Dict,Element),
	print_list(Dict,List).

/* ------------------------------------------------------------------- */
%% [6]:
display_proc(Dict) :-
	dict_keys(Dict,Keys),
	length(Keys,Ll),
	writeln(current_output , Ll),
	print_list(Dict,Keys).

/* ------------------------------------------------------------------- */
%% [4]:
reading_JSON_term(File_in,Dict) :-
	write(File_in),nl,
	open(File_in, read, Stream, [] ),
	json_read_dict(Stream, Dict, []),
	close(Stream).
%%
/* ------------------------------------------------------------------- */
main(Argv) :-
	format('*** 開始 ***\n'),
	format('Argv: ~w\n', [Argv]),
	[File_in|_] = Argv,
%%
	reading_JSON_term(File_in,Dict),
	display_proc(Dict),
%%
	format('*** 終了 ***\n'),
	halt.

/* ------------------------------------------------------------------- */
