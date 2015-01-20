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
puts "*** 開始 ***"

set host "host_dbase"
set port 6379
set io [socket $host $port]
#
puts $io "keys *"
flush $io
set aa [gets $io]
set nn [string range $aa 1 end]
#
puts $nn
#
for {set it 0} {$it < $nn} {incr it} {
	set aa [gets $io]
	set bb [gets $io]
#	puts $bb
	set keys($it) $bb
	}

foreach xx [array names keys] {
	set key $keys($xx)
#	puts $key
}

set dict_aa [dict create]

foreach xx [array names keys] {
	set key $keys($xx)
	puts $io "get $key"
	flush $io
	set aa [gets $io]
	set json_str [gets $io]
#	puts $json_str
	set unit_aa [json::json2dict $json_str]
	set name [dict get $unit_aa name]
	set population [dict get $unit_aa population]
	set date_mod [dict get $unit_aa date_mod]
	set dict_aa [dict_append_proc $dict_aa $key $name $population $date_mod]
}
#
dict_display_proc $dict_aa
#
close $io

puts "*** 終了 ***"
# ---------------------------------------------------------------
