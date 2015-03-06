#! /usr/bin/tclsh
#
#	mcachedb_delete.tcl
#
#					Feb/11/2015
#
# ---------------------------------------------------------------
source /var/www/data_base/common/tcl_common/mcached_manipulate.tcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
set key [lindex $argv 0]
puts $key
#
set server "host_ubuntu1"
set port 21201
#
mcached_delete_proc $server $port $key
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
