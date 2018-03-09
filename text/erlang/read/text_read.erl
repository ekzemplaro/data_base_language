#! /usr/bin/escript
%% -----------------------------------------------------------
%%	text_read.erl
%%
%%					Mar/08/2018
%% -----------------------------------------------------------
-module(text_read).
-import(text_manipulate, [text_read_proc/1,display_proc/1]).

main (A)->
	Str_start = unicode:characters_to_binary ("*** 開始 ***\n", utf8),
	io:format (Str_start),
	[Fname_in|_]=A,
	List = text_read_proc (Fname_in),
	display_proc (List),
	Str_end = unicode:characters_to_binary ("*** 終了 ***\n", utf8),
	io:format (Str_end).
%% -----------------------------------------------------------
