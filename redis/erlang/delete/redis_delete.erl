#! /usr/bin/escript
%% -----------------------------------------------------------
%%	redis_delete.erl
%%
%%					May/20/2013
%% -----------------------------------------------------------
-module(socket).
%% -----------------------------------------------------------
main (A)->
	io:format ("*** 開始 ***\n"),
	[Key_in]=A,
	io:format (lists:concat (["Key_in = ",Key_in,"\n"])),
%%
	Host = "host_dbase",
	Port = 6379,
	{ok, Sock} = gen_tcp:connect(Host, Port,
                                 [binary, {packet, 0}]),
	Command =  lists:concat(["del ",Key_in, "\r\n"]),
	ok = gen_tcp:send(Sock, Command),
	ok = gen_tcp:close(Sock),
%%
	io:format ("*** 終了 ***\n").
%% -----------------------------------------------------------
