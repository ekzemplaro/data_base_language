%% -----------------------------------------------------------
%%	file_io.erl
%%
%%					Sep/28/2011
%% -----------------------------------------------------------
-module (file_io).
-export ([file_to_str_proc/1]).
%% -----------------------------------------------------------
file_to_str_proc (File_in) ->
	Lout = [],
	{ok,S}=file:open(File_in,read),
	L1=read_single_line_proc (S,Lout),
	file:close (S),
	lists:concat (L1).
%% -----------------------------------------------------------
read_single_line_proc (S,Lout)->
	case io:get_line (S,'') of
	eof ->
		Lout;
	Line ->
		Lnew = Lout ++ [Line],
		read_single_line_proc (S,Lnew)
	end.
%% -----------------------------------------------------------
