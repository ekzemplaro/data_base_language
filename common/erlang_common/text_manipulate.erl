%% -----------------------------------------------------------
%%	text_manipulate.erl
%%
%%					Sep/26/2011
%% -----------------------------------------------------------
-module (text_manipulate).
-export ([text_read_proc/1,display_proc/1,text_write_proc/2]).
-export ([dict_update_proc/3]).
-export ([dict_delete_proc/2]).
-export ([csv_read_proc/1,csv_write_proc/2]).
%% -----------------------------------------------------------
text_read_proc (Fname_in)->
	Delimit = "\t\n",
	Lout = [],
	{ok,S}=file:open(Fname_in,read),
	L1=read_single_line_proc (S,Lout,Delimit),
	file:close (S),
	L1.
%%
%% -----------------------------------------------------------
read_single_line_proc (S,Lout,Delimit)->
	case io:get_line (S,'') of
	eof ->
		Lout;
	Line ->
		Lnew = Lout ++ [data_prepare_single (Line,Delimit)],
		read_single_line_proc (S,Lnew,Delimit)
	end.
%%
%% -----------------------------------------------------------
data_prepare_single (A_in,Delimit)->
	L1=string:tokens (A_in,Delimit),
	[Id,Name,Population,Date_mod]=L1,
	{Id, {{name, Name}, {population, Population},{date_mod, Date_mod}}}.
%% -----------------------------------------------------------
display_proc ([Head|Tail])->
	Outs = convert_to_string_proc (Head),
	io:format (Outs),
	display_proc (Tail);
	display_proc ([]) -> 0.
%% -----------------------------------------------------------
convert_to_string_proc (City_in)->
	{Id,{{_,Name},{_,Population},{_,Date_mod}}} = City_in,
	lists:concat ([Id,"\t",Name,"\t",Population,"\t",Date_mod,"\n"]).
%% -----------------------------------------------------------
text_write_proc (File_out,Dict_aa) ->
	Delimit = "\t",
	text_write_proc_exec (File_out,Dict_aa,Delimit).
%% -----------------------------------------------------------
text_write_proc_exec (File_out,Dict_aa,Delimit) ->
	file:write_file (File_out, ""),
	Ff = fun(X) ->
		{Key,{{_,Name},{_,Population},{_,Date_mod}}} = X,
		Lout = (lists:concat ([Key,Delimit,Name,Delimit,
                        Population,Delimit,Date_mod,"\n"])),
		file:write_file (File_out, Lout, [append])
		end,
%%
	lists:foreach(Ff,Dict_aa).

%% -----------------------------------------------------------
dict_update_proc ([Head|Tail],Id,Population)->
	Hnew = modify_single_proc (Head,Id,Population),
	[Hnew] ++ dict_update_proc (Tail,Id,Population);
	dict_update_proc ([],_,_) -> [].
%% -----------------------------------------------------------
modify_single_proc (H_in,Id_in,Population_in) ->
	{Id,{{_,Name},_,_}} = H_in,
	{Year,Month,Day} = date (),
	Today = lists:concat ([Year,"-",Month,"-",Day]),
	City_new={Id,
		{{name, Name},
		{population, Population_in},
		{date_mod, Today}}},
	Iix = Id,
	if
		Iix == Id_in -> City_new;
		Iix /= Id_in -> H_in
	end.
%% -----------------------------------------------------------
dict_delete_proc (List,Id_in) ->
       Ffp = fun(X) ->
		{Key,_} = X,
		io:format (Key),
		io:format ("\t"),
		io:format (Id_in),
		io:format ("\t"),
		if
			Key =:= Id_in -> io:format ("** match **\n"),
					Rvalue = false;
			true -> io:format ("** not match **\n"),
					 Rvalue =true
		end,
		Rvalue
		end,
%%
	lists:filter (Ffp,List).

%% -----------------------------------------------------------
csv_read_proc (Fname_in)->
	Delimit = ",\n",
	Lout = [],
	{ok,S}=file:open(Fname_in,read),
	L1=read_single_line_proc (S,Lout,Delimit),
	file:close (S),
	L1.
%%
%% -----------------------------------------------------------
csv_write_proc (File_out,Dict_aa) ->
	Delimit = ",",
	text_write_proc_exec (File_out,Dict_aa,Delimit).
%% -----------------------------------------------------------
