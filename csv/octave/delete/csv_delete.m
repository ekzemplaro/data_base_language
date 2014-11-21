#! /usr/bin/octave -qf
#
#	csv_delete.m
#
#					Nov/11/2014
#
# ------------------------------------------------------------------
path (path, "/var/www/data_base/common/octave_common");
# ------------------------------------------------------------------
printf ("*** 開始 ***\n")
arg_list = argv ();
file_csv = arg_list{1};
key_in = arg_list{2};
disp (file_csv)
disp (key_in)
#
dict_aa = struct;
dict_aa = csv_read_proc (file_csv)
#
if  (isfield (dict_aa, key_in))
	dict_aa = rmfield (dict_aa, key_in)
	dict_display_proc (dict_aa)
	csv_write_proc (file_csv,dict_aa)
endif
#
printf ("*** 終了 ***\n")
# ------------------------------------------------------------------
