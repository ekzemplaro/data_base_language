#! /usr/bin/tclsh8.5
#
#	mcachedb_update.tcl
#
#					Aug/29/2013
#
# ---------------------------------------------------------------
package require json
source /var/www/data_base/common/tcl_common/json_manipulate.tcl
source /var/www/data_base/common/tcl_common/mcached_manipulate.tcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
set key [lindex $argv 0]
set population_in [lindex $argv 1]
puts $key
puts $population_in

set port 21201
set io [socket "127.0.0.1" $port]
#
puts $io "get $key"
flush $io
set aa [gets $io]
if {$aa != "END"} {
	set json_str [gets $io]
	set cc [gets $io]
#
	set json_new [json_str_update_proc $json_str $population_in]
	mcached_set_proc $io $key $json_new
	}
#
close $io

puts "*** 終了 ***"
# ---------------------------------------------------------------
