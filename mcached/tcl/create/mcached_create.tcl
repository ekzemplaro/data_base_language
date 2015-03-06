#! /usr/bin/tclsh
#
#	mcached_create.tcl
#
#					Feb/10/2015
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

	set dict_aa [dict_append_proc $dict_aa t1731 金沢 97628 1982-1-23]
	set dict_aa [dict_append_proc $dict_aa t1732 輪島 78136 1982-9-24]
	set dict_aa [dict_append_proc $dict_aa t1733 小松 24751 1982-8-8]
	set dict_aa [dict_append_proc $dict_aa t1734 七尾 81247 1982-2-15]
	set dict_aa [dict_append_proc $dict_aa t1735 珠洲 29831 1982-10-17]
	set dict_aa [dict_append_proc $dict_aa t1736 加賀 36157 1982-5-21]
	set dict_aa [dict_append_proc $dict_aa t1737 羽咋 64392 1982-9-8]
	set dict_aa [dict_append_proc $dict_aa t1738 かほく 51738 1982-6-14]
	set dict_aa [dict_append_proc $dict_aa t1739 白山 18249 1982-4-29]

	return	$dict_aa
}

# ---------------------------------------------------------------
puts "*** 開始 ***"
#
set dict_aa [data_prepare_proc]
#
dict_display_proc $dict_aa
#
set server "localhost"
set port 11211
#
dict_to_mcached_proc $server $port $dict_aa
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
