#! /usr/bin/tclsh
#
#	mcached_delete.tcl
#
#					Jan/05/2015
#
# ---------------------------------------------------------------
puts "*** 開始 ***"
set key [lindex $argv 0]
puts $key
#
set port 11211
set io [socket "127.0.0.1" $port]
puts $io "delete $key"
close $io
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
