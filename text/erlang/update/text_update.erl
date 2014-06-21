#! /usr/bin/escript
%% -----------------------------------------------------------
%%	text_update.erl
%%
%%					Sep/26/2011
%% -----------------------------------------------------------
-module(text_update).
-compile(export_all).
-import(text_manipulate, [text_read_proc/1,display_proc/1,text_write_proc/2]).
-import(text_manipulate, [dict_update_proc/3]).
%% -----------------------------------------------------------
main (A)->
	io:format ("*** 開始 ***\n"),
	[File_text,Id,Arg2]=A,
	Population = list_to_integer(Arg2),
	io:format (lists:concat
		(["Id = ",Id," Population = ",Population,"\n"])),
	List = text_read_proc (File_text),
%%        display_proc (List),
	io:format ("-----------------\n"),
%% -----------------------------------------------------------
	List_modified = dict_update_proc (List,Id,Population),
	display_proc (List_modified),
	io:format ("-----------------\n"),
	text_write_proc (File_text,List_modified),
	io:format ("*** 終了 ***\n").
%% -----------------------------------------------------------
