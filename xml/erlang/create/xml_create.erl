#! /usr/bin/escript
%% ----------------------------------------------------------------
%%	xml_create.erl
%%
%%					Sep/24/2011
%%
%% ----------------------------------------------------------------
main(A) ->
	io:format ("*** 開始 ***\n"),
	[Arg0|_]=A,
	File_xml = Arg0,
	Data = data_prepare (),
%%
	lists:flatten(xmerl:export_simple([Data], xmerl_xml)),
	file:write_file (File_xml, xmerl:export_simple([Data], xmerl_xml)),
	io:format ("*** 終了 ***\n").
%% ----------------------------------------------------------------
data_prepare ()->
  {root,
     [],
     [
	{t2261,[{name,["静岡"]},{population,["51321"]},
          {date_mod,["1996-03-19"]}]},
	{t2262,[{name,["浜松"]},{population,["56524"]},
          {date_mod,["1996-03-04"]}]},
	{t2263,[{name,["沼津"]},{population,["71325"]},
          {date_mod,["1996-03-07"]}]},
	{t2264,[{name,["三島"]},{population,["84327"]},
          {date_mod,["1996-02-08"]}]},
	{t2265,[{name,["富士"]},{population,["92386"]},
          {date_mod,["1996-05-09"]}]},
	{t2266,[{name,["熱海"]},{population,["36194"]},
          {date_mod,["1996-05-12"]}]},
	{t2267,[{name,["富士宮"]},{population,["35628"]},
          {date_mod,["1996-05-19"]}]},
	{t2268,[{name,["藤枝"]},{population,["34727"]},
          {date_mod,["1996-05-18"]}]},
	{t2269,[{name,["御殿場"]},{population,["32891"]},
          {date_mod,["1996-06-24"]}]},
	{t2270,[{name,["島田"]},{population,["54324"]},
          {date_mod,["1996-03-09"]}]}
	]}.
%% ----------------------------------------------------------------
