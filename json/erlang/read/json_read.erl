#! /usr/bin/escript
%% ----------------------------------------------------------------
%%	json_read.erl
%%
%%					Jan/28/2014
%%
%% ----------------------------------------------------------------
-import(json_manipulate, [record_parser_proc/2]).
%% ----------------------------------------------------------------
main(A) ->
	io:format("*** 開始 ***\n"),
%%
	[Fname_in|_] = A,
	Lout = [],
	{ok,S}=file:open(Fname_in,read),
	L1=read_strings_proc (S,Lout),
	file:close (S),
%	[Head|Tail] = L1,
	Json_str = lists:concat (L1),
%
	{struct, JsonData} = mochijson2:decode (Json_str),
%
	Ll = proplists:get_keys (JsonData),
	Ff = fun(X) ->
		record_parser_proc (JsonData, X)
		end,
%%
	lists:foreach(Ff,Ll),
%
	io:format("*** 終了 ***\n").
%% ----------------------------------------------------------------
read_strings_proc (S,Lout)->
	case io:get_line (S,'') of
	eof ->
		Lout;
	Line ->
		Lnew = Lout ++ [Line],
		read_strings_proc (S,Lnew)
	end.
%%
%% ----------------------------------------------------------------
