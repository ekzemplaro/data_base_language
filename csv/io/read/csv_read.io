#! /usr/bin/io
// -------------------------------------------------------
//	csv_read.io
//
//					Oct/28/2014
//
// -------------------------------------------------------
doFile ("/var/www/data_base/common/io_common/text_manipulate.io")
// -------------------------------------------------------
writeln ("*** 開始 ***")
ll := System args
writeln (ll)

file_in := ll at (1)
writeln (file_in)
//
str_in := File open (file_in) contents

delimit := ","
dict_aa := str_to_dict_proc (str_in,delimit)

dict_display_proc (dict_aa)

writeln ("*** 終了 ***")
// -------------------------------------------------------
