%% -----------------------------------------------------------
%%	json_manipulate.erl
%%
%%					Jan/28/2014
%% -----------------------------------------------------------
-module (json_manipulate).
-export ([proplists_display_proc/1]).
-export ([record_parser_proc/2]).
%% -----------------------------------------------------------
proplists_display_proc (JsonData) ->
	Lout = [],
	Ll = proplists:get_keys (JsonData),
	Ff = fun(X) ->
		Lout = Lout ++ [record_parser_proc (JsonData, X)]
		end,
%%
	lists:foreach(Ff,Ll),
	Lout.
%% -----------------------------------------------------------
record_parser_proc (JsonData, Key) ->
	{struct, Unit_aa} = proplists:get_value(Key, JsonData),
        Name = proplists:get_value(<<"name">>, Unit_aa),
        Population = proplists:get_value(<<"population">>, Unit_aa),
        Date_mod = proplists:get_value(<<"date_mod">>, Unit_aa),
        io:format (Key),
        io:format ("\t"),
        io:format (Name),
        io:format ("\t"),
        io:format (integer_to_list (Population)),
        io:format ("\t"),
        io:format (Date_mod),
        io:format ("\n"),
	{Key, {{name, Name}, {population, Population},{date_mod, Date_mod}}}.
%% -----------------------------------------------------------
