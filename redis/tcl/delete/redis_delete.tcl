#! /usr/bin/tclsh8.5
#
#	redis_delete.tcl
#
#					Aug/29/2013
#
# ---------------------------------------------------------------
puts "*** 開始 ***"
set key [lindex $argv 0]
puts $key
#
set host "host_dbase"
set port 6379
set io [socket $host $port]
puts $io "del $key"
close $io
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
