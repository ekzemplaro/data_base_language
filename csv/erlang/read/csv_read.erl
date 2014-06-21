#! /usr/bin/escript
%% -----------------------------------------------------------
%%	csv_read.erl
%%
%%					Sep/26/2011
%% -----------------------------------------------------------
-module(text_read).
-compile(export_all).
-import(text_manipulate, [csv_read_proc/1,display_proc/1]).

main (A)->
	io:format ("*** 開始 ***\n"),
	[Fname_in|_]=A,
	List = csv_read_proc (Fname_in),
	display_proc (List),
	io:format ("*** 終了 ***\n").
%% -----------------------------------------------------------
