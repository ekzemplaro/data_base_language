#! /usr/bin/tclsh8.5
#
#	mcached_create.tcl
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

	set dict_aa [dict_append_proc $dict_aa t4761 那覇 62835 1982-9-23]
	set dict_aa [dict_append_proc $dict_aa t4762 宜野湾 81369 1982-4-24]
	set dict_aa [dict_append_proc $dict_aa t4763 石垣 47561 1982-8-8]
	set dict_aa [dict_append_proc $dict_aa t4764 浦添 81247 1982-2-15]
	set dict_aa [dict_append_proc $dict_aa t4765 名護 29731 1982-10-17]
	set dict_aa [dict_append_proc $dict_aa t4766 糸満 36157 1982-5-21]
	set dict_aa [dict_append_proc $dict_aa t4767 沖縄 64392 1982-9-8]
	set dict_aa [dict_append_proc $dict_aa t4768 豊見城 59231 1982-6-14]
	set dict_aa [dict_append_proc $dict_aa t4769 うるま 18935 1982-4-29]

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
set port 1978
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
