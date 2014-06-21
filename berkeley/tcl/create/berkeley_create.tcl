#! /usr/bin/tclsh8.5
#
#	berkeley_create.tcl
#
#					Aug/28/2013
#
# ---------------------------------------------------------------
load /usr/lib/x86_64-linux-gnu/libdb_tcl.so
package require Db_tcl
package require json
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
source /var/www/data_base/common/tcl_common/json_manipulate.tcl
#
# ---------------------------------------------------------------
proc data_prepare_proc {} {
#
	set dict_aa [dict create]

	set dict_aa [dict_append_proc $dict_aa t2451 津 41972 1982-11-23]
	set dict_aa [dict_append_proc $dict_aa t2452 鈴鹿 93681 1982-7-24]
	set dict_aa [dict_append_proc $dict_aa t2453 伊勢 37154 1982-8-8]
	set dict_aa [dict_append_proc $dict_aa t2454 鳥羽 81293 1982-9-15]
	set dict_aa [dict_append_proc $dict_aa t2455 四日市 25839 1982-10-17]
	set dict_aa [dict_append_proc $dict_aa t2456 亀山 36147 1982-5-21]
	set dict_aa [dict_append_proc $dict_aa t2457 尾鷲 64391 1982-9-8]
	set dict_aa [dict_append_proc $dict_aa t2458 桑名 59237 1982-6-14]
	set dict_aa [dict_append_proc $dict_aa t2459 志摩 18935 1982-4-29]
	set dict_aa [dict_append_proc $dict_aa t2460 伊賀 93517 1982-9-14]
	set dict_aa [dict_append_proc $dict_aa t2461 名張 52941 1982-2-8]
	set dict_aa [dict_append_proc $dict_aa t2462 熊野 28136 1982-7-27]

	return	$dict_aa
}
#
# ---------------------------------------------------------------
puts "*** 開始 ***"
set fname_out [lindex $argv 0]
#
berkdb open $fname_out
set dict_aa [data_prepare_proc]
#
dict for {key value} $dict_aa {
	set json_str [json_unit_record_create_proc $value]
	puts $json_str
	db0 put $key $json_str
	}
#
db0 close
#
#dict_display_proc $dict_aa
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
