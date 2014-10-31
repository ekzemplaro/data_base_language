#! /usr/bin/io
// -------------------------------------------------------
//	text_create.io
//
//					Oct/28/2014
//
// -------------------------------------------------------
doFile ("/var/www/data_base/common/io_common/text_manipulate.io")
doFile ("/var/www/data_base/common/io_common/file_io.io")
// -------------------------------------------------------
data_prepare_proc := method (
	dict_aa := Map clone
	dict_aa = insert_proc (dict_aa,"t2381","名古屋","59732","1983-8-9")
	dict_aa = insert_proc (dict_aa,"t2382","豊橋","82391","1983-7-16")
	dict_aa = insert_proc (dict_aa,"t2383","岡崎","34217","1983-3-5")
	dict_aa = insert_proc (dict_aa,"t2384","一宮","21875","1983-6-8")
	dict_aa = insert_proc (dict_aa,"t2385","蒲郡","15924","1983-10-21")
	dict_aa = insert_proc (dict_aa,"t2386","常滑","92417","1983-5-14")
	dict_aa = insert_proc (dict_aa,"t2387","大府","48123","1983-10-25")
	dict_aa = insert_proc (dict_aa,"t2388","瀬戸","23964","1983-6-18")
	dict_aa = insert_proc (dict_aa,"t2389","犬山","31526","1983-5-9")

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

delimit := "\t"
str_out := dict_to_str_proc (dict_aa,delimit)

file_write_proc (file_out,str_out)

writeln ("*** 終了 ***")
// -------------------------------------------------------
