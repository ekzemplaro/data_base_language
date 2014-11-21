#! /usr/bin/octave -qf
#
#	csv_update.m
#
#					Nov/11/2014
#
# ------------------------------------------------------------------
path (path, "/var/www/data_base/common/octave_common");
# ------------------------------------------------------------------
printf ("*** 開始 ***\n")
arg_list = argv ();
file_txt = arg_list{1};
key_in = arg_list{2};
population_in = arg_list{3};
disp (file_txt)
disp (key_in)
disp (population_in)
#
dict_aa = struct;
dict_aa = csv_read_proc (file_txt)
#
if  (isfield (dict_aa, key_in))
	unit_aa = dict_aa.(key_in)
	unit_aa = setfield (unit_aa, "population", population_in)
	unit_aa = setfield (unit_aa, "date_mod", date ())
	dict_aa = setfield (dict_aa, key_in, unit_aa)
	dict_display_proc (dict_aa)
	csv_write_proc (file_txt,dict_aa)
endif
#
printf ("*** 終了 ***\n")
# ------------------------------------------------------------------
