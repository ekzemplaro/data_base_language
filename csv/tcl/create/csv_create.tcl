#! /usr/bin/tclsh
#
#	csv_create.tcl
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

	set dict_aa [dict_append_proc $dict_aa t1271 千葉 28756 1982-9-23]
	set dict_aa [dict_append_proc $dict_aa t1272 勝浦 98671 1982-3-24]
	set dict_aa [dict_append_proc $dict_aa t1273 市原 12854 1982-2-8]
	set dict_aa [dict_append_proc $dict_aa t1274 流山 81246 1982-1-15]
	set dict_aa [dict_append_proc $dict_aa t1275 八千代 29836 1982-10-17]
	set dict_aa [dict_append_proc $dict_aa t1276 我孫子 39567 1982-5-21]
	set dict_aa [dict_append_proc $dict_aa t1277 鴨川 64512 1982-9-8]
	set dict_aa [dict_append_proc $dict_aa t1278 銚子 59238 1982-6-14]
	set dict_aa [dict_append_proc $dict_aa t1279 市川 18975 1982-4-29]

	return	$dict_aa
}
#
# ---------------------------------------------------------------
puts "*** 開始 ***"
set fname_out [lindex $argv 0]
#
set dict_aa [data_prepare_proc]
#
csv_write_proc $fname_out $dict_aa
puts "*** check ***"
#
dict_display_proc $dict_aa
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
