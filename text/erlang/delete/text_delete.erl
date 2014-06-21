#! /usr/bin/escript
%% -----------------------------------------------------------
%%	text_delete.erl
%%
%%					Sep/26/2011
%% -----------------------------------------------------------
-module(text_update).
-compile(export_all).
-import(text_manipulate, [text_read_proc/1,display_proc/1,text_write_proc/2]).
-import(text_manipulate, [dict_delete_proc/2]).

%% -----------------------------------------------------------
main (A)->
	io:format ("*** 開始 ***\n"),
	[File_text,Id]=A,
	io:format (lists:concat (["Id = ",Id,"\n"])),
	List = text_read_proc (File_text),
	List_modified = dict_delete_proc (List,Id),
%%
	display_proc (List_modified),
	text_write_proc (File_text,List_modified),
	io:format ("*** 終了 ***\n").
%% -----------------------------------------------------------
