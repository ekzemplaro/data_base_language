#! /usr/bin/tclsh8.5
#
#	tyrant_read.tcl
#
#					Aug/29/2013
#
# ---------------------------------------------------------------
package require json
# ---------------------------------------------------------------
puts "*** 開始 ***"

set port 1978
set io [socket "127.0.0.1" $port]
set keys(0) "t4761"
set keys(1) "t4762"
set keys(2) "t4763"
set keys(3) "t4764"
set keys(4) "t4765"
set keys(5) "t4766"
set keys(6) "t4767"
set keys(7) "t4768"
set keys(8) "t4769"
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
	puts [format "%s\t%s\t%s\t%s" $key $name $population $date_mod]
	}
}
#
close $io

puts "*** 終了 ***"
# ---------------------------------------------------------------
