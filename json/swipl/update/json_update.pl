/* ------------------------------------------------------------------- */
/*
	json_update.pl

						Feb/28/2020
*/
/* ------------------------------------------------------------------- */
:- use_module([ library(http/json) ]).
:- initialization main.
 
/* ------------------------------------------------------------------- */
% [8]:
data_out_proc(File_out,Dict) :-
	tell(File_out),
	json_write_dict(current_output, Dict),
	told.
/* ------------------------------------------------------------------- */
% [6]:
update_proc(Dict,Key_in,Population_in) :-
	dict_keys(Dict,Keys),
	length(Keys,Ll),
	writeln(current_output , Ll),
%
	get_dict(Key_in, Dict, Value),
	writeln(current_output , Value),
	Name = Value.name,
	get_time(TimeStamp),
	stamp_date_time(TimeStamp,DateTime,-32400),
	format_time(atom(Date_today), '%Y-%m-%d', DateTime, posix),
	Value_new = _{date_mod:Date_today,name:Name,population:Population_in},
	writeln(current_output , Value_new),
	b_set_dict(Key_in,Dict,Value_new).
%
/* ------------------------------------------------------------------- */
% [4]:
reading_JSON_term(File_in,Dict) :-
	write(File_in),nl,
	open(File_in, read, Stream, [] ),
	json_read_dict(Stream, Dict, []),
	close(Stream).
%
/* ------------------------------------------------------------------- */
main(Argv) :-
	format('*** 開始 ***\n'),
	format('Argv: ~w\n', [Argv]),
	[File_in|Yy] = Argv,
	[Key_in|Zz] = Yy,
	[Population_in|_] = Zz,
	write(Key_in),nl,
	write(Population_in),nl,
%
	reading_JSON_term(File_in,Dict),
%
	update_proc(Dict,Key_in,Population_in),
%
	data_out_proc(File_in,Dict),	
%
	format('*** 終了 ***\n'),
	halt.
%
/* ------------------------------------------------------------------- */
