#! /usr/bin/tclsh8.5
#
#	mcachedb_read.tcl
#
#					Aug/29/2013
#
# ---------------------------------------------------------------
package require json
# ---------------------------------------------------------------
puts "*** 開始 ***"

set port 21201
set io [socket "127.0.0.1" $port]
set keys(0) "t1521"
set keys(1) "t1522"
set keys(2) "t1523"
set keys(3) "t1524"
set keys(4) "t1525"
set keys(5) "t1526"
set keys(6) "t1527"
set keys(7) "t1528"
set keys(8) "t1529"
set keys(9) "t1530"
set keys(10) "t1531"
set keys(11) "t1532"
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
