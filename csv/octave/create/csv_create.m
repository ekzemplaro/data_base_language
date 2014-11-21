#! /usr/bin/octave -qf
#
#	csv_create.m
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
	dict_aa.("t1271") = unit_define_proc ("千葉","63841","1948-2-20");
	dict_aa.("t1272") = unit_define_proc ("勝浦","48915","1948-8-30");
	dict_aa.("t1273") = unit_define_proc ("市原","27384","1948-6-17");
	dict_aa.("t1274") = unit_define_proc ("流山","39152","1948-9-6");
	dict_aa.("t1275") = unit_define_proc ("八千代","42138","1948-8-4");
	dict_aa.("t1276") = unit_define_proc ("我孫子","35497","1948-1-21");
	dict_aa.("t1277") = unit_define_proc ("鴨川","76125","2014-12-31");
	dict_aa.("t1278") = unit_define_proc ("銚子","25691","1948-10-26");
	dict_aa.("t1279") = unit_define_proc ("市川","73182","1948-2-15");
endfunction

# ------------------------------------------------------------------
printf ("*** 開始 ***\n");
arg_list = argv ();
file_out = arg_list{1};
#
dict_aa = data_prepare_proc ()
#
csv_write_proc (file_out,dict_aa);
#
printf ("*** 終了 ***\n");
# ------------------------------------------------------------------
