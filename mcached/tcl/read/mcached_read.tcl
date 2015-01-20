#! /usr/bin/tclsh
#
#	mcached_read.tcl
#
#					Jan/05/2015
#
# ---------------------------------------------------------------
package require json
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
# ---------------------------------------------------------------
proc mcached_to_dict_proc {io keys} {
	set dict_aa [dict create]
#
	foreach xx [array names keys] {
		set key $keys($xx)
		puts $io "get $key"
		flush $io
		set aa [gets $io]
		if {$aa != "END"} {
			set json_str [gets $io]
			set cc [gets $io]
			set unit_aa [json::json2dict $json_str]
			set name [dict get $unit_aa name]
			set population [dict get $unit_aa population]
			set date_mod [dict get $unit_aa date_mod]
			set dict_aa [dict_append_proc $dict_aa $key $name $population $date_mod]
		}
	}

	return	$dict_aa
}

# ---------------------------------------------------------------
puts "*** 開始 ***"

set port 11211
set io [socket "127.0.0.1" $port]
set keys(0) "t1731"
set keys(1) "t1732"
set keys(2) "t1733"
set keys(3) "t1734"
set keys(4) "t1735"
set keys(5) "t1736"
set keys(6) "t1737"
set keys(7) "t1738"
set keys(8) "t1739"
#
set dict_aa [mcached_to_dict_proc $io $keys]
#
close $io
#
dict_display_proc $dict_aa
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
