#! /usr/bin/tclsh
#
#	text_create.tcl
#
#					Apr/23/2014
#
# ---------------------------------------------------------------
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
#
# ---------------------------------------------------------------
proc data_prepare_proc {} {
#
	set dict_aa [dict create]

	set dict_aa [dict_append_proc $dict_aa t2381 名古屋 41976 1982-5-23]
	set dict_aa [dict_append_proc $dict_aa t2382 豊橋 93281 1982-1-24]
	set dict_aa [dict_append_proc $dict_aa t2383 岡崎 35194 1982-8-8]
	set dict_aa [dict_append_proc $dict_aa t2384 一宮 81247 1982-9-15]
	set dict_aa [dict_append_proc $dict_aa t2385 蒲郡 27839 1982-10-17]
	set dict_aa [dict_append_proc $dict_aa t2386 常滑 36157 1982-5-21]
	set dict_aa [dict_append_proc $dict_aa t2387 大府 64392 1982-9-8]
	set dict_aa [dict_append_proc $dict_aa t2388 瀬戸 59731 1982-6-14]
	set dict_aa [dict_append_proc $dict_aa t2389 犬山 18635 1982-4-29]

	return	$dict_aa
}
#
# ---------------------------------------------------------------
puts "*** 開始 ***"
set fname_out [lindex $argv 0]
#
set dict_aa [data_prepare_proc]
#
text_write_proc $fname_out $dict_aa
#
dict_display_proc $dict_aa
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
