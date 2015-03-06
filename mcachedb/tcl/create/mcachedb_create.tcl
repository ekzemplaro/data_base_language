#! /usr/bin/tclsh
#
#	mcachedb_create.tcl
#
#					Feb/11/2015
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
	set dict_aa [dict_append_proc $dict_aa t1523 新発田 32751 1982-8-8]
	set dict_aa [dict_append_proc $dict_aa t1524 上越 81297 1982-2-15]
	set dict_aa [dict_append_proc $dict_aa t1525 糸魚川 26831 1982-10-17]
	set dict_aa [dict_append_proc $dict_aa t1526 加茂 36157 1982-5-21]
	set dict_aa [dict_append_proc $dict_aa t1527 三条 64392 1982-9-8]
	set dict_aa [dict_append_proc $dict_aa t1528 佐渡 59731 1982-6-14]
	set dict_aa [dict_append_proc $dict_aa t1529 柏崎 18935 1982-4-29]
	set dict_aa [dict_append_proc $dict_aa t1530 村上 35172 1982-9-14]
	set dict_aa [dict_append_proc $dict_aa t1531 十日町 72819 1982-2-9]
	set dict_aa [dict_append_proc $dict_aa t1532 五泉 64296 1982-8-21]

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
set server "host_ubuntu1"
set port 21201
#
dict_to_mcached_proc $server $port $dict_aa
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
