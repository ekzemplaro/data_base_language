#! /usr/bin/octave -qf
#
#	text_create.m
#
#					Nov/11/2014
#
# ------------------------------------------------------------------
path (path, "/var/www/data_base/common/octave_common");
# ------------------------------------------------------------------
function unit_aa = unit_define_proc (name,population,date_mod)
	unit_aa.name = name;
	unit_aa.population = population;
	unit_aa.date_mod = date_mod;
endfunction
# ------------------------------------------------------------------
function dict_aa = data_prepare_proc ()
	dict_aa = struct;
	dict_aa.("t2381") = unit_define_proc ("名古屋","72961","1948-4-30");
	dict_aa.("t2382") = unit_define_proc ("豊橋","48915","1948-5-10");
	dict_aa.("t2383") = unit_define_proc ("岡崎","27384","1948-6-14");
	dict_aa.("t2384") = unit_define_proc ("一宮","36912","1948-9-9");
	dict_aa.("t2385") = unit_define_proc ("蒲郡","42138","1948-8-4");
	dict_aa.("t2386") = unit_define_proc ("常滑","35187","1948-1-21");
	dict_aa.("t2387") = unit_define_proc ("大府","76125","2014-12-31");
	dict_aa.("t2388") = unit_define_proc ("瀬戸","25791","1948-10-26");
	dict_aa.("t2389") = unit_define_proc ("犬山","73482","1948-2-15");
endfunction

# ------------------------------------------------------------------
printf ("*** 開始 ***\n");
arg_list = argv ();
file_out = arg_list{1};
#
dict_aa = data_prepare_proc ()
#
text_write_proc (file_out,dict_aa);
#
printf ("*** 終了 ***\n");
# ------------------------------------------------------------------
