#! /usr/bin/io
// -------------------------------------------------------
//	csv_create.io
//
//					Oct/28/2014
//
// -------------------------------------------------------
doFile ("/var/www/data_base/common/io_common/text_manipulate.io")
doFile ("/var/www/data_base/common/io_common/file_io.io")
// -------------------------------------------------------
data_prepare_proc := method (
	dict_aa := Map clone
	dict_aa = insert_proc (dict_aa,"t1271","千葉","39731","1983-6-2")
	dict_aa = insert_proc (dict_aa,"t1272","勝浦","95623","1983-2-12")
	dict_aa = insert_proc (dict_aa,"t1273","市原","34615","1983-3-8")
	dict_aa = insert_proc (dict_aa,"t1274","流山","21875","1983-6-15")
	dict_aa = insert_proc (dict_aa,"t1275","八千代","15924","1983-10-21")
	dict_aa = insert_proc (dict_aa,"t1276","我孫子","92497","1983-5-14")
	dict_aa = insert_proc (dict_aa,"t1277","鴨川","48123","1983-8-25")
	dict_aa = insert_proc (dict_aa,"t1278","銚子","23964","1983-6-18")
	dict_aa = insert_proc (dict_aa,"t1279","市川","71235","1983-5-9")

	return (dict_aa)
)

// -------------------------------------------------------
writeln ("*** 開始 ***")
ll := System args
writeln (ll)
file_out := ll at (1)
writeln (file_out)

dict_aa := data_prepare_proc ()

dict_display_proc (dict_aa)

delimit := ","
str_out := dict_to_str_proc (dict_aa,delimit)

file_write_proc (file_out,str_out)

writeln ("*** 終了 ***")
// -------------------------------------------------------
