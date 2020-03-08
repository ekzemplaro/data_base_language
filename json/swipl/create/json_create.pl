/* ------------------------------------------------------------------- */
/*
	json_create.pl

						Feb/28/2020
*/
/* ------------------------------------------------------------------- */
:- use_module([ library(http/json) ]).
/* ------------------------------------------------------------------- */
data_out_proc(File_out,Dict) :-
	tell(File_out),
	json_write_dict(current_output, Dict),
	told.
/* ------------------------------------------------------------------- */
data_prepare_proc(Dict) :- Dict = _{
	t0921:_{name:"宇都宮", population : 15876, date_mod : '1942-5-16' },
    	t0922:_{name:"小山", population : 81274, date_mod : '1942-7-12' },
    	t0923:_{name:"佐野", population : 71658, date_mod : '1942-9-22' },
    	t0924:_{name:"足利", population : 41359, date_mod : '1942-4-25' },
    	t0925:_{name:"日光", population : 61937, date_mod : '1942-3-28' },
    	t0926:_{name:"下野", population : 91854, date_mod : '1942-1-7' },
    	t0927:_{name:"さくら", population : 21657, date_mod : '1942-2-19' },
    	t0928:_{name:"矢板", population : 51648, date_mod : '1942-5-30' },
    	t0929:_{name:"真岡", population : 18647, date_mod : '1942-6-3' },
    	t0930:_{name:"栃木", population : 96425, date_mod : '1942-7-11' },
    	t0931:_{name:"大田原", population : 32641, date_mod : '1942-8-18' },
    	t0932:_{name:"鹿沼", population : 61342, date_mod : '1942-9-30' },
    	t0933:_{name:"那須塩原", population : 68745, date_mod : '1942-10-20' },
    	t0934:_{name:"那須烏山", population : 61932, date_mod : '1942-12-8' }
	}.

/* ------------------------------------------------------------------- */
:- initialization main.

main(Argv) :-
	format('*** 開始 ***\n'),
	format('Argv: ~w\n', [Argv]),
	[File_out|_] = Argv,
	write(File_out),nl,

	data_prepare_proc(Dict),

	data_out_proc(File_out,Dict),

	format('*** 終了 ***\n'),
	halt.

/* ------------------------------------------------------------------- */
