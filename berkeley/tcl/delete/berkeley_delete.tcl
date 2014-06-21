#! /usr/bin/tclsh8.5
# ---------------------------------------------------------------
#	berkeley_delete.tcl
#
#					Feb/17/2012
#
# ---------------------------------------------------------------
#
#load /usr/lib/x86_64-linux-gnu/libdb_tcl-5.1.so
load /usr/lib/x86_64-linux-gnu/libdb_tcl.so
package require Db_tcl
# ---------------------------------------------------------------
#
puts "*** 開始 ***"
set fname_in [lindex $argv 0]
set key_in [lindex $argv 1]
puts $fname_in
puts $key_in
#
set vvv [berkdb version -string]
puts $vvv
#
berkdb open $fname_in
db0 del $key_in
#
db0 close
puts "*** 終了 ***"
