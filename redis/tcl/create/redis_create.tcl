#! /usr/bin/tclsh8.5
#
#	redis_create.tcl
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

	set dict_aa [dict_append_proc $dict_aa t1851 福井 41926 1982-9-10]
	set dict_aa [dict_append_proc $dict_aa t1852 敦賀 97283 1982-6-24]
	set dict_aa [dict_append_proc $dict_aa t1853 小浜 35194 1982-8-8]
	set dict_aa [dict_append_proc $dict_aa t1854 大野 81247 1982-9-15]
	set dict_aa [dict_append_proc $dict_aa t1855 勝山 27839 1982-10-17]
	set dict_aa [dict_append_proc $dict_aa t1856 鯖江 36157 1982-5-21]
	set dict_aa [dict_append_proc $dict_aa t1857 あわら 64392 1982-9-8]
	set dict_aa [dict_append_proc $dict_aa t1858 越前 57231 1982-6-14]
	set dict_aa [dict_append_proc $dict_aa t1859 坂井 89354 1982-4-29]

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
set host "host_dbase"
set port 6379
set io [socket $host $port]
#
dict for {key value} $dict_aa {
#	puts $key
#
	set json_str [json_unit_record_create_proc $value]
	set command [join [list "set " $key " " $json_str] {}]
	puts $command
	puts $io $command
	flush $io
	set aa [gets $io]
	puts $aa
}
#
close $io
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
