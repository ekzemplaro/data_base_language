#! /usr/bin/tclsh
#
#	mysql_delete.tcl
#
#					Jul/16/2011
#
# ---------------------------------------------------------------
package require mysqltcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
#
set id_in [lindex $argv 0]
puts $id_in
#
set con [mysqlconnect -host host_mysql -port 3306 \
  -user scott -password tiger -db city -encoding utf-8]
#
mysqlexec $con "set NAMES utf8"
#
set sql "delete from cities where id = '$id_in'"

puts $sql
set rowcount [mysqlexec $con $sql]
puts "${rowcount} are changed."

mysqlclose $con
#
puts "*** 終了 ***"
#
# ---------------------------------------------------------------
