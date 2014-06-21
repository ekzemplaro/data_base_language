#! /usr/bin/escript
%% ----------------------------------------------------------------
%%	webdav_read.erl
%%
%%					Jan/28/2014
%%
%% ----------------------------------------------------------------
-module(couch_read).
-compile(export_all).
-import(json_manipulate, [proplists_display_proc/1]).
-import(json_manipulate, [record_parser_proc/2]).
%% ----------------------------------------------------------------
main (_) ->
	io:format ("*** 開始 ***\n"),
	inets:start(),
	Url="http://host_dbase:3004/city/tokyo.json",
    	{ok,{{_Version,200, _Reason},_Header,Body}} = httpc:request(Url),Body,
	Json_str=Body,
%%	proplists_display_proc (Body),
%%	io:format (Json_str),
	{struct, JsonData} = mochijson2:decode (Json_str),
%
	Ll = proplists:get_keys (JsonData),
	Ff = fun(X) ->
		record_parser_proc (JsonData, X)
		end,
%%
	lists:foreach(Ff,Ll),
%
	io:format ("*** 終了 ***\n").
%% ----------------------------------------------------------------
