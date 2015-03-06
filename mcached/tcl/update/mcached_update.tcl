#! /usr/bin/tclsh
#
#	mcached_update.tcl
#
#					Feb/10/2015
#
# ---------------------------------------------------------------
package require json
source /var/www/data_base/common/tcl_common/json_manipulate.tcl
source /var/www/data_base/common/tcl_common/mcached_manipulate.tcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
set key_in [lindex $argv 0]
set population_in [lindex $argv 1]
puts $key_in
puts $population_in
#
set server "localhost"
set port 11211
#
mcached_update_proc $server $port $key_in $population_in
#
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
