#! /usr/bin/escript
%% -----------------------------------------------------------
%%	text_update.erl
%%
%%					Feb/08/2016
%% -----------------------------------------------------------
-module(text_update).
-compile(export_all).
-import(text_manipulate, [text_read_proc/1,display_proc/1,text_write_proc/2]).
-import(text_manipulate, [dict_update_proc/3]).
%% -----------------------------------------------------------
main (A)->
	Str_start = unicode:characters_to_binary ("*** 開始 ***\n", utf8),
	io:format (Str_start),
	[File_text,Key,Arg2]=A,
	Population = list_to_integer(Arg2),
	io:format (lists:concat
		(["Key = ",Key," Population = ",Population,"\n"])),
	List = text_read_proc (File_text),
%%        display_proc (List),
	io:format ("-----------------\n"),
%% -----------------------------------------------------------
	List_modified = dict_update_proc (List,Key,Population),
%%	display_proc (List_modified),
	io:format ("-----------------\n"),
	text_write_proc (File_text,List_modified),
	Str_end = unicode:characters_to_binary ("*** 終了 ***\n", utf8),
	io:format (Str_end).
%% -----------------------------------------------------------
