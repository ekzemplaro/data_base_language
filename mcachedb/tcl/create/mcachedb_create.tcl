#! /usr/bin/tclsh8.5
#
#	mcachedb_create.tcl
#
#					Aug/29/2013
#
# ---------------------------------------------------------------
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
source /var/www/data_base/common/tcl_common/json_manipulate.tcl
source /var/www/data_base/common/tcl_common/mcached_manipulate.tcl
#
# ---------------------------------------------------------------
proc data_prepare_proc {} {
#
	set dict_aa [dict create]

	set dict_aa [dict_append_proc $dict_aa t1521 新潟 91628 1982-19-23]
	set dict_aa [dict_append_proc $dict_aa t1522 長岡 28436 1982-9-24]
	set dict_aa [dict_append_proc $dict_aa t1523 新発田 52751 1982-8-8]
	set dict_aa [dict_append_proc $dict_aa t1524 上越 81297 1982-2-15]
	set dict_aa [dict_append_proc $dict_aa t1525 糸魚川 26831 1982-10-17]
	set dict_aa [dict_append_proc $dict_aa t1526 加茂 36157 1982-5-21]
	set dict_aa [dict_append_proc $dict_aa t1527 三条 64392 1982-9-8]
	set dict_aa [dict_append_proc $dict_aa t1528 佐渡 59231 1982-6-14]
	set dict_aa [dict_append_proc $dict_aa t1529 柏崎 18935 1982-4-29]
	set dict_aa [dict_append_proc $dict_aa t1530 村上 35472 1982-9-14]
	set dict_aa [dict_append_proc $dict_aa t1531 十日町 72819 1982-2-9]
	set dict_aa [dict_append_proc $dict_aa t1532 五泉 74296 1982-8-21]

	return	$dict_aa
}
#
# ---------------------------------------------------------------
puts "*** 開始 ***"
#
set dict_aa [data_prepare_proc]
#
dict_display_proc $dict_aa
#
set port 21201
set io [socket "127.0.0.1" $port]
#
dict for {key value} $dict_aa {
	puts $key
#
	set json_str [json_unit_record_create_proc $value]
	puts $json_str
	mcached_set_proc $io $key $json_str
}
#
close $io
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
