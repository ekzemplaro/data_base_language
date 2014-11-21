#! /usr/bin/octave -qf
#
#	text_read.m
#
#					Nov/11/2014
#
# ------------------------------------------------------------------
printf ("*** 開始 ***\n")
path (path, "/var/www/data_base/common/octave_common");
arg_list = argv ();
file_in = arg_list{1};
#
dict_aa = struct;
dict_aa = text_read_proc (file_in)
dict_display_proc (dict_aa)
printf ("*** 終了 ***\n")
# ------------------------------------------------------------------
