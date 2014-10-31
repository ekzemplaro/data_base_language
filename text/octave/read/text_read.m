#! /usr/bin/octave -qf
#
#	text_read.m
#
#					Oct/31/2014
#
# ------------------------------------------------------------------
printf ("*** 開始 ***\n");
arg_list = argv ();
filename = arg_list{1};
#
fid = fopen (filename, "r");
while (! feof (fid) )
	text_line = fgetl (fid);
	disp (text_line);
endwhile
#
fclose (fid);
#
printf ("*** 終了 ***\n");
# ------------------------------------------------------------------
