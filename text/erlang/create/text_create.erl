#! /usr/bin/escript
%% ----------------------------------------------------------------
%%	text_create.erl
%%
%%					Feb/08/2016
%%
%% ----------------------------------------------------------------
-module(text_create).
-import(text_manipulate, [display_proc/1]).
-import(text_manipulate, [text_write_proc/2]).
%% ----------------------------------------------------------------
main(A) ->
	Str_start = unicode:characters_to_binary("*** 開始 ***\n", utf8),
	io:format (Str_start),
	[Arg0|_]=A,
	File_out = Arg0,
	Dict_aa = data_prepare_proc (),
	display_proc (Dict_aa),
%%
	text_write_proc (File_out,Dict_aa),
%%
	Str_end = unicode:characters_to_binary("*** 終了 ***\n", utf8),
	io:format (Str_end).
%%
%% ----------------------------------------------------------------
data_prepare_proc ()->
	[
	{t2381,{{name,"名古屋"},{population,74541},{date_mod,"1996-11-17"}}},
	{t2382,{{name,"豊橋"},{population,67153},{date_mod,"1996-1-14"}}},
	{t2383,{{name,"岡崎"},{population,59286},{date_mod,"1996-5-25"}}},
	{t2384,{{name,"一宮"},{population,38652},{date_mod,"1996-4-15"}}},
	{t2385,{{name,"蒲郡"},{population,72381},{date_mod,"1996-8-30"}}},
	{t2386,{{name,"常滑"},{population,81934},{date_mod,"1996-7-12"}}},
	{t2387,{{name,"大府"},{population,56872},{date_mod,"1996-9-21"}}},
	{t2388,{{name,"瀬戸"},{population,29351},{date_mod,"1996-3-18"}}},
	{t2389,{{name,"犬山"},{population,93456},{date_mod,"1996-7-24"}}}
	].
%% ----------------------------------------------------------------
