#! /usr/bin/tclsh
#
#	maria_delete.tcl
#
#					Nov/17/2014
#
# ---------------------------------------------------------------
package require mysqltcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
#
set id_in [lindex $argv 0]
puts $id_in
#
set con [mysqlconnect -host localhost -port 3306 \
  -user scott -password tiger -db city -encoding utf-8]
#
set sql "delete from cities where id = '$id_in'"
#
puts $sql
set rowcount [mysqlexec $con $sql]
puts "${rowcount} are changed."

mysqlclose $con
#
puts "*** 終了 ***"
#
# ---------------------------------------------------------------
