#! /usr/bin/escript
%% ----------------------------------------------------------------
%%	csv_create.erl
%%
%%					Sep/26/2011
%%
%% ----------------------------------------------------------------
-module(text_create).
-import(text_manipulate, [display_proc/1]).
-import(text_manipulate, [csv_write_proc/2]).
%% ----------------------------------------------------------------
main(A) ->
	io:format("*** 開始 ***\n"),
	[Arg0|_]=A,
	File_out = Arg0,
	Dict_aa = data_prepare_proc (),
	display_proc (Dict_aa),
%%
	csv_write_proc (File_out,Dict_aa),
%%
	io:format("*** 終了 ***\n").

%% ----------------------------------------------------------------
data_prepare_proc ()->
	[
	{t1271,{{name,"千葉"},{population,41872},{date_mod,"1996-11-17"}}},
	{t1272,{{name,"勝浦"},{population,15393},{date_mod,"1996-1-14"}}},
	{t1273,{{name,"市原"},{population,59286},{date_mod,"1996-5-25"}}},
	{t1274,{{name,"流山"},{population,38652},{date_mod,"1996-4-15"}}},
	{t1275,{{name,"八千代"},{population,71271},{date_mod,"1996-8-30"}}},
	{t1276,{{name,"我孫子"},{population,81934},{date_mod,"1996-7-12"}}},
	{t1277,{{name,"鴨川"},{population,56872},{date_mod,"1996-9-21"}}},
	{t1278,{{name,"銚子"},{population,29351},{date_mod,"1996-3-18"}}},
	{t1279,{{name,"市川"},{population,93456},{date_mod,"1996-7-24"}}}
	].
%% ----------------------------------------------------------------
