#! /usr/bin/swipl  -f -q
/* ------------------------------------------------------------------- */
/*
	csv_delete.pl

						Oct/19/2018
*/
/* ------------------------------------------------------------------- */
:- initialization main.

% [6-4-8]:
display_line_proc(Dict,Key) :-
	write(current_output ,Key),
	write(current_output ,'\t'),
	write(current_output ,Dict.Key.name),
	write(current_output ,'\t'),
	write(current_output ,Dict.Key.population),
	write(current_output ,'\t'),
	writeln(current_output ,Dict.Key.date_mod).
/* ------------------------------------------------------------------- */
% [6-4]:
print_list(Dict,[]).
print_list(Dict,[Element|List]) :-
	display_line_proc(Dict,Element),
	print_list(Dict,List).

/* ------------------------------------------------------------------- */
% [6]:
display_proc(Dict) :-
	dict_keys(Dict,Keys),
	length(Keys,Ll),
	writeln(current_output , Ll),
	print_list(Dict,Keys).

/* ------------------------------------------------------------------- */
row_to_unit_proc(A,Unit) :-
	row(C1, C2, C3, C4) = A,
	atom(C1),
	Unit = C1:_{'name':C2, 'population': C3, 'date_mod': C4}.
/* ------------------------------------------------------------------- */
row_out_proc(A) :-
	row(C1, C2, C3, C4) = A,
	format('~w\t',C1),
	format('~w\t',C2),
	format('~w\t',C3),
	format('~w\n',C4).
/* ------------------------------------------------------------------- */
main(Argv) :-
	format('*** 開始 ***\n'),
	format('Argv: ~w\n', [Argv]),
	[File_in|Yy] = Argv,
	[Key_in|_] = Yy,
	write(File_in),nl,
	write(Key_in),nl,
%
	csv_read_file(File_in,Rows),
	length(Rows,X),
	write(X),nl,
	format('length: ~w\n', X),
%
%	maplist(row_out_proc,Rows),
%
	maplist(row_to_unit_proc,Rows,Units),
	writeln(Units),
	nth0(0,Units,Aa),
	writeln(Aa),
	nth0(1,Units,Ab),
	writeln(Ab),
%	
	dict_create(Dict,_,Units),
	del_dict(Key_in,Dict,_,Dict_bb),
	dict_keys(Dict_bb,Keys),
	writeln(Keys),
	display_proc(Dict_bb),
	format('*** 終了 ***\n'),
	halt.
/* ------------------------------------------------------------------- */
