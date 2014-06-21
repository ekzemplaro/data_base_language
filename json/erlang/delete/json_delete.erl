#! /usr/bin/escript
%% ----------------------------------------------------------------
%%	json_delete.erl
%%
%%					Sep/28/2011
%%
%% ----------------------------------------------------------------
-module(json_delete).
-compile(export_all).
-import(json_manipulate, [proplists_display_proc/1]).
-import(file_io, [file_to_str_proc/1]).
%% ----------------------------------------------------------------
main(A) ->
	io:format("*** 開始 ***\n"),
%%
	[Fname_json,Id] = A,

	io:format (lists:concat (["Id = ",Id,"\n"])),
%
	Json_str = file_to_str_proc (Fname_json),
%
	{struct, JsonData} = mochijson2:decode (Json_str),
%
	Data_new = proplists:delete (list_to_binary (Id),JsonData), 
%
	proplists_display_proc (Data_new),
%
	Str_out = mochijson2:encode (Data_new),
	file:write_file (Fname_json,[Str_out]),
	io:format("*** 終了 ***\n").
%% ----------------------------------------------------------------
read_single_line_proc (S,Lout)->
	case io:get_line (S,'') of
	eof ->
		Lout;
	Line ->
		Lnew = Lout ++ [Line],
		read_single_line_proc (S,Lnew)
	end.
%%
%% ----------------------------------------------------------------

