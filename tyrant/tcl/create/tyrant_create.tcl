#! /usr/bin/tclsh
#
#	mcached_create.tcl
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

	set dict_aa [dict_append_proc $dict_aa t4761 那覇 62875 1982-9-23]
	set dict_aa [dict_append_proc $dict_aa t4762 宜野湾 81369 1982-4-24]
	set dict_aa [dict_append_proc $dict_aa t4763 石垣 47561 1982-8-8]
	set dict_aa [dict_append_proc $dict_aa t4764 浦添 81237 1982-2-15]
	set dict_aa [dict_append_proc $dict_aa t4765 名護 29781 1982-10-17]
	set dict_aa [dict_append_proc $dict_aa t4766 糸満 36147 1982-5-21]
	set dict_aa [dict_append_proc $dict_aa t4767 沖縄 64392 1982-9-8]
	set dict_aa [dict_append_proc $dict_aa t4768 豊見城 59231 1982-6-14]
	set dict_aa [dict_append_proc $dict_aa t4769 うるま 18975 1982-4-29]

	return	$dict_aa
}
#
# ---------------------------------------------------------------
puts "*** 開始 ***"
#
set dict_aa [data_prepare_proc]
#
#
set server "host_ubuntu1"
set port 1978
#
dict_to_mcached_proc $server $port $dict_aa
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
