#! /usr/bin/tclsh
#
#	redis_update.tcl
#
#					Jan/05/2015
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

set host "host_dbase"
set port 6379
set io [socket $host $port]

#
puts $io "get $key"
flush $io
set aa [gets $io]
puts $aa
if {$aa != "$-1"} {
	set json_str [gets $io]
	puts $json_str
	set json_new [json_str_update_proc $json_str $population_in]
	puts $json_new
	set command [join [list "set " $key " " $json_new] {}]
	puts $command
	puts $io $command
	flush $io
	set aa [gets $io]
	puts $aa
}
#
#	mcached_set_proc $io $key $json_new
#	}
#
close $io

puts "*** 終了 ***"
# ---------------------------------------------------------------
