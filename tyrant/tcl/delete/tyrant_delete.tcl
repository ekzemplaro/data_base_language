#! /usr/bin/tclsh8.5
#
#	tyrant_delete.tcl
#
#					Aug/29/2013
#
# ---------------------------------------------------------------
puts "*** 開始 ***"
set key [lindex $argv 0]
puts $key
#
set port 1978
set io [socket "127.0.0.1" $port]
puts $io "delete $key"
close $io
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
