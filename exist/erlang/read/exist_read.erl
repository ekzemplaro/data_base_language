#! /usr/bin/escript
%% ----------------------------------------------------------------
%%	exist_read.erl
%%
%%					Aug/24/2010
%%
%% ----------------------------------------------------------------
main (_) ->
	io:format ("*** 開始 ***\n"),
	inets:start(),
	Url="http://cpt003:8086/exist/rest/db/cities/cities.xml",
    	{ok,{{_Version,200, _Reason},_Header,Body}} = http:request(Url),Body,
	io:format (Body),
	io:format ("*** 終了 ***\n").
%% ----------------------------------------------------------------
