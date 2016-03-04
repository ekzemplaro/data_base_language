#! /usr/bin/escript
%% -----------------------------------------------------------
%%	text_delete.erl
%%
%%					Feb/08/2016
%% -----------------------------------------------------------
-module(text_update).
-compile(export_all).
-import(text_manipulate, [text_read_proc/1,display_proc/1,text_write_proc/2]).
-import(text_manipulate, [dict_delete_proc/2]).

%% -----------------------------------------------------------
main (A)->
	Str_start = unicode:characters_to_binary ("*** 開始 ***\n", utf8),
	io:format (Str_start),
	[File_text,Id]=A,
	io:format (lists:concat (["Id = ",Id,"\n"])),
	List = text_read_proc (File_text),
	List_modified = dict_delete_proc (List,Id),
%%
	display_proc (List_modified),
	text_write_proc (File_text,List_modified),
	Str_end = unicode:characters_to_binary ("*** 終了 ***\n", utf8),
	io:format (Str_end).
%% -----------------------------------------------------------
