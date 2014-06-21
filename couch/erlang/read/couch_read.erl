#! /usr/bin/escript
%% ----------------------------------------------------------------
%%	couch_read.erl
%%
%%					Jan/28/2014
%%
%% ----------------------------------------------------------------
-module(couch_read).
-compile(export_all).
-import(json_manipulate, [proplists_display_proc/1]).
%% ----------------------------------------------------------------
main (_) ->
	io:format ("*** 開始 ***\n"),
	inets:start(),
	Url="http://host_dbase:5984/city/cities",
    	{ok,{{_Version,200, _Reason},_Header,Body}} = httpc:request(Url),Body,
	Json_str=Body,
	io:format (Json_str),
%%	proplists_display_proc (Body),
	io:format ("*** ppp ***\n"),
	{struct, JsonData} = mochijson2:decode (Json_str),
	io:format ("*** qqq ***\n"),
%
	Ll = proplists:get_keys (JsonData),
	io:format ("*** rrr ***\n"),
	Ff = fun(X) ->
		record_parser_proc (JsonData, X)
		end,
%%
	lists:foreach(Ff,Ll),
	io:format ("*** 終了 ***\n").
%% ----------------------------------------------------------------
record_parser_proc (JsonData, Key) ->
	io:format ("*** sss ***\n"),
%	{struct, Unit_aa} = proplists:get_value(Key, JsonData),
	io:format ("*** ttt ***\n"),
%        Name = proplists:get_value(<<"name">>, Unit_aa),
%        Population = proplists:get_value(<<"population">>, Unit_aa),
%        Date_mod = proplists:get_value(<<"date_mod">>, Unit_aa),
	io:format (Key),
%        io:format ("\t"),
%        io:format (Name),
%        io:format ("\t"),
%        io:format (integer_to_list (Population)),
%        io:format ("\t"),
%        io:format (Date_mod),
        io:format ("\n").
%% ----------------------------------------------------------------
