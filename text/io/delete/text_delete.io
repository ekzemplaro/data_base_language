#! /usr/bin/io
// -------------------------------------------------------
//	text_delete.io
//
//					Oct/28/2014
//
// -------------------------------------------------------
doFile ("/var/www/data_base/common/io_common/text_manipulate.io")
doFile ("/var/www/data_base/common/io_common/file_io.io")
// -------------------------------------------------------
writeln ("*** 開始 ***")
ll := System args
writeln (ll)

file_text := ll at (1)
key := ll at (2)
writeln (file_text)
writeln (key)
//
str_in := file_to_str_proc (file_text)

delimit := "\t"
dict_aa := str_to_dict_proc (str_in,delimit)

writeln (dict_aa size)
dict_aa removeAt (key)
writeln (dict_aa size)

str_out := dict_to_str_proc (dict_aa,delimit)

file_write_proc (file_text,str_out)

dict_display_proc (dict_aa)

writeln ("*** 終了 ***")
// -------------------------------------------------------
